import 'package:amlak/layout/cubit/cubit.dart';
import 'package:amlak/layout/cubit/states.dart';
import 'package:amlak/modules/main/MainScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'homePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit()..getLowestPrice(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            title: 'Facebook Login',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              appBarTheme: AppBarTheme(
                backgroundColor: Colors.white,
                iconTheme: IconThemeData(
                  color: Colors.lightBlueAccent,
                ),
              ),
              primarySwatch: Colors.blue,
              textTheme: TextTheme(
                bodyText1: TextStyle(
                  color: Colors.black,
                  fontSize: 25.0,
                ),
                bodyText2: TextStyle(
                  color: Colors.lightBlueAccent.shade200,
                  fontSize: 18.0,
                ),
                button: TextStyle(
                  color: Colors.white,
                  fontSize: 15.0,
                ),
              ),
              backgroundColor: Colors.white,
              iconTheme: IconThemeData(
                color: Colors.white,
              ),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                unselectedItemColor: Colors.grey,
                type: BottomNavigationBarType.fixed,
                selectedIconTheme: IconThemeData(
                  color: Colors.lightBlueAccent.shade200,
                ),
              ),
              // buttonTheme: ButtonThemeData(
              //   buttonColor: Colors.blue.shade100,
              // ),
            ),
            home: const MainScreen(),
          );
        },
      ),
    );
  }
}
