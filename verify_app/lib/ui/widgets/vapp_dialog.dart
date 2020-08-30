import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ResponseDialog extends StatelessWidget {
  final String message;
  final Function onPressed;
  final String buttonText;
  final ResponseState state;

  const ResponseDialog({
    Key key,
    @required this.message,
    @required this.onPressed,
    @required this.buttonText,
    @required this.state,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      child: Container(
        width: 364.0,
        height: 257.0,
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset('assets/images/success.svg'),
                  SizedBox(
                    height: 15.0,
                  ),
                  Text(
                    state == ResponseState.success ? 'Succesful' : 'Error',
                    style: TextStyle(fontSize: 24.0, color: Color(0xFF3A3A3A)),
                  ),
                  Text(
                    message,
                    style: TextStyle(fontSize: 16.0, color: Color(0xFFAEAEAE)),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 154.0,
                  height: 50.0,
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: Theme.of(context).primaryColor, width: 1.5),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: FlatButton(
                      onPressed: onPressed,
                      child: Text(
                        buttonText,
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                        ),
                      )),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

enum ResponseState { success, error }
