//import 'package:http/http.dart'as http;
import 'package:phul_ecom_partner/data/static_data/static_data.dart';

class TopSellerService {
  Future<List<TopSeller>> fetchTopSellerList() async {
    return await Future.delayed(const Duration(seconds: 10), () {
      return StaticData.topSellers;
    });
  }

  Future<List<TopSeller>> fetchAddressList() async {
    return await Future.delayed(const Duration(seconds: 20), () {
      return StaticData.topSellers;
    });
  }
}
