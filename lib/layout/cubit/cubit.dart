import 'package:amlak/home_page.dart';
import 'package:amlak/layout/cubit/states.dart';
import 'package:amlak/modules/main/MainScreen.dart';
import 'package:amlak/modules/realestate/RealEstateScreen.dart';
import 'package:amlak/modules/search/SearchScreen.dart';
import 'package:amlak/modules/agent/AgentScreen.dart';
import 'package:amlak/modules/settings/SettingScreen.dart';
import 'package:amlak/shared/network/remote/dio_helper.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppIntialState());
  static AppCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;
  List<BottomNavigationBarItem> bottomItems = [
    BottomNavigationBarItem(
      icon: Icon(
        Icons.location_city,
      ),
      label: 'الرئيسيه',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.home_work,
      ),
      label: 'العقارات',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.business_center,
      ),
      label: 'الوكلاء',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.search,
      ),
      label: 'بحث',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.language,
      ),
      label: 'الاعدادات',
    ),
  ];

  List<Widget> Screens = [
    HomePage(),
    RealEstateScreen(),
    AgentScreen(),
    SearchScreen(),
    SettingScreen(),
  ];

  void changeBottomNavBar(int index) {
    currentIndex = index;
    emit(AppBottomNavState());
  }

  List<dynamic> lowestPrice = [];
  void getLowestPrice() {
    emit(AppGetLowestPriceLoadingState());
    DioHelper.getData(
      url: 'wp-json/ml/v1/lowest_properties/1?page=1',
    ).then((value) {
      lowestPrice = value.data;
      //print(value.statusCode);

      emit(AppGetLowestPriceSuccessState());
    }).catchError((error) {
      emit(AppGetLowestPriceErrorState(error));
      print(error.toString());
    });
  }

  List<dynamic> recent = [];
  void getRecent() {
    emit(AppGetRecentLoadingState());
    DioHelper.getData(
      url: 'wp-json/ml/v1/recent_properties/1?page=1',
    ).then((value) {
      recent = value.data;
      //print(value.statusCode);
      //print(recent[0]["type"]["name"]);
      emit(AppGetRecentSuccessState());
    }).catchError((error) {
      emit(AppGetRecentErrorState(error));
      print(error.toString());
    });
  }
}
