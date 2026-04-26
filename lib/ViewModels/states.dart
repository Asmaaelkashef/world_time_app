class WorldTimeStates {}

class WorldTimeInitialState extends WorldTimeStates {}

class LoadingState extends WorldTimeStates {}

class SuccessState extends WorldTimeStates {
  final List<String> timezones;

  SuccessState({required this.timezones,});
}

class ErrorState extends WorldTimeStates {
  final String errorMessage;

  ErrorState({required this.errorMessage});
}