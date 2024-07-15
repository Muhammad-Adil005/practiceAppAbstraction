// Setting up GetIt for dependency injection
import 'package:get_it/get_it.dart';

import '../services/api_service.dart';

// This code is for Dio package
// final locator = GetIt.instance; // This is an instance of the Get It
//
// void setupLocator() {
//   locator.registerSingleton<ApiService>(DioApiService());
// }

// This is for http package
// Setting up GetIt for dependency injection
final locator = GetIt.instance;

void setupLocator() {
  locator.registerSingleton<ApiService>(HttpApiService());
}
