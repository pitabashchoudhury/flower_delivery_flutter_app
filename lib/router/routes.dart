import 'package:go_router/go_router.dart';
import 'package:phul_ecom_partner/router/route_constant.dart';
import 'package:phul_ecom_partner/screen/address_screen.dart';
import 'package:phul_ecom_partner/screen/auth/login_page.dart';
import 'package:phul_ecom_partner/screen/auth/signup_page.dart';
import 'package:phul_ecom_partner/screen/common_layout_flowers.dart';
import 'package:phul_ecom_partner/screen/favorite_screen.dart';
import 'package:phul_ecom_partner/screen/flower_screen.dart';
import 'package:phul_ecom_partner/screen/home_screen.dart';
import 'package:phul_ecom_partner/screen/no_internet.dart';
import 'package:phul_ecom_partner/screen/pager_error.dart';
import 'package:phul_ecom_partner/screen/proceed_to_checkout.dart';
import 'package:phul_ecom_partner/screen/shortlist_cart.dart';

class AppRouter {
  ///bloc
  //static final AddtocartBloc _addtocartBloc = AddtocartBloc();

  static GoRouter router = GoRouter(
    initialLocation: Routes.home,
    errorBuilder: (context, state) {
      return const ErrorScreen();
    },
    redirect: (context, state) {
      const loggedIn = true;
      final loggingIn = state.matchedLocation == Routes.login;
      if (loggedIn) {
        return !loggingIn ? null : Routes.login;
      }
    },
    routes: [
      GoRoute(
          path: Routes.home,
          name: 'home',
          routes: [
            // GoRoute(
            //     path: Routes.login,
            //     name: 'login',
            //     builder: (context, state) {
            //       return const LoginPage();
            //     }),
            GoRoute(
              path: Routes.topSellerRoute,
              name: 'top-seller',
              builder: (context, state) => CommonFlowerPlatforms(
                  heading: state.queryParameters['heading']!),
              routes: [
                GoRoute(
                  path: Routes.flowerdetail,
                  name: 'flower-detail',
                  builder: (context, state) {
                    //  return BlocProvider.value(
                    //   value: _addtocartBloc,
                    //   child: FLowserDetail(
                    //     name: state.pathParameters['name']!,
                    //     ratings: state.queryParameters['ratings']!,
                    //     image: state.queryParameters['image']!,
                    //     itemId: state.queryParameters['itemId']!.toString(),
                    //     price: state.queryParameters['price']!.toString(),
                    //   ),
                    // );
                    return FLowserDetail(
                      name: state.pathParameters['name']!,
                      ratings: state.queryParameters['ratings']!,
                      image: state.queryParameters['image']!,
                      itemId: state.queryParameters['itemId']!.toString(),
                      price: state.queryParameters['price']!.toString(),
                    );
                  },
                ),
              ],
            ),
            GoRoute(
              path: Routes.addToCart,
              name: 'add-to-cart',
              builder: (context, state) {
                return const AddToCardList();
              },
            ),

            GoRoute(
              path: Routes.checkOut,
              name: 'proceed-to-checkout',
              builder: (context, state) {
                return const ProceedToCheckOut();
              },
            ),
            GoRoute(
              path: Routes.favorite,
              name: 'favorite',
              builder: (context, state) {
                return const MyFavoriteCollection();
              },
            ),
            GoRoute(
              path: Routes.myaddress,
              name: 'address',
              builder: (context, state) {
                return const UserAddress();
              },
            ),
          ],
          builder: (context, state) {
            return const HomePage();
          }),
      GoRoute(
          path: Routes.login,
          name: 'login',
          builder: (context, state) {
            return const LoginPage();
          }),
      GoRoute(
          path: Routes.signup,
          name: 'signup',
          builder: (context, state) {
            return const SignUpPage();
          }),
      GoRoute(
          path: Routes.noInternet,
          name: "noInternet",
          builder: (context, state) {
            return const NoInternet();
          }),
    ],
  );
}
