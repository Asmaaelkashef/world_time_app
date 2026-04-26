import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/ViewModels/cubit.dart';
import 'package:weather_app/services/time_service.dart';
import 'package:weather_app/views/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TimezoneCubit(TimeService())..fetchTimezones(),
      child: MaterialApp(
        home: const HomePage(),
      ),
    );
  }
}