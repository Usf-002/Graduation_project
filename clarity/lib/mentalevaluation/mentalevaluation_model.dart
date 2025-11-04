import 'package:flutter/material.dart';
import 'services/api_service.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class MentalEvaluationModel extends ChangeNotifier {
  final ApiService _apiService = ApiService();
  List<int> features = List<int>.filled(53, 0);
  List<int> selectedAnswers = List<int>.filled(53, -1); // Initialize with -1 to represent no selection
  String condition = '';
  String connectivityStatus = 'Unknown';

  MentalEvaluationModel() {
    checkConnectivity();
  }

  Future<void> checkConnectivity() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    connectivityStatus = connectivityResult == ConnectivityResult.none
        ? 'No Network Connection'
        : 'Connected';
    notifyListeners();
  }

  Future<void> getPrediction() async {
    await checkConnectivity();  // Check connectivity before making the request

    if (connectivityStatus == 'No Network Connection') {
      condition = 'No Network Connection';
      notifyListeners();
      return;
    }

    print('Features: $features');
    try {
      final result = await _apiService.predict(features);
      print('Result: $result');
      condition = result['condition'] ?? 'No condition';
    } catch (e) {
      print('Error occurred: $e');
      condition = 'Error occurred: $e';
    }
    notifyListeners();
  }

  void updateFeature(int index, int value) {
    features[index] = value;
    selectedAnswers[index] = value;
    notifyListeners();
  }
}
