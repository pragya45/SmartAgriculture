import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:my_agri_project/profile/profilescreen.dart';
import 'package:my_agri_project/sensors/phSensor.dart';
import 'package:my_agri_project/viewmodel/auth_view_model.dart';
import 'package:my_agri_project/viewmodel/global_ui.dart';
import 'package:provider/provider.dart';

import 'Dashboard.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}



class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => GlobalUIViewModel()),
        ChangeNotifierProvider(create: (_) => AuthViewModel()),
      ],
      child: GlobalLoaderOverlay(
        useDefaultLoading: false,
        overlayWidget: Center(
          child: Image.asset(
            "images/logo.png",
            height: 100,
            width: 100,
          ),
        ),
        child: Consumer<GlobalUIViewModel>(builder: (context, loader, child) {
          if (loader.isLoading) {
            context.loaderOverlay.show();
          } else {
            context.loaderOverlay.hide();
          }
          return MaterialApp(
              title: 'Smart Agriculture',
              debugShowCheckedModeBanner: false,
              theme: ThemeData(primaryColor: Colors.black),
              initialRoute: "/home",
              routes: {
                "/prof": (BuildContext context) => PHValueSensor(),
                "/home": (BuildContext context) => HomePage(),

              });
        }),
      ),
    );
  }
}
