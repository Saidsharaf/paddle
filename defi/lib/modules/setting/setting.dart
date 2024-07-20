import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:defi/layout/cubitHome/cubit_home.dart';
import 'package:defi/layout/cubitHome/state_home.dart';
import 'package:defi/shared/component/component.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Setting extends StatelessWidget {
  const Setting({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PaddleCubit, PaddleStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return ConditionalBuilder(
          condition: PaddleCubit.get(context).usersModel != null,
          builder: (context) {
            return Column(
              children: [
                if (!FirebaseAuth.instance.currentUser!.emailVerified)
                  Container(
                    color: Colors.amber.withOpacity(.6),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Row(
                        children: [
                          Icon(Icons.info_outline),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Text("Please verify your Email"),
                          ),
                          //SizedBox(width: 5,),
                          TextButton(
                            onPressed: () {
                              FirebaseAuth.instance.currentUser!
                                  .sendEmailVerification()
                                  .then((value) {
                                showToast(
                                    msg: "check your Mail",
                                    state: toastStates.SUCCESS);
                              }).catchError((err) {});
                            },
                            child: Text(
                              "Send",
                              style: TextStyle(
                                color: Color.fromARGB(255, 0, 151, 178),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
              ],
            );
          },
          fallback: (context) => Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
