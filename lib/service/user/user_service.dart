import 'package:phul_ecom_partner/data/static_data/static_data.dart';

class UserService {
  Future<dynamic> userRegistration() async {}

  Future<List<UserAddressModal>> fetchUserAddressList() async {
    return await Future.delayed(const Duration(seconds: 6), () {
      return StaticData.userAddressList;
    });
  }
}
