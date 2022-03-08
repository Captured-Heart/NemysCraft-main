// ignore_for_file: avoid_unnecessary_containers, sized_box_for_whitespace, prefer_const_literals_to_create_immutables

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:nemy_krafts/MobileMode/mobile.dart';
import 'package:nemy_krafts/Screens/catalogue.dart';
// import 'package:nemy_krafts/Navigation/generated_route.dart';
import 'package:nemy_krafts/Screens/Contact/contact.dart';
import 'package:nemy_krafts/TabletMode/tablet.dart';
import 'package:nemy_krafts/config/config.dart';
import 'package:nemy_krafts/cubit/firebaseurl_cubit.dart';
import 'package:nemy_krafts/Screens/home_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nemy_krafts/responsive.dart';

import 'Screens/About/about.dart';

final config = Configurations();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
    apiKey: config.apiKey,
    appId: config.apiKey,
    messagingSenderId: config.messagingSenderId,
    projectId: config.projectId,
    storageBucket: config.storageBucket
  ));
  runApp(MyApp(
      // appRouter: AppRouter(),
      ));
}

class MyApp extends StatelessWidget {
  MyApp({
    Key? key,
  }) : super(key: key);
  // final AppRouter appRouter;
  // This widget is the root of your application.
  final FirebaseurlCubit _firebaseurlCubit = FirebaseurlCubit();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NemyKrafts Events Decor',
      debugShowCheckedModeBanner: false,
      // onGenerateRoute: appRouter.onGenerateRoute,
      // theme: ThemeData(
      //   primarySwatch: Colors.blue,
      // ),
      routes: {
        '/contact': (context) => BlocProvider.value(
              value: _firebaseurlCubit,
              child: Contact(),
            ),
        '/about': (context) => BlocProvider.value(
              value: _firebaseurlCubit,
              child: About(),
            ),
        '/catalogue': (context) => BlocProvider.value(
              value: _firebaseurlCubit,
              child: CataloguePage(),
            ),
      },
      home: BlocProvider<FirebaseurlCubit>(
          create: (context) => FirebaseurlCubit(),
          child: Responsive(
            desktop: MyHomePage(),
            mobile: MobileMode(),
            tablet: TabletMode(),
          )),
    );
  }
}
