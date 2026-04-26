import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/ViewModels/states.dart';
import 'package:weather_app/services/time_service.dart';

class TimezoneCubit extends Cubit<WorldTimeStates> {
  final TimeService timeService;
  TimezoneCubit(this.timeService) : super(WorldTimeInitialState());

  Future<void> fetchTimezones() async {
    emit(LoadingState());
    try {
      final result = await timeService.fetchTimezones();
      emit(SuccessState(timezones: result));
    } catch (e) {
      emit(ErrorState(errorMessage: e.toString()));
    }
  }

  Future<void> fetchTimeDetails(String timezone) async {
    emit(LoadingState());
    try {
      final result = await timeService.fetchTimeDetail(timezone);
      emit(SuccessState(timezones: [result.timeZone]));
    } catch (e) {
      emit(ErrorState(errorMessage: e.toString()));
    }
  }
}