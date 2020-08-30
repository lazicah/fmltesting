import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:verify_app/core/constants/view_routes.dart';
import 'package:verify_app/ui/helpers/theme/ui_helper.dart';
import 'package:verify_app/ui/widgets/vapp_button.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      persistentFooterButtons: [
        VerifyAppButton(
          title: 'Start Verification',
          onPressed: () {
            Navigator.pushNamed(context, ViewRoutes.verification);
          },
          backgroundColor: Theme.of(context).primaryColor,
        ),
      ],
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(
              height: 40.0,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                color: Color.fromRGBO(4, 102, 200, 0.1),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 16.0,
                        ),
                        Text(
                          'Hello Garry Simmons',
                          style: Theme.of(context).textTheme.headline5.copyWith(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 18.0),
                        ),
                        SizedBox(
                          height: UIhelper.kPaddingS,
                        ),
                        Text(
                          '2 Steps away from your dream laptop',
                          style: Theme.of(context).textTheme.bodyText1.copyWith(
                                color: Color(0xFFAEAEAE),
                              ),
                        ),
                        SizedBox(
                          height: 31.0,
                        ),
                        SvgPicture.asset('assets/images/points.svg'),
                        SizedBox(
                          height: 16.0,
                        ),
                      ],
                    ),
                  ),
                  //Expanded(child: SvgPicture.asset('assets/images/garry.svg'))
                ],
              ),
            ),
            SizedBox(
              height: 16.0,
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 16.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      color: Color(0xFF0466C8),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.notifications_none,
                          color: Colors.white,
                        ),
                        SizedBox(
                          height: UIhelper.kPaddingS,
                        ),
                        Text(
                          '3 new notifications',
                          style: Theme.of(context).textTheme.bodyText1.copyWith(
                                color: Colors.white,
                              ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 17.0,
                ),
                Expanded(
                  child: Material(
                    child: InkWell(
                      onTap: () {},
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 16.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          color: Color(0xFF8504C8),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ImageIcon(
                              AssetImage('assets/images/instruction.png'),
                              color: Colors.white,
                            ),
                            SizedBox(
                              height: UIhelper.kPaddingS,
                            ),
                            Text(
                              'Read Instructions',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  .copyWith(
                                    color: Colors.white,
                                  ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 40.0,
            ),
            Text(
              'Verification Process',
              style: Theme.of(context).textTheme.headline5.copyWith(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 40.0,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.check_circle,
                      size: 15.0,
                      color: Color(0xFF05B169),
                    ),
                    SizedBox(
                      width: UIhelper.kPaddingS,
                    ),
                    Text(
                      'Take a picture and send',
                      style: Theme.of(context).textTheme.bodyText1,
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 7.0),
                  child: SizedBox(
                    width: 15.0,
                    height: 31.0,
                    child: CustomPaint(
                      painter: LineDashedPainter(),
                    ),
                  ),
                ),
                Row(
                  children: [
                    Icon(
                      Icons.check_circle,
                      size: 15.0,
                      color: Color(0xFF05B169),
                    ),
                    SizedBox(
                      width: UIhelper.kPaddingS,
                    ),
                    Text(
                      'Share correct location',
                      style: Theme.of(context).textTheme.bodyText1,
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 7.0),
                  child: SizedBox(
                    height: 31.0,
                    child: CustomPaint(
                      painter: LineDashedPainter(),
                    ),
                  ),
                ),
                Row(
                  children: [
                    Icon(
                      Icons.check_circle,
                      size: 15.0,
                      color: Color(0xFF05B169),
                    ),
                    SizedBox(
                      width: UIhelper.kPaddingS,
                    ),
                    Text(
                      'Expect a verification message',
                      style: Theme.of(context).textTheme.bodyText1,
                    )
                  ],
                ),
                SizedBox(
                  height: 40.0,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class LineDashedPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..strokeWidth = 2
      ..color = Color(0xFF05B169);
    var max = 35;
    var dashWidth = 5;
    var dashSpace = 5;
    double startY = 0;
    while (max >= 0) {
      canvas.drawLine(Offset(0, startY), Offset(0, startY + dashWidth), paint);
      final space = (dashSpace + dashWidth);
      startY += space;
      max -= space;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
