import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:verify_app/core/constants/view_routes.dart';
import 'package:verify_app/ui/anim/fade_in.dart';
import 'package:verify_app/ui/helpers/theme/ui_helper.dart';
import 'package:verify_app/ui/widgets/widgets.dart';

class StartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/images/rext.png'),
              ),
            ),
          ),
          FadeIn(
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Validate Account',
                    style: Theme.of(context)
                        .textTheme
                        .headline4
                        .copyWith(color: Colors.white),
                  ),
                  SizedBox(
                    height: UIhelper.kPaddingS,
                  ),
                  Text(
                    'Confirm account in two steps to qualify for funding',
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1
                        .copyWith(color: Colors.white),
                  ),
                  SizedBox(
                    height: UIhelper.kPaddingM,
                  ),
                  Row(
                    children: [
                      Container(
                        height: 40.0,
                        width: 40.0,
                        child: Icon(
                          MdiIcons.cameraOutline,
                          color: Colors.white,
                        ),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Theme.of(context).primaryColor),
                      ),
                      SizedBox(
                        width: UIhelper.kPaddingM,
                      ),
                      Container(
                        height: 40.0,
                        width: 40.0,
                        child: Icon(
                          Icons.location_on,
                          color: Colors.white,
                        ),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Theme.of(context).primaryColor),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  VerifyAppButton(
                    title: 'Get Started',
                    width: 364.0,
                    backgroundColor: Theme.of(context).primaryColor,
                    onPressed: () {
                      Navigator.pushNamed(context, ViewRoutes.signin);
                    },
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
