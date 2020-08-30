import 'package:flutter/material.dart';
import 'package:verify_app/ui/helpers/theme/ui_helper.dart';

class VerifyAppTextFieldA extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final Function(String) validator;
  final Function(String) onFieldSubmitted;
  const VerifyAppTextFieldA({
    Key key,
    @required this.label,
    this.controller,
    this.validator,
    this.onFieldSubmitted,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: Theme.of(context).textTheme.bodyText1,
          ),
          SizedBox(
            height: UIhelper.kPaddingS,
          ),
          TextFormField(
            controller: controller,
            validator: validator,
            onFieldSubmitted: onFieldSubmitted,
            decoration: InputDecoration(
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
