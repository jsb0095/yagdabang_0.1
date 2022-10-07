import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'views/app.dart';
import 'binding/init_bindings.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          backgroundColor: Colors.white,
          appBarTheme: const AppBarTheme(
              elevation: 0,
              backgroundColor: Colors.white,
              titleTextStyle: TextStyle(color: Colors.black)),
        ),
        initialBinding: InitBinding(),
        home: const App());
  }
}
