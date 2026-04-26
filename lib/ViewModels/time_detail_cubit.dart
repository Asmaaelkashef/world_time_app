import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/ViewModels/time_detail_state.dart';
import 'package:weather_app/services/time_service.dart';

class TimeDetailCubit extends Cubit<TimeDetailStates> {
  final TimeService timeService;
  TimeDetailCubit(this.timeService) : super(TimeDetailInitialState());

  Future<void> fetchTimeDetail(String timezone) async {
    emit(TimeDetailLoadingState());
    try {
      final result = await timeService.fetchTimeDetail(timezone);
      emit(TimeDetailSuccessState(worldTime: result));
    } catch (e) {
      emit(TimeDetailErrorState(errorMessage: e.toString()));
    }
  }
}