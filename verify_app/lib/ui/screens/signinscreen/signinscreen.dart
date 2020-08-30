import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:verify_app/core/constants/view_routes.dart';
import 'package:verify_app/ui/anim/fade_in_translate.dart';
import 'package:verify_app/ui/helpers/theme/ui_helper.dart';

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
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
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: UIhelper.kPaddingM),
                    child: Column(
                      children: [
                        SizedBox(
                          height: UIhelper.kPaddingL,
                        ),
                        Container(
                          height: 50,
                          width: 364.0,
                          child: FlatButton(
                            onPressed: () {},
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset('assets/images/google.svg',
                                    semanticsLabel: 'google'),
                                SizedBox(
                                  width: UIhelper.kPaddingS,
                                ),
                                Text(
                                  'Sign In with Google',
                                  style: GoogleFonts.droidSans(
                                      fontSize: 16, color: Color(0xFF04172A)),
                                )
                              ],
                            ),
                          ),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.0),
                              border: Border.all(color: Color(0xFF4286F5))),
                        ),
                        SizedBox(
                          height: 16.0,
                        ),
                        Container(
                          height: 50,
                          width: 364.0,
                          child: FlatButton(
                            onPressed: () {},
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset('assets/images/facebook.svg',
                                    semanticsLabel: 'google'),
                                SizedBox(
                                  width: 23.0,
                                ),
                                Text(
                                  'Sign In with Facebook',
                                  style: GoogleFonts.droidSans(
                                      fontSize: 16, color: Colors.white),
                                )
                              ],
                            ),
                          ),
                          decoration: BoxDecoration(
                            color: Color(0xFF3F51B5),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                        SizedBox(
                          height: 16.0,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                height: 1.0,
                                color: Color(0xFFC4C4C4),
                              ),
                            ),
                            SizedBox(
                              width: 16.0,
                            ),
                            Text('or'),
                            SizedBox(
                              width: 16.0,
                            ),
                            Expanded(
                              child: Container(
                                height: 1.0,
                                color: Color(0xFFC4C4C4),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 16.0,
                        ),
                        GestureDetector(
                          onTap: () => Navigator.pushNamed(
                              context, ViewRoutes.singinmanually),
                          child: Text(
                            'Sign In with Username and Password',
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                fontSize: 16.0,
                                color: Theme.of(context).primaryColor),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
