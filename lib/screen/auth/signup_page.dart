import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:phul_ecom_partner/blocs/userSession/bloc/userdata_bloc.dart';
import 'package:phul_ecom_partner/widget/form_text_field_checkout.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<SignUpPage> {
  final TextEditingController name = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController mobile = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();
  final _signupformKey = GlobalKey<FormState>();
  bool value = false;
  @override
  void initState() {
    // context.read<UsersessionBloc>().add(const UserStarting());
    super.initState();
  }

  @override
  void dispose() {
    name.clear();
    name.dispose();

    email.clear();
    email.dispose();

    mobile.clear();
    mobile.dispose();

    password.clear();
    password.dispose();

    confirmPassword.clear();
    confirmPassword.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<UserdataBloc, UserdataState>(
      listener: (context, state) {
        if (state is UserSession) {
          showDialog(
              barrierDismissible: false,
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  content: const Text("Registration Successful"),
                  actions: [
                    TextButton(
                        onPressed: () {
                          context.goNamed('login');
                        },
                        child: const Text("Login"))
                  ],
                );
              });
        } else {}
      },
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: const Color.fromARGB(221, 43, 43, 43),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 0.0),
                child: ClipPath(
                  clipper: CustomWidget(),
                  child: Container(
                    clipBehavior: Clip.none,
                    width: MediaQuery.of(context).size.width,
                    height: 180,
                    color: Colors.white,
                    child: Stack(
                      alignment: Alignment.center,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      children: [
                        Positioned(
                          width: MediaQuery.of(context).size.width,
                          height: 100,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 4.0),
                            child: Text(
                              "Wel Come To InterFlora",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30,
                                  ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Form(
                key: _signupformKey,
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
                          height: 10,
                        ),
                        FormTextField(
                          controller: name,
                          borderColor: Colors.white,
                          fillColors: const Color.fromARGB(221, 43, 43, 43),
                          hintText: 'Enter Name',
                          textType: TextInputType.name,
                          validator: 'Name required',
                          label: 'Name',
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        FormTextField(
                          controller: email,
                          borderColor: Colors.white,
                          fillColors: const Color.fromARGB(221, 43, 43, 43),
                          hintText: 'Enter Email',
                          textType: TextInputType.emailAddress,
                          validator: 'Email required',
                          label: 'Email',
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        FormTextField(
                          controller: mobile,
                          borderColor: Colors.white,
                          fillColors: const Color.fromARGB(221, 43, 43, 43),
                          hintText: 'Enter Mobile Number',
                          textType: TextInputType.phone,
                          validator: 'Mobile Number required',
                          label: 'Mobile Number',
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        FormTextField(
                          controller: password,
                          borderColor: Colors.white,
                          fillColors: const Color.fromARGB(221, 43, 43, 43),
                          hintText: 'Enter password',
                          textType: TextInputType.visiblePassword,
                          validator: 'Password required',
                          label: 'Password',
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        FormTextField(
                          controller: confirmPassword,
                          borderColor: Colors.white,
                          fillColors: const Color.fromARGB(221, 43, 43, 43),
                          hintText: 'Confirm password',
                          textType: TextInputType.visiblePassword,
                          validator: 'Password not matched',
                          label: 'Confirm Password',
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CheckboxListTile(
                            selected: value,
                            selectedTileColor: Colors.green,
                            checkboxShape: RoundedRectangleBorder(
                              side: const BorderSide(
                                color: Colors.white,
                              ),
                              borderRadius: BorderRadius.circular(100),
                            ),
                            contentPadding: EdgeInsets.zero,
                            dense: true,
                            shape: RoundedRectangleBorder(
                              //side: const BorderSide(color: Colors.red, width: 1),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            controlAffinity: ListTileControlAffinity.leading,
                            // enabled: true,

                            checkColor: Colors.orange,
                            activeColor: Colors.white,
                            tileColor: Colors.transparent,
                            title: const Text(
                              "By checking this box, you are agreeing to our terms of service.” Or: “I agree to the terms and conditions as set out by the user agreement.",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            value: value,
                            onChanged: (k) {
                              setState(() {
                                value = !value;
                              });
                            }),
                        const SizedBox(
                          height: 10,
                        ),
                        BlocBuilder<UserdataBloc, UserdataState>(
                          builder: (context, state) {
                            if (state is UserLoading) {
                              return const CircularProgressIndicator.adaptive();
                            } else if (state is UserSession) {
                              return GestureDetector(
                                onTap: () {
                                  context
                                      .read<UserdataBloc>()
                                      .add(const UserdataEvent());
                                },
                                child: Container(
                                  color: Colors.green,
                                  width: MediaQuery.of(context).size.width,
                                  height: 100,
                                  child: Column(
                                    children: [
                                      Text(state.name),
                                    ],
                                  ),
                                ),
                              );
                            } else {
                              return ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 50.0),
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

                                  if (_signupformKey.currentState!.validate()) {
                                    context.read<UserdataBloc>().add(
                                        UserRegisterEvent(
                                            name: name.text,
                                            email: email.text,
                                            mobile: int.parse(mobile.text),
                                            password: password.text));
                                    // showDialog(
                                    //     context: context,
                                    //     builder: (context) {
                                    //       return AlertDialog(
                                    //         contentPadding: EdgeInsets.zero,
                                    //         insetPadding: EdgeInsets.zero,
                                    //         content: SizedBox(
                                    //           width: MediaQuery.of(context)
                                    //               .size
                                    //               .width,
                                    //           height: 100,
                                    //           child: Column(
                                    //             children: [
                                    //               Text(name.text),
                                    //               Text(email.text),
                                    //               Text(mobile.text),
                                    //               Text(password.text),
                                    //               Text(confirmPassword.text),
                                    //             ],
                                    //           ),
                                    //         ),
                                    //       );
                                    //     });

                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(
                                            content: Text("Login Failed")));
                                  }
                                },
                                child: const Text("Register"),
                              );
                            }
                          },
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            TextButton(
                              onPressed: () {
                                context.goNamed('login');
                              },
                              child: Text(
                                "Have account? Sign in",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
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
            ],
          ),
        ),
      ),
    );
  }
}

class CustomWidget extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

    path.lineTo(0.0, size.height);

    var firstControlPoint = Offset(size.width * 0.20, size.height);
    var firstEndPoint = Offset(size.width / 2, size.height / 2);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var secondControlPoint = Offset(size.width * 0.7, size.height);
    var secondEndPoint = Offset(size.width, 0.0);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0.0);

    path.close();
    return path;

    // var path = Path();
    // path.moveTo(0.0, size.height * 0.20);
    // path.lineTo(0.0, size.height * 0.60);
    // path.quadraticBezierTo(0, size.height * 0.80, 15, size.height * 0.80);
    // path.lineTo(size.width - 20, size.height * 0.80);
    // path.quadraticBezierTo(
    //     size.width - 10, size.height - 10, size.width, size.height);
    // path.quadraticBezierTo(
    //     size.width - 10, size.height * 0.90, size.width - 10, 15.0);
    // path.quadraticBezierTo(size.width - 12, 0.0, size.width - 30, 0.0);
    // path.lineTo(15.0, 0.0);
    // path.quadraticBezierTo(0.0, 0.0, 0.0, size.height * 0.20);
    // return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
