import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/ViewModels/cubit.dart';
import 'package:weather_app/ViewModels/states.dart';
import 'package:weather_app/views/details_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 248, 248, 248),
      body: Column(
        children: [
          const SizedBox(height: 70),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.public,
                size: 34,
                color: const Color.fromARGB(255, 11, 91, 228),
              ),
              const SizedBox(width: 10),
              Text(
                "Time Zone Explorer",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(height: 30),
          Expanded(
            child: BlocBuilder<TimezoneCubit, WorldTimeStates>(
              builder: (context, state) {
                if (state is LoadingState) {
                  return Center(
                    child: CircularProgressIndicator(
                      color: const Color.fromARGB(255, 11, 91, 228),
                    ),
                  );
                }
                if (state is ErrorState) {
                  return Center(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        state.errorMessage,
                        textAlign: TextAlign.center,
                        style: const TextStyle(color: Colors.red),
                      ),
                    ),
                  );
                }
                if (state is SuccessState) {
                  final result = state.timezones;
                  if (result.isEmpty) {
                    return const Center(child: Text('No results found.'));
                  }
                  return ListView.builder(
                    shrinkWrap: true,
                    
                    padding: const EdgeInsets.all(16),
                    itemCount: result.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ResultItem(context, result[index]),
                      );
                    },
                  );
                }
                return const SizedBox(); 
              },
            ),
          ),
        ],
      ),
    );
  }
}

Widget ResultItem(BuildContext context, String timezone) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DetailsPage(timezone: timezone),
        ),
      );
    },
    child: Container(
      height: 80,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(255, 214, 214, 214).withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ListTile(
        leading: const Icon(Icons.public),
        title: Text(timezone.split('/').last),
        subtitle: Text(timezone),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      ),
    ),
  );
}