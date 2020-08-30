import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:verify_app/core/constants/view_routes.dart';
import 'package:verify_app/ui/anim/fade_in_translate.dart';
import 'package:verify_app/ui/helpers/theme/ui_helper.dart';
import 'package:verify_app/ui/widgets/widgets.dart';

class SignInManuallyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      persistentFooterButtons: [
        VerifyAppButton(
          title: 'Sign In',
          width: 364.0,
          backgroundColor: Theme.of(context).primaryColor,
          onPressed: () {
            Navigator.pushNamed(context, ViewRoutes.welcome);
          },
        ),
      ],
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Stack(
          overflow: Overflow.visible,
          children: [
            Positioned(
              right: -70,
              top: -170.61,
              child: FadeInTranslate(
                direction: FadeInDirection.top,
                child: Transform.rotate(
                  angle: 20,
                  child: Container(
                    height: 288.5,
                    width: 332.2,
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.all(
                        Radius.circular(62.66),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SafeArea(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(UIhelper.kPaddingM),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SvgPicture.asset('assets/images/logo3.svg',
                            semanticsLabel: 'Logo'),
                        SizedBox(
                          height: 34.0,
                        ),
                        Text(
                          'Sign In',
                          style: Theme.of(context)
                              .textTheme
                              .headline4
                              .copyWith(color: Color(0xFF3A3A3A)),
                        ),
                        SizedBox(
                          height: UIhelper.kPaddingS,
                        ),
                        Text(
                          'Sign in with your existing user account on fundmyLaptop',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1
                              .copyWith(color: Color(0xFFAEAEAE)),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      padding: const EdgeInsets.symmetric(
                          horizontal: UIhelper.kPaddingM),
                      child: Column(
                        children: [
                          SizedBox(
                            height: UIhelper.kPaddingL,
                          ),
                          VerifyAppTextFieldA(
                            label: 'Email',
                          ),
                          SizedBox(
                            height: 16.0,
                          ),
                          VerifiyAppTextFieldB(
                            label: 'Password',
                          ),
                          SizedBox(
                            height: 16.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Checkbox(value: false, onChanged: (v) {}),
                                  Text(
                                    'Remember me',
                                    style:
                                        Theme.of(context).textTheme.bodyText1,
                                  ),
                                ],
                              ),
                              Text(
                                'Forgot Password',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1
                                    .copyWith(
                                        color: Theme.of(context).primaryColor),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 43.0,
                          ),
                          RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(children: [
                              TextSpan(
                                  text: 'Don\'t have an account? Visit',
                                  style: Theme.of(context).textTheme.bodyText1),
                              TextSpan(
                                text: ' www.fundmylaptop.com',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1
                                    .copyWith(
                                        color: Theme.of(context).primaryColor),
                              )
                            ]),
                          ),
                          SizedBox(
                            height: 40.0,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
