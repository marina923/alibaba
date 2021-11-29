abstract class AppStates {}

class AppIntialState extends AppStates {}

class AppBottomNavState extends AppStates {}

class AppGetLowestPriceSuccessState extends AppStates {}

class AppGetLowestPriceLoadingState extends AppStates {}

class AppGetLowestPriceErrorState extends AppStates {
  final String Error;

  AppGetLowestPriceErrorState(this.Error);
}

class AppGetRecentSuccessState extends AppStates {}

class AppGetRecentLoadingState extends AppStates {}

class AppGetRecentErrorState extends AppStates {
  final String Error;

  AppGetRecentErrorState(this.Error);
}
