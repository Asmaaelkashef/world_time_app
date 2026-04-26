import 'package:weather_app/models/model.dart';

class TimeDetailStates {}

class TimeDetailInitialState extends TimeDetailStates {}

class TimeDetailLoadingState extends TimeDetailStates {}

class TimeDetailSuccessState extends TimeDetailStates {
  final WorldTimeModel worldTime;
  TimeDetailSuccessState({required this.worldTime});
}

class TimeDetailErrorState extends TimeDetailStates {
  final String errorMessage;
  TimeDetailErrorState({required this.errorMessage});
}