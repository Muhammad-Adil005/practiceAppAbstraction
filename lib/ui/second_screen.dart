import 'package:flutter/material.dart';

import '../Di/locator.dart';
import '../services/api_service.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final apiService = locator<ApiService>();
    print('Clicking on Second Screen');

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Second Screen'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            try {
              // Example usage: fetching data using GET request
              final responseData = await apiService
                  .get('https://jsonplaceholder.typicode.com/posts/1');
              print(responseData.toString());
            } catch (error) {
              print('Error: $error');
            }
          },
          child: const Text('Fetch Data'),
        ),
      ),
    );
  }
}
