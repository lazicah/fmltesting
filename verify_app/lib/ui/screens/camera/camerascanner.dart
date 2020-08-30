import 'dart:async';
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:firebase_ml_vision/firebase_ml_vision.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:verify_app/core/utils/scanner.dart';
import 'package:verify_app/ui/anim/fade_in_translate.dart';
import 'package:verify_app/ui/helpers/theme/ui_helper.dart';
import 'package:verify_app/ui/screens/camera/widgets/boxoverlay.dart';
import 'package:verify_app/ui/screens/camera/widgets/facedetectorpainter.dart';
import 'package:verify_app/ui/screens/verificationscreen/verificationmodel.dart';
import 'package:verify_app/ui/widgets/vapp_button.dart';
import 'package:verify_app/ui/widgets/vapp_dialog.dart';

class CameraPreviewScanner extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CameraPreviewScannerState();
}

/// Returns a suitable camera icon for [direction].
IconData getCameraLensIcon(CameraLensDirection direction) {
  switch (direction) {
    case CameraLensDirection.back:
      return Icons.camera_rear;
    case CameraLensDirection.front:
      return Icons.camera_front;
    case CameraLensDirection.external:
      return Icons.camera;
  }
  throw ArgumentError('Unknown lens direction');
}

void logError(String code, String message) =>
    print('Error: $code\nError Message: $message');

class _CameraPreviewScannerState extends State<CameraPreviewScanner> {
  dynamic _scanResults;
  String _status = 'StandBy';
  CameraController _camera;
  bool _isDetecting = false;
  bool _isDeactivate = false;
  VerificationModel _model;
  Key _visibilityKey = UniqueKey();
  String imagePath;
  bool _faceIsInside = false;
  Rect _imageRect = Rect.zero;
  CameraDescription _description;
  List<CameraDescription> cameras = [];
  FaceDetector _faceDetector = FirebaseVision.instance.faceDetector();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    cameras = Provider.of<List<CameraDescription>>(context);
    _model = Provider.of<VerificationModel>(context);
    _description = cameras[0];

    return Scaffold(
      key: _scaffoldKey,
      body: Stack(
        fit: StackFit.passthrough,
        children: <Widget>[
          Container(
            child: _cameraPreviewWidget(),
          ),
          _camera != null
              ? Container(
                  decoration: ShapeDecoration(
                      shape: BoxOverlayShape(
                          imageRect: _imageRect,
                          borderColor: Theme.of(context).primaryColor,
                          borderWidth: 3.0,
                          contains: (val) {
                            _faceIsInside = val;
                          })),
                  child: _buildResults())
              : SizedBox.shrink(),
          Align(
            alignment: Alignment.bottomCenter,
            child: FadeInTranslate(
              direction: FadeInDirection.bottom,
              child: Container(
                color: Colors.white,
                padding: EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    GestureDetector(
                      onTap: showSuccessDialog,
                      child: Text(
                        _status,
                        style: Theme.of(context).textTheme.headline5,
                      ),
                    ),
                    SizedBox(
                      height: UIhelper.kPaddingM,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Expanded(child: _cameraSwitchWidget()),
                        SizedBox(
                          width: UIhelper.kPaddingM,
                        ),
                        Expanded(
                            child: VerifyAppButton(
                          title: 'Take Photo',
                          backgroundColor: Theme.of(context).primaryColor,
                          onPressed: _camera != null &&
                                  _camera.value.isInitialized &&
                                  _faceIsInside
                              ? onTakePictureButtonPressed
                              : null,
                        )),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Display the preview from the camera (or a message if the preview is not available).
  Widget _cameraPreviewWidget() {
    if (_camera == null || !_camera.value.isInitialized) {
      return Center(
        child: Text(
          'Choose a camera',
          style: Theme.of(context).textTheme.headline5,
        ),
      );
    } else {
      return FittedBox(
        alignment: Alignment.center,
        fit: BoxFit.cover,
        child: SizedBox(
          width: _camera.value.previewSize.height * _camera.value.aspectRatio,
          height: _camera.value.previewSize.height,
          child: AspectRatio(
            aspectRatio: _camera.value.aspectRatio,
            child: CameraPreview(_camera),
          ),
        ),
      );
    }
  }

  /// Display a row of toggle to select the camera (or a message if no camera is available).
  Widget _cameraSwitchWidget() {
    if (cameras.isEmpty) {
      return const Text('No camera found');
    } else {
      return Container(
        height: 50.0,
        decoration: BoxDecoration(
          border: Border.all(color: Theme.of(context).primaryColor, width: 1.5),
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: DropdownButton<CameraDescription>(
          hint: Text(
            '  Switch Camera',
            style: TextStyle(color: Theme.of(context).primaryColor),
          ),
          iconEnabledColor: Theme.of(context).primaryColor,
          isExpanded: true,
          underline: SizedBox.shrink(),
          onChanged: (cameraDescription) {
            setState(() {
              _description = cameraDescription;
            });
            onNewCameraSelected(cameraDescription);
          },
          items: List.generate(
            cameras.length,
            (index) => DropdownMenuItem<CameraDescription>(
              value: cameras[index],
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Icon(
                    getCameraLensIcon(cameras[index].lensDirection),
                    color: Theme.of(context).primaryColor,
                  ),
                  SizedBox(
                    width: UIhelper.kPaddingM,
                  ),
                  (Text(
                    cameras[index].lensDirection.toString().split('.').last,
                    style: TextStyle(color: Theme.of(context).primaryColor),
                  ))
                ],
              ),
            ),
          ),
        ),
      );
    }
  }

  Widget _buildResults() {
    const Text noResultsText = Text('No results!');

    if (_scanResults == null ||
        _camera == null ||
        !_camera.value.isInitialized) {
      return noResultsText;
    }

    CustomPainter painter;

    if (_scanResults is! List<Face>) return noResultsText;
    painter = FaceDetectorPainter(
        _camera.value.previewSize.flipped, _scanResults, rect: (val) {
      _imageRect = val;
    });

    return CustomPaint(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Text(
            _faceIsInside
                ? 'Hold still, and Take a Photo'
                : 'Position your face within this square box till its color changes to Green',
            style: TextStyle(color: Colors.white, fontSize: 18),
            textAlign: TextAlign.center,
          ),
        ),
      ),
      painter: painter,
    );
  }

  ///METHODS AND FUNCTIONS
  ///stop streaming
  void _stop(bool silently) {
    print('stopped');
    scheduleMicrotask(() async {
      if (_camera?.value?.isStreamingImages == true && mounted) {
        await _camera.stopImageStream().catchError((_) {});
      }

      if (silently) {
        _isDetecting = false;
      } else {
        setState(() {
          _isDetecting = false;
        });
      }
    });
  }

  ///Start streaming
  void _start() {
    _initializeCamera(_camera.description);
    setState(() {
      _isDetecting = true;
    });
  }

  ///method the handle camera switch
  void onNewCameraSelected(CameraDescription cameraDescription) async {
    if (_camera != null && _camera.value.isStreamingImages) {
      await _camera.stopImageStream();

      await _camera.dispose();
    }
    _camera = CameraController(
      cameraDescription,
      ResolutionPreset.high,
      enableAudio: false,
    );

//    // If the controller is updated then update the UI.
//    _camera.addListener(() {
//      if (mounted) setState(() {});
//      if (_camera.value.hasError) {
//        showInSnackBar('Camera error ${_camera.value.errorDescription}');
//      }
//    });

    try {
      await _camera.initialize();
      _initializeCamera(cameraDescription);
    } on CameraException catch (e) {
      _showCameraException(e);
    }

    Future.delayed(Duration(seconds: 3));
    if (mounted) {
      setState(() {});
    }
  }

  ///initialize camera with new [CameraDescription]
  void _initializeCamera(CameraDescription description) async {
    _camera.startImageStream((CameraImage image) {
      if (_isDetecting) return;
      _isDetecting = true;

      if (mounted && _isDetecting)
        setState(() {
          _status = 'Detecting faces..';
        });

      ScannerUtils.detect(
        image: image,
        detectInImage: _getDetectionMethod(),
        imageRotation: description.sensorOrientation,
      ).then(
        (dynamic results) {
          if (_faceDetector == null) return;
          if (mounted)
            setState(() {
              _scanResults = results;
            });
          for (Face face in _scanResults) {}
        },
      ).whenComplete(() => _isDetecting = false);
    });
  }

  ///Method for firebase detection
  Future<dynamic> Function(FirebaseVisionImage image) _getDetectionMethod() {
    return _faceDetector.processImage;
  }

  String timestamp() => DateTime.now().millisecondsSinceEpoch.toString();

  ///Display SnackBar [String]
  void showInSnackBar(String message) {
    _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text(message)));
  }

  ///Shows a success dialog
  void showSuccessDialog() {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return ResponseDialog(
            message: 'Image capture complete',
            onPressed: () {
              Navigator.pop(context);
              Navigator.pop<String>(context, imagePath);
            },
            state: ResponseState.success,
            buttonText: 'Proceed',
          );
        });
  }

  ///Fires when 'Take Photo' button is pressed
  void onTakePictureButtonPressed() {
    _camera.stopImageStream();

    takePicture().then((String filePath) {
      if (filePath != null) {
        showSuccessDialog();
        _model.setImage(filePath);
      }
      if (mounted) {
        setState(() {
          imagePath = filePath;
        });
        //if (filePath != null) showInSnackBar('Picture saved to $filePath');
      }
    });
  }

  ///Future to take a picture
  Future<String> takePicture() async {
    if (!_camera.value.isInitialized) {
      showInSnackBar('Error: select a camera first.');
      return null;
    }
    final Directory extDir = await getApplicationDocumentsDirectory();
    final String dirPath = '${extDir.path}/Pictures/flutter_test';
    await Directory(dirPath).create(recursive: true);
    final String filePath = '$dirPath/${timestamp()}.jpg';

    if (_camera.value.isTakingPicture) {
      // A capture is already pending, do nothing.
      return null;
    }

    try {
      await _camera.takePicture(filePath);
    } on CameraException catch (e) {
      _showCameraException(e);
      return null;
    }
    return filePath;
  }

  ///Function to show camera exception
  void _showCameraException(CameraException e) {
    logError(e.code, e.description);
    showInSnackBar('Error: ${e.code}\n${e.description}');
  }

  @override
  void dispose() {
    if (_camera != null) {
      _camera.dispose().then((_) {
        _faceDetector.close();
      });
    }

    super.dispose();
  }
}
