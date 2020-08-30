import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:verify_app/core/constants/view_routes.dart';
import 'package:verify_app/ui/helpers/theme/ui_helper.dart';
import 'package:verify_app/ui/widgets/vapp_button.dart';

class TourScreen extends StatefulWidget {
  @override
  _TourScreenState createState() => _TourScreenState();
}

class _TourScreenState extends State<TourScreen> {
  int _index = 0;
  final _headers = [
    'Take a picture and send',
    'Share location',
    'Expect a verification message'
  ];
  final _subHeaders = [
    'Pose for a picture and upload a clear image that would be used for verification',
    'Share either live location or select the location on google map so as to know its a valid address',
    'After all necessary information has been uploaded and submitted for verification, your account would be verified in 1 - 3 days'
  ];

  Widget _buidIndicator(int index) {
    var dots = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        3,
        (index) => Container(
          margin: EdgeInsets.symmetric(horizontal: 3),
          height: 12.0,
          width: 12.0,
          decoration: BoxDecoration(
              color: index == _index
                  ? Color(0xFF0466C8)
                  : Color(0xFF0466C8).withOpacity(0.2),
              borderRadius: BorderRadius.circular(5)),
        ),
      ),
    );
    return dots;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 25.0, horizontal: 25.0),
              child: Text(
                'Step ${_index + 1} of 3',
                style: Theme.of(context)
                    .textTheme
                    .bodyText1
                    .copyWith(color: Color(0xFFAEAEAE)),
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      child: PageView(
                        onPageChanged: (index) {
                          setState(() {
                            _index = index;
                          });
                        },
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Expanded(
                                flex: 1,
                                child: SvgPicture.asset(
                                    'assets/images/upload.svg',
                                    semanticsLabel: 'welcome'),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Expanded(
                                child: Container(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 20.0),
                                  height: 200,
                                  child: Center(
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Expanded(
                                          child: Text(
                                            'Take a picture and send',
                                            textAlign: TextAlign.center,
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline4
                                                .copyWith(
                                                    color: Color(0xFF3A3A3A)),
                                          ),
                                        ),
                                        Expanded(
                                          child: Text(
                                            'Pose for a picture and upload a clear image that would be used for verification',
                                            textAlign: TextAlign.center,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText1
                                                .copyWith(
                                                    color: Color(0xFFAEAEAE)),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Expanded(
                                flex: 1,
                                child: SvgPicture.asset(
                                    'assets/images/location.svg',
                                    semanticsLabel: 'welcome'),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Expanded(
                                child: Container(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 20.0),
                                  height: 200,
                                  child: Center(
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Expanded(
                                          child: Text(
                                            'Share location',
                                            textAlign: TextAlign.center,
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline4
                                                .copyWith(
                                                    color: Color(0xFF3A3A3A)),
                                          ),
                                        ),
                                        Expanded(
                                          child: Text(
                                            'Share either live location or select the location on google map so as to know its a valid address',
                                            textAlign: TextAlign.center,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText1
                                                .copyWith(
                                                    color: Color(0xFFAEAEAE)),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Expanded(
                                flex: 1,
                                child: SvgPicture.asset(
                                    'assets/images/verification.svg',
                                    semanticsLabel: 'welcome'),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Expanded(
                                child: Container(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 20.0),
                                  height: 200,
                                  child: Center(
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Expanded(
                                          child: Text(
                                            'Expect a verification message',
                                            textAlign: TextAlign.center,
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline4
                                                .copyWith(
                                                    color: Color(0xFF3A3A3A)),
                                          ),
                                        ),
                                        Expanded(
                                          child: Text(
                                            'After all necessary information has been uploaded and submitted for verification, your account would be verified in 1 - 3 days',
                                            textAlign: TextAlign.center,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText1
                                                .copyWith(
                                                    color: Color(0xFFAEAEAE)),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: UIhelper.kPaddingM,
                  ),
                  _buidIndicator(_index),
                  SizedBox(
                    height: UIhelper.kPaddingL,
                  ),
                  Text(
                    'Read Instructions',
                    style: Theme.of(context).textTheme.bodyText1.copyWith(
                        color: Theme.of(context).primaryColor,
                        decoration: TextDecoration.underline,
                        fontWeight: FontWeight.w600),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                children: [
                  VerifyAppButton(
                    title: 'Skip',
                    width: 364.0,
                    backgroundColor: Theme.of(context).primaryColor,
                    onPressed: () {
                      Navigator.popAndPushNamed(context, ViewRoutes.home);
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
