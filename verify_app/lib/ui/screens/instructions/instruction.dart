import 'package:flutter/material.dart';
import 'package:verify_app/ui/helpers/theme/ui_helper.dart';

class InstructionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Instructions',
          style: TextStyle(fontSize: 15.0),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications_none),
            onPressed: () {},
          ),
          SizedBox(
            width: UIhelper.kPaddingS,
          ),
          IconButton(
            padding: EdgeInsets.symmetric(vertical: 5.0),
            icon: CircleAvatar(
              backgroundImage: AssetImage('assets/images/chefavatar2.jpg'),
            ),
            onPressed: () {},
          ),
          SizedBox(
            width: UIhelper.kPaddingM,
          ),
        ],
      ),
    );
  }
}
