// ignore_for_file: avoid_unnecessary_containers, sized_box_for_whitespace, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:nemy_krafts/MobileMode/mobile.dart';
import 'package:nemy_krafts/Screens/catalogue.dart';
// import 'package:nemy_krafts/Navigation/generated_route.dart';
import 'package:nemy_krafts/Screens/contact.dart';
import 'package:nemy_krafts/TabletMode/tablet.dart';
import 'package:nemy_krafts/cubit/firebaseurl_cubit.dart';
import 'package:nemy_krafts/Screens/home_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nemy_krafts/responsive.dart';

import 'Screens/about.dart';

void main() {
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
