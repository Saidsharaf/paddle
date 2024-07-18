import 'package:defi/layout/home_layout.dart';
import 'package:defi/modules/loginAndRegister/cubitLogin/cubit.dart';
import 'package:defi/modules/loginAndRegister/cubitLogin/state.dart';
import 'package:defi/modules/loginAndRegister/register.dart';
import 'package:defi/shared/component/component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart' as gett;

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passController = TextEditingController();
    var formKey = GlobalKey<FormState>();
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (context, state) {
          if (state is loginErrorState) {
            showToast(msg: state.error, state: toastStates.ERROR);
          } else if (state is loginSuccessState) {
            navigateAndFinish(context, HomeLayout());
          }
        },
        builder: (context, state) {
          var cubit = LoginCubit.get(context);
          return Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      Image.asset(
                        "assets/images/bg.png",
                        height: 245,
                        fit: BoxFit.fill,
                        width: double.infinity,
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 20, right: 20, top: 25),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "SIGN IN",
                              style: TextStyle(
                                fontFamily: "Zuume",
                                fontSize: 45,
                                letterSpacing: 1,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              " Welcome to Defi",
                              style: TextStyle(
                                fontSize: 18,
                                fontFamily: "Inter",
                                //fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            defultFormField(
                              controller: emailController,
                              type: TextInputType.emailAddress,
                              lable: "Email",
                              suffix: Icons.email,
                              msg: "Email must not be empty",
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            defultFormField(
                              controller: passController,
                              type: TextInputType.visiblePassword,
                              lable: "Password",
                              suffix: Icons.visibility_off,
                              msg: "Password must not be empty",
                              isScure: true,
                              onSumbmit: (p0) {
                                if (formKey.currentState!.validate()) {}
                              },
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 3, left: 3),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                border: Border(
                                  bottom: BorderSide(color: Colors.black),
                                  top: BorderSide(color: Colors.black),
                                  left: BorderSide(color: Colors.black),
                                  right: BorderSide(color: Colors.black),
                                ),
                              ),
                              child: MaterialButton(
                                onPressed: () {
                                  if (formKey.currentState!.validate()) {
                                    cubit.userLogin(
                                      email: emailController.text,
                                      password: passController.text,
                                    );
                                  }
                                },
                                minWidth: double.infinity,
                                height: 55,
                                color: Color.fromARGB(255, 0, 151, 178),
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50)),
                                child: Text(
                                  "SIGN IN",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("You are not a member ?"),
                                SizedBox(
                                  width: 10,
                                ),
                                InkWell(
                                  onTap: () {
                                    gett.Get.to(
                                      () => Register(),
                                      transition: gett.Transition.fade,
                                      duration: Duration(seconds: 1),
                                    );
                                  },
                                  child: Text(
                                    "SIGN UP",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: Color.fromARGB(255, 0, 151, 178),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: Container(
                                width: double.infinity,
                                height: 60,
                                padding: EdgeInsets.only(top: 3, left: 3),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  border: Border(
                                    bottom: BorderSide(color: Colors.black),
                                    top: BorderSide(color: Colors.black),
                                    left: BorderSide(color: Colors.black),
                                    right: BorderSide(color: Colors.black),
                                  ),
                                ),
                                child: MaterialButton(
                                  onPressed: () {
                                    if (formKey.currentState!.validate()) {}
                                  },
                                  minWidth: double.infinity,
                                  height: 55,
                                  color: Color.fromARGB(255, 240, 96, 96),
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50)),
                                  child: Row(
                                    children: [
                                      Image.asset("assets/images/google.png"),
                                      const SizedBox(
                                        width: 12,
                                      ),
                                      const Text(
                                        "Sign in with google",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
