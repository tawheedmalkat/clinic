import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

import '../../../Helpers/Constants/colors.dart';

class AppointmentInfoRow extends StatelessWidget {
  final IconData icon;
  final String text;

  const AppointmentInfoRow({
    Key? key,
    required this.icon,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 50.0),
      child: Row(
        children: [
          Icon(icon, color: Colori.DarkBlue),
          SizedBox(width: 15),
          Text(
            text,
            style: TextStyle(color: Colori.DarkBlue, fontSize: 17),
          ),
        ],
      ),
    );
  }
}
