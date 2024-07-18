import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:defi/modules/loginAndRegister/cubitForReg/cubit.dart';
import 'package:defi/modules/loginAndRegister/cubitForReg/state.dart';
import 'package:defi/modules/loginAndRegister/login.dart';
import 'package:defi/shared/component/component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart' as gett;

class Register extends StatelessWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    var userController = TextEditingController();
    var formKey = GlobalKey<FormState>();
    var emailController = TextEditingController();
    var passController = TextEditingController();
    var conPassController = TextEditingController();
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit, RegisterStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = RegisterCubit.get(context);
          return Scaffold(
            body: Center(
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      Image.asset(
                        "assets/images/bg.png",
                        height: 160,
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
                              "SIGN UP",
                              style: TextStyle(
                                fontFamily: "Zuume",
                                fontSize: 45,
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
                              controller: userController,
                              type: TextInputType.name,
                              suffix: Icons.verified_user_rounded,
                              lable: "UserName",
                              msg: "UserName must not be empty",
                            ),
                            defultFormField(
                              controller: emailController,
                              type: TextInputType.emailAddress,
                              suffix: Icons.email,
                              lable: "Email",
                              msg: "Email must not be empty",
                            ),
                            // const SizedBox(
                            //   height: 15,
                            // ),
                            defultFormField(
                              controller: passController,
                              type: TextInputType.visiblePassword,
                              isScure: cubit.ispassword,
                              suffix: cubit.ispassword
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              iconPress: () {
                                cubit.changeShowPass();
                              },
                              lable: "Password",
                              msg: "Password must not be empty",
                              onSumbmit: (p0) {
                                if (formKey.currentState!.validate()) {}
                              },
                            ),
                            defultFormField(
                              controller: conPassController,
                              type: TextInputType.visiblePassword,
                              lable: "Confirm Password",
                              isScure: cubit.isConPassword,
                              suffix: cubit.isConPassword
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              iconPress: () {
                                cubit.changeConPass();
                              },
                              msg: "Password must not be empty",
                              onSumbmit: (p0) {
                                if (formKey.currentState!.validate()) {}
                              },
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            ConditionalBuilder(
                              condition: state is! registerLoadingState,
                              builder: (context) {
                                return Container(
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
                                        cubit.userRegister(
                                          //  username: userController.text,
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
                                        borderRadius:
                                            BorderRadius.circular(50)),
                                    child: Text(
                                      "SIGN UP",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                );
                              },
                              fallback: (context) => Center(
                                child: CircularProgressIndicator(
                                  color: Color.fromARGB(255, 0, 151, 178),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("You are already a member ?"),
                                SizedBox(
                                  width: 10,
                                ),
                                InkWell(
                                  onTap: () {
                                    gett.Get.to(
                                      () => LoginScreen(),
                                      transition: gett.Transition.fade,
                                      duration: Duration(seconds: 1),
                                    );
                                  },
                                  child: Text(
                                    "SIGN IN",
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
