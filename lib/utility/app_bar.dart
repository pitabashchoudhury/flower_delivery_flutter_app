import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MyAppBar {
  static AppBar myApp(BuildContext context) {
    return AppBar(
      elevation: 0.0,
      leading: Builder(
        builder: (BuildContext context) {
          return IconButton(
            iconSize: 40,
            icon: const Icon(
              Icons.menu,
              color: Colors.white, // Change Custom Drawer Icon Color
            ),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
          );
        },
      ),
      // leading: const Icon(
      //   Icons.menu,
      //   size: 40,
      // ),
      title: Image.asset(
        "assets/interflora-logo-desktop.png",
        width: 70,
        height: 40,
        fit: BoxFit.fill,
      ),
      actions: [
        IconButton(
          icon: Container(
            decoration: BoxDecoration(
              border: Border.all(
                width: 1.0,
                color: Colors.white,
              ),
              borderRadius: BorderRadius.circular(100.0),
            ),
            child: const CircleAvatar(
                radius: 12,
                backgroundColor: Colors.transparent,
                child: Icon(
                  Icons.currency_rupee_sharp,
                  color: Colors.white,
                  size: 20,
                )),
          ),
          onPressed: () {},
        ),
        IconButton(
          onPressed: () {
            context.push(context.namedLocation("favorite"));
          },
          icon: const Icon(
            Icons.favorite_border_outlined,
            color: Colors.white,
          ),
        ),
        IconButton(
          onPressed: () {
            context.push(context.namedLocation("add-to-cart"));
          },
          icon: const Icon(
            Icons.shopping_cart_checkout_outlined,
            color: Colors.white,
          ),
        ),
        IconButton(
          onPressed: () {
            showPopupMenu(context);
          },
          icon: const Icon(
            Icons.account_circle_outlined,
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  static Future<String?> showPopupMenu(BuildContext context) {
    return showMenu<String>(
      context: context,
      position: const RelativeRect.fromLTRB(25.0, 100.0, 0.0,
          0.0), //position where you want to show the menu on screen
      items: [
        const PopupMenuItem<String>(
          //   height: 40,
          value: '1',
          child: ListTile(
            horizontalTitleGap: 0,
            minVerticalPadding: 0,
            contentPadding: EdgeInsets.zero,
            leading: Icon(Icons.person_outline_outlined),
            title: Text('Profile'),
          ),
        ),
        const PopupMenuItem<String>(
          // height: 40,
          value: '2',
          child: ListTile(
              horizontalTitleGap: 0,
              minVerticalPadding: 0,
              contentPadding: EdgeInsets.zero,
              leading: Icon(Icons.list_alt_outlined),
              title: Text('Order History')),
        ),
        const PopupMenuItem<String>(
          //  height: 40,
          value: '3',
          child: ListTile(
            horizontalTitleGap: 0,
            minVerticalPadding: 0,
            contentPadding: EdgeInsets.zero,
            leading: Icon(Icons.wallet_giftcard_outlined),
            title: Text('Wallet'),
          ),
        ),
        PopupMenuItem<String>(
          onTap: () {
            context.push(context.namedLocation("address"));
          },
          // height: 40,
          value: '4',
          child: const ListTile(
            horizontalTitleGap: 0,
            minVerticalPadding: 0,
            contentPadding: EdgeInsets.zero,
            leading: Icon(Icons.location_city_outlined),
            title: Text('Address Book'),
          ),
        ),
        const PopupMenuItem<String>(
          // height: 40,
          value: '4',
          child: ListTile(
            horizontalTitleGap: 0,
            minVerticalPadding: 0,
            contentPadding: EdgeInsets.zero,
            leading: Icon(Icons.place_outlined),
            title: Text('Track Order'),
          ),
        ),
        const PopupMenuItem<String>(
          padding: EdgeInsets.zero,
          height: 2,
          value: '5',
          child: Divider(
            color: Colors.grey,
          ),
        ),
        const PopupMenuItem<String>(
          // height: 40,
          value: '6',
          child: ListTile(
            horizontalTitleGap: 0,
            minVerticalPadding: 0,
            contentPadding: EdgeInsets.zero,
            leading: Icon(Icons.phone_in_talk_outlined),
            title: Text('Contact Us'),
          ),
        ),
        const PopupMenuItem<String>(
          // height: 40,
          value: '7',
          child: ListTile(
            horizontalTitleGap: 0,
            minVerticalPadding: 0,
            contentPadding: EdgeInsets.zero,
            leading: Icon(Icons.gpp_maybe_outlined),
            title: Text('Privacy Policy'),
          ),
        ),
        const PopupMenuItem<String>(
          // height: 40,
          value: '8',
          child: ListTile(
            horizontalTitleGap: 0,
            minVerticalPadding: 0,
            contentPadding: EdgeInsets.zero,
            leading: Icon(Icons.book_online_outlined),
            title: Text('Terms And Condition'),
          ),
        ),
        const PopupMenuItem<String>(
          padding: EdgeInsets.zero,
          height: 2,
          value: '9',
          child: Divider(
            color: Colors.grey,
          ),
        ),
        PopupMenuItem<String>(
          onTap: () {
            context.goNamed('login');
          },
          // height: 40,
          value: '10',
          child: const ListTile(
            horizontalTitleGap: 0,
            minVerticalPadding: 0,
            contentPadding: EdgeInsets.zero,
            leading: Icon(Icons.logout_outlined),
            title: Text('Log In'),
          ),
        ),
      ],
      elevation: 8.0,
    );
  }

  // showPopupMenu(BuildContext context) {
  //   showMenu<String>(
  //     context: context,
  //     position: RelativeRect.fromLTRB(25.0, 25.0, 0.0,
  //         0.0), //position where you want to show the menu on screen
  //     items: [
  //       PopupMenuItem<String>(child: const Text('menu option 1'), value: '1'),
  //       PopupMenuItem<String>(child: const Text('menu option 2'), value: '2'),
  //       PopupMenuItem<String>(child: const Text('menu option 3'), value: '3'),
  //     ],
  //     elevation: 8.0,
  //   );
  //   // .then<void>((String itemSelected) {

  //   //   if (itemSelected == null) return;

  //   //   if(itemSelected == "1"){
  //   //     //code here
  //   //   }else if(itemSelected == "2"){
  //   //     //code here
  //   //   }else{
  //   //     //code here
  //   //   }

  //   // });
  // }
}
