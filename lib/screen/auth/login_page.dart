import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:phul_ecom_partner/widget/form_text_field_checkout.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //final GlobalKey _globalKey = GlobalKey<FormState>();
  final _loginformKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: const Color.fromARGB(221, 43, 43, 43),
      body: SafeArea(
        child: Form(
          key: _loginformKey,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 120,
                    height: 100,
                    child: Image.asset(
                      "assets/interflora-logo-desktop.png",
                      width: 120,
                      height: 100,
                      fit: BoxFit.fill,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const FormTextField(
                    borderColor: Colors.white,
                    fillColors: Color.fromARGB(221, 43, 43, 43),
                    hintText: 'Enter emailId',
                    textType: TextInputType.emailAddress,
                    validator: 'EmailId required',
                    label: 'Email',
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const FormTextField(
                    borderColor: Colors.white,
                    fillColors: Color.fromARGB(221, 43, 43, 43),
                    hintText: 'Enter password',
                    textType: TextInputType.emailAddress,
                    validator: 'Password required',
                    label: 'Password',
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          "forgot password?",
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    color: Colors.white,
                                  ),
                        ),
                      ),
                    ],
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 50.0),
                      elevation: 0.0,
                      backgroundColor: Colors.transparent,
                      foregroundColor: Colors.white,
                      side: const BorderSide(
                        width: 1.0,
                        color: Colors.white,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {
                      // if (context.canPop()) {
                      //   context.pop();
                      // }

                      if (_loginformKey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("Login Successfull")));
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("Login Failed")));
                      }
                    },
                    child: const Text("Log In"),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      TextButton(
                        onPressed: () {
                          context.goNamed('signup');
                        },
                        child: Text(
                          "Don't have account? Sign up",
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
