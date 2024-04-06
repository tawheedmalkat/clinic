import 'package:clinic/Moduls/Appointments/Detailes-appointment/screen-detailes-appointment.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconly/iconly.dart';

import '../../../Helpers/Constants/colors.dart';
class PaymentsScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      ListView.separated(
        itemBuilder: (context, index) {
          return InkWell(
            onTap: (){
              Get.to(DetailesAppointments());
            },
            child: ListTile(
             // leading:Icon(Icons.monetization_on_outlined,color: Colors.blue,size: 30,),
                  //Container(
              //                 width: 60.0,
              //                 height: 60.0,
              //                 decoration: BoxDecoration(
              //
              //                   borderRadius: BorderRadius.circular(15.0),
              //                   // جعل الصورة مربعة الشكل
              //                   image: DecorationImage(
              //                     image: AssetImage("assets/image/botox.jpg"),
              //                     // Replace `productsModel[index].imageUrl` with the actual field containing the image URL in your model
              //                     fit: BoxFit.cover,
              //                   ),
              //
              //                 ),
              //               ),
              title: Row(
                children: [
                  Icon(Icons.monetization_on_outlined,color: Colors.blue,size: 30,),
                  SizedBox(width: 10,),
                  Text("Botox Surgery",
                    style: TextStyle(color: Colori.DarkBlue,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),),
                ],
              ),
              // النص الخاص بالمنتج
              subtitle:
              Padding(
                padding:  EdgeInsets.only(left: 40.0),
                child:Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   Text(
                      "24.6.2024",style: TextStyle(fontSize: 12,color: Colors.grey),
                    ),

                  Text(
                      "\$${300.678}",style: TextStyle(fontSize: 12,color: Colori.maincolor),
                  ),

                ],
              ),



              ),




              // وصف المنتج
              trailing: SizedBox(
                width: 90, // Adjust the width as needed
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,

                  children: [
                    Text("Paid",style: TextStyle(color: Colori.maincolor,),),
                    // Add some spacing between price and rating stars

                  ],
                ),
              ),
            ),
          );
        },
        itemCount:7,
        // استبدال هذا بعدد المنتجات الفعلي في قاعدة البيانات أو المصفوفة
        separatorBuilder: (BuildContext context, int index) {
          return Divider();
        },
      ),

    );
  }
}
