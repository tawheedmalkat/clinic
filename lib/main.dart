import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'Helpers/Constants/colors.dart';
import 'Moduls/Profile/screen-profil.dart';
import 'Moduls/SettingsFolder/Settings.dart';
import 'Moduls/SettingsFolder/language.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,

      home: ProfileScreen(),
      theme: ThemeData.light().copyWith(
        appBarTheme: AppBarTheme(
            backgroundColor: Colors.white,
            foregroundColor: Colori.DarkBlue,
            centerTitle: true,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(
                      AppBar().preferredSize.height*0.5
                  ),
                )
            )
        ),
        primaryColor: Colori.DarkBlue,
       // accentColor: Colors.redAccent,

      ),
      darkTheme: ThemeData.dark().copyWith(
        appBarTheme: AppBarTheme(
            centerTitle: true,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(
                      AppBar().preferredSize.height*0.5
                  ),
                )
            )
        ),
      ),

      themeMode: SettingsController.theme ?
      ThemeMode.dark :
      ThemeMode.light,

      locale:SettingsController.isEn ?
      Locale('en','us'):
      Locale('ar','sy'),
      translations: Languages(),

    );
  }
}

