// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables,

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mrfoodiee/functions/shooping.dart';
import 'package:mrfoodiee/pagess/loginpage.dart';
import 'package:mrfoodiee/pagess/pagelist_page.dart';

import 'package:provider/provider.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(ChangeNotifierProvider(create: (_) => addCart(), child: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final storage = FlutterSecureStorage();
  Future<bool> checklogin() async {
    String? value = await storage.read(key: 'email');
    if (value == null) {
      return false;
    } else {
      return true;
    }
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home: FutureBuilder(
            future: checklogin(),
            builder: ((context, snapshot) {
              if (snapshot.data == false) {
                return Firstpagewelcome();
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Container(
                  child: CircularProgressIndicator(),
                );
              }
              return MainPagelistpage();
            })));
  }
}
//Firstpagewelcome()


