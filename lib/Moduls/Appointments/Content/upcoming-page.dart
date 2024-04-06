import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:lottie/lottie.dart';

import '../../../Helpers/Constants/colors.dart';

class UpComingPage extends StatelessWidget {
  final bool hasAppointments;

  UpComingPage({this.hasAppointments = true});

  @override
  Widget build(BuildContext context) {
    return hasAppointments==false

        ? ListView.separated(
      itemBuilder: (context, index) {
        return ListTile(
          leading: Container(
            width: 60.0,
            height: 60.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              image: DecorationImage(
                image: AssetImage("assets/image/botox.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          title: Text(
            "Botox Appointments",
            style: TextStyle(
              color: Colori.DarkBlue,
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Dr.Murad",
                style: TextStyle(color: Colors.grey, fontSize: 15),
              ),
              Row(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Icon(
                          IconlyBold.calendar,
                          color: Colori.maincolor,
                          size: 15,
                        ),
                        Text(
                          "24.6.2024",
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(width: 10),
                        Icon(
                          IconlyBold.time_circle,
                          color: Colori.maincolor,
                          size: 15,
                        ),
                        Text(
                          "15:30-16:30",
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          trailing: SizedBox(
            width: 90,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "Accepted",
                  style: TextStyle(color: Colori.maincolor),
                ),
              ],
            ),
          ),
        );
      },
      itemCount: 7, // Replace with actual number of appointments
      separatorBuilder: (BuildContext context, int index) {
        return Divider();
      },
    )
        : Column(
      children: [
        SizedBox(height: 70),
        Center(
          child: Lottie.asset(
            'assets/animation/Animation - 1710667676692.json',
            //'assets/animation/Animation - 1710667899676.json',

            height: 200,
            reverse: true,
            repeat: true,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(height: 10),
        Text("There are no Appointments Yet !")
      ],
    );
  }
}
