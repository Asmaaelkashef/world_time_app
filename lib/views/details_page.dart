import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/ViewModels/time_detail_cubit.dart';
import 'package:weather_app/ViewModels/time_detail_state.dart';
import 'package:weather_app/services/time_service.dart';

class DetailsPage extends StatelessWidget {
  final String timezone;
  const DetailsPage({super.key, required this.timezone});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TimeDetailCubit(TimeService())
        ..fetchTimeDetail(timezone),
      child: Scaffold(
        appBar: AppBar(
          title: Text(timezone),
        ),
        body: BlocBuilder<TimeDetailCubit, TimeDetailStates>(
          builder: (context, state) {
            if (state is TimeDetailLoadingState) {
              return const Center(child: CircularProgressIndicator(
                color: Color.fromARGB(255, 11, 91, 228),
              ));
            }
            if (state is TimeDetailErrorState) {
              return Center(
                child: Text(
                  state.errorMessage,
                  style: const TextStyle(color: Colors.red),
                ),
              );
            }
            if (state is TimeDetailSuccessState) {
              final data = state.worldTime;
              return Padding(
                padding: const EdgeInsets.all(24.0),
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.public, size: 90, 
                          color: Color.fromARGB(255, 11, 91, 228)),
                      const SizedBox(height: 20),
                      Text('Timezone: ${data.timeZone}',
                          style: const TextStyle(fontSize: 22)),
                      const SizedBox(height: 12),
                      Text('Local Time: ${data.currentLocalTime.split('T').last.substring(0, 8)}',
                          style: const TextStyle(fontSize: 22)),
                      const SizedBox(height: 12),
                      Text('Date: ${data.currentLocalTime.split('T').first}',
                          style: const TextStyle(fontSize: 22)),
                      const SizedBox(height: 12),
                      Text('UTC Offset: ${data.utcOffsetSeconds ~/ 3600} hours',
                          style: const TextStyle(fontSize: 22)),
                    ],
                  ),
                ),
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}