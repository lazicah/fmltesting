import 'package:flutter/material.dart';
import 'package:verify_app/ui/helpers/theme/ui_helper.dart';

class VerifiyAppTextFieldB extends StatefulWidget {
  final String label;
  final TextEditingController controller;
  final Function(String) validator;
  final Function(String) onFieldSubmitted;

  const VerifiyAppTextFieldB(
      {Key key,
      this.label,
      this.controller,
      this.validator,
      this.onFieldSubmitted})
      : super(key: key);
  @override
  _VerifiyAppTextFieldBState createState() => _VerifiyAppTextFieldBState();
}

class _VerifiyAppTextFieldBState extends State<VerifiyAppTextFieldB> {
  bool _isObscured = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.label,
            style: Theme.of(context).textTheme.bodyText1,
          ),
          SizedBox(
            height: UIhelper.kPaddingS,
          ),
          TextFormField(
            obscureText: _isObscured,
            controller: widget.controller,
            validator: widget.validator,
            onFieldSubmitted: widget.onFieldSubmitted,
            decoration: InputDecoration(
                suffixIcon: IconButton(
                  icon: Icon(
                    // Based on passwordVisible state choose the icon
                    _isObscured ? Icons.visibility : Icons.visibility_off,
                    color: Theme.of(context).primaryColorDark,
                  ),
                  onPressed: () {
                    // Update the state i.e. toogle the state of passwordVisible variable
                    setState(() {
                      _isObscured = !_isObscured;
                    });
                  },
                ),
                enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color(0xFF04172A).withOpacity(0.3))),
                focusedBorder: OutlineInputBorder()),
          )
        ],
      ),
    );
  }
}
