import 'package:flutter/material.dart';
import 'package:verify_app/core/enums/view_state.dart';

class VerifyAppButton extends StatelessWidget {
  final String title;
  final Function onPressed;
  final Color backgroundColor;
  final Color textColor;
  final ViewState state;
  final FocusNode focusNode;
  final double width;

  const VerifyAppButton({
    Key key,
    this.title,
    this.onPressed,
    this.backgroundColor,
    this.textColor,
    this.state,
    this.focusNode,
    this.width = 373.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 50,
      child: FlatButton(
        focusNode: focusNode,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
        onPressed: onPressed,
        child: state == ViewState.Busy
            ? CircularProgressIndicator(
                backgroundColor: Colors.white,
                strokeWidth: 2,
              )
            : Text(title),
        color: backgroundColor,
        textColor: Theme.of(context).textTheme.button.color,
      ),
    );
  }
}
