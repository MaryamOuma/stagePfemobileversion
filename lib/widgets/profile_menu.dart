import 'package:flutter/material.dart';
import 'package:flutter_project/shared/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({
    Key? key,
    required this.text,
    required this.icon,
    this.press,
  }) : super(key: key);

  final String text, icon;
  final VoidCallback? press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextButton(
        style: TextButton.styleFrom(
          primary: Color.fromRGBO(175, 190, 34, 1),
          padding: EdgeInsets.all(20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(15),
              bottomRight: Radius.circular(15),
            ),
          ),
          backgroundColor: Color(0xFFF5F6F9),
        ),
        onPressed: press,
        child: Row(
          children: [
            Image.asset(
              icon,
              //color: kPrimaryColor,
              width: 24,
            ),
            SizedBox(width: 20),
            Expanded(child: Text(text)),
            // Icon(Icons.arrow_forward_ios),
          ],
        ),
      ),
    );
  }
}
