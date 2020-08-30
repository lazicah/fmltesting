import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:verify_app/core/constants/view_routes.dart';
import 'package:verify_app/ui/helpers/theme/ui_helper.dart';
import 'package:verify_app/ui/widgets/vapp_button.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(25.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: 40.0,
                    ),
                    SvgPicture.asset('assets/images/welcome.svg',
                        semanticsLabel: 'welcome'),
                    SizedBox(
                      height: 40.0,
                    ),
                    Text(
                      'Welcome',
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .headline4
                          .copyWith(color: Color(0xFF3A3A3A)),
                    ),
                    SizedBox(
                      height: UIhelper.kPaddingS,
                    ),
                    Text(
                      'Welcome Gary Simons',
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .headline5
                          .copyWith(color: Color(0xFFAEAEAE)),
                    ),
                    SizedBox(
                      height: 16.0,
                    ),
                    Text(
                      'Kindly go through the slides to have a quick understanding of the verification process',
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1
                          .copyWith(color: Color(0xFFAEAEAE)),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: VerifyAppButton(
                title: 'Continue',
                width: 364.0,
                backgroundColor: Theme.of(context).primaryColor,
                onPressed: () {
                  Navigator.pushNamed(context, ViewRoutes.on_boarding);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
