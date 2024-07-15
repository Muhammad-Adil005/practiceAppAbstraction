import 'package:flutter/material.dart';
import 'package:practice_app_abstctdp/ui/second_screen.dart';

import '../Di/locator.dart';
import '../services/api_service.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final apiService = locator<ApiService>();
    print('Clicking on home Screen');

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Flutter GetIt Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // This code is for Dio package
            // ElevatedButton(
            //   onPressed: () async {
            //     try {
            //       // Example usage: fetching data using GET request
            //       final responseData = await apiService
            //           .get('https://jsonplaceholder.typicode.com/posts/1');
            //       print(responseData.toString());
            //     } catch (error) {
            //       print('Error: $error');
            //     }
            //   },
            //   child: const Text('Fetch Data' using Dio),
            // ),

            // This code is for Http package
            ElevatedButton(
              onPressed: () async {
                try {
                  // Example usage: fetching data using GET request
                  final responseData = await apiService
                      .get('https://jsonplaceholder.typicode.com/posts/1');
                  print(responseData);
                } catch (error) {
                  print('Error: $error');
                }
              },
              child: const Text('Fetch Data using HTTP'),
            ),

            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SecondScreen()));
                },
                child: Text('Second Screen')),
          ],
        ),
      ),
    );
  }
}
