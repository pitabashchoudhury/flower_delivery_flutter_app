//import 'package:http/http.dart'as http;

import 'package:phul_ecom_partner/data/static_data/static_data.dart';

class AvailableCity {
  Future<List<String>> fetchAvailableCity() async {
    return await Future.delayed(const Duration(seconds: 10), () {
      return StaticData.availableCity;
    });
  }
}
