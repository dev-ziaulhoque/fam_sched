// ignore_for_file: prefer_const_constructors

import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart'; // ✅ Add for Lato font
import 'package:gt_tbb/view/splashView/splashView.dart';

import 'core/network/base_client.dart';
import 'core/network/end_point.dart';
import 'core/utils/App_loader.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /*=======init get storage============================*/
  await GetStorage.init();


  /// Force portrait orientation
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  /// BaseClient initialize
  HttpOverrides.global = MyHttpOverrides();
  BaseClient().init(
    baseUrl: EndPoint.BASE_URL, // Your API URL
    headers: {
      'Content-Type': 'application/json',
      // 'Accept': 'application/json',
    },
    connectTimeout: Duration(seconds: 60),
    receiveTimeout: Duration(seconds: 60),
  );

  /// EasyLoading initialize
  AppLoader.configure();

  // Run the app
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          title: 'GT TBB',
          debugShowCheckedModeBanner: false,
          builder: EasyLoading.init(),
          fallbackLocale: const Locale('en', 'US'),

          // ✅ Default white (light) theme
          theme: ThemeData(
            brightness: Brightness.light,
            scaffoldBackgroundColor: Colors.white,
            primaryColor: Colors.blue,
            appBarTheme: AppBarTheme(
              backgroundColor: Colors.white,
              elevation: 0,
              iconTheme: IconThemeData(color: Colors.black),
              titleTextStyle: GoogleFonts.lato(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            textTheme: GoogleFonts.latoTextTheme(
              Theme.of(context).textTheme,
            ),
          ),

          home: SplashView(),
        );
      },
    );
  }
}
