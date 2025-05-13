import 'package:flutter/material.dart';
import 'package:phul_ecom_partner/data/static_data/static_data.dart';
import 'package:phul_ecom_partner/utility/app_bar_content.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({
    Key? key,
  }) : super(key: key);

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  int count = 3;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
              top: 0.0, left: 8.0, bottom: 8.0, right: 8.0),
          child: ListView(
            padding: const EdgeInsets.all(0.0),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: <Widget>[
              const SizedBox(height: 40),
              Wrap(
                direction: Axis.horizontal,
                alignment: WrapAlignment.spaceAround,
                runAlignment: WrapAlignment.spaceAround,
                children: const [
                  UpperContent(
                    icon: Icons.account_circle_outlined,
                    title: 'Profile',
                  ),
                  UpperContent(
                    icon: Icons.list_alt_outlined,
                    title: 'Order History',
                  ),
                  UpperContent(
                    icon: Icons.wallet_giftcard_outlined,
                    title: 'Wallet',
                  ),
                ],
              ),

              DrawerContent(
                title: 'CITIES',
                cities: StaticData.cities,
              ),
              const SizedBox(
                height: 10,
              ),
              DrawerContent(
                title: "OCCASIONS",
                cities: StaticData.occasions,
              ),
              const SizedBox(
                height: 10,
              ),
              DrawerContent(
                title: "COLLECTIONS",
                cities: StaticData.collections,
              ),

              /// assistance
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  "ASSISTANCE",
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Colors.grey.shade700,
                      ),
                ),
              ),
              Divider(
                thickness: 2,
                color: Colors.grey.shade200,
              ),
              assistance(Icons.account_circle_outlined, "Profile"),
              assistance(Icons.list_alt_outlined, "Order History"),
              assistance(Icons.wallet_giftcard, "Wallet"),
              assistance(Icons.headset_mic_outlined, "Customer Service"),
            ],
          ),
        ),
      ),
    );
  }

  ListTile assistance(IconData icon, String data) {
    return ListTile(
      leading: Icon(icon),
      title: Text(data),
      minLeadingWidth: 1,
      contentPadding: EdgeInsets.zero,
    );
  }
}

class UpperContent extends StatelessWidget {
  const UpperContent({
    Key? key,
    required this.icon,
    required this.title,
  }) : super(key: key);
  final IconData icon;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: Colors.grey.shade200,
          radius: 25,
          child: Center(
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                icon,
                color: Colors.black,
                size: 30,
              ),
            ),
          ),
        ),
        Text(title),
      ],
    );
  }
}
