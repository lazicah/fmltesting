import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:stacked/stacked.dart';
import 'package:verify_app/ui/helpers/theme/ui_helper.dart';
import 'package:verify_app/ui/screens/camera/camerascanner.dart';
import 'package:verify_app/ui/screens/location/location.dart';
import 'package:verify_app/ui/screens/verificationscreen/verificationmodel.dart';
import 'package:verify_app/ui/widgets/vapp_button.dart';

class VerificationScreen extends ViewModelWidget<VerificationModel> {


  @override
  Widget build(BuildContext context, VerificationModel model) {
    return WillPopScope(
      onWillPop:(){
        model.clear();
        return Future.value(true);
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Verification',
            style: TextStyle(fontSize: 15.0),
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.notifications_none),
              onPressed: () {},
            ),
            SizedBox(
              width: UIhelper.kPaddingS,
            ),
            IconButton(
              padding: EdgeInsets.symmetric(vertical: 5.0),
              icon: CircleAvatar(
                backgroundImage: AssetImage('assets/images/chefavatar2.jpg'),
              ),
              onPressed: () {},
            ),
            SizedBox(
              width: UIhelper.kPaddingM,
            ),
          ],
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Step 1',
                textAlign: TextAlign.right,
                style: Theme.of(context)
                    .textTheme
                    .bodyText1
                    .copyWith(color: Color(0xFFAEAEAE)),
              ),
              SizedBox(
                height: 16.0,
              ),
              DottedBorder(
                borderType: BorderType.RRect,
                radius: Radius.circular(5.0),
                padding: EdgeInsets.zero,
                color: Color(0xFFAEAEAE),
                strokeWidth: 1,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5.0),
                  child: FlatButton(
                    onPressed: model.image.isNotEmpty
                        ? null
                        : () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return CameraPreviewScanner();
                              }),
                            );
                          },
                    child: Container(
                      width: 364.0,
                      height: 200,
                      child: model.image.isEmpty
                          ? Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  MdiIcons.cameraOutline,
                                  color: Theme.of(context).primaryColor,
                                ),
                                SizedBox(
                                  height: UIhelper.kPaddingS,
                                ),
                                Text(
                                  'ID Verification',
                                  style: TextStyle(color: Color(0xFFAEAEAE)),
                                ),
                                SizedBox(
                                  height: UIhelper.kPaddingS,
                                ),
                                Text(
                                  'Tap to take a photo',
                                  style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      fontSize: 12.0),
                                )
                              ],
                            )
                          : Image.file(
                              File(model.image),
                              colorBlendMode: BlendMode.colorBurn,
                              fit: BoxFit.cover,
                            ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 24.0,
              ),
              model.image.isNotEmpty
                  ? Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 50.0,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.0),
                                border: Border.all(
                                    color: Theme.of(context).primaryColor)),
                            child: FlatButton(
                              onPressed: () {
                                model.clear();
                              },
                              child: Text(
                                'Again',
                                style: TextStyle(
                                    color: Theme.of(context).primaryColor),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 24.0,
                        ),
                        Expanded(
                          child: VerifyAppButton(
                            title: 'Continue',
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) {
                                  return LocationScreen();
                                }),
                              );
                            },
                            backgroundColor: Theme.of(context).primaryColor,
                          ),
                        )
                      ],
                    )
                  : SizedBox.shrink()
            ],
          ),
        ),
      ),
    );
  }
}
