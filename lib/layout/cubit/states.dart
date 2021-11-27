abstract class AppStates {}

class AppIntialState extends AppStates {}

class AppBottomNavState extends AppStates {}

class AppGetLowestPriceSuccessState extends AppStates {}

class AppGetLowestPriceLoadingState extends AppStates {}

class AppGetLowestPriceErrorState extends AppStates {
  final String Error;

  AppGetLowestPriceErrorState(this.Error);
}
