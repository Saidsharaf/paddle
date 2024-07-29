import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:defi/layout/cubitHome/cubit_home.dart';
import 'package:defi/layout/cubitHome/state_home.dart';
import 'package:defi/modules/profile/editProfile/editProfile.dart';
import 'package:defi/shared/component/component.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PaddleCubit, PaddleStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                height: 195,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        height: 140,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          image: DecorationImage(
                            image: NetworkImage(
                              PaddleCubit.get(context).usersModel!.cover!,
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    CircleAvatar(
                      radius: 64,
                      backgroundColor:
                          Theme.of(context).scaffoldBackgroundColor,
                      child: CircleAvatar(
                        radius: 60,
                        backgroundImage: NetworkImage(
                            PaddleCubit.get(context).usersModel!.profileImage!),
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                PaddleCubit.get(context).usersModel!.name!,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Text(
                PaddleCubit.get(context).usersModel!.bio!,
                style: Theme.of(context).textTheme.bodySmall,
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {},
                      child: Column(
                        children: [
                          Text(
                            "15",
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          Text(
                            "Friends",
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {},
                      child: Column(
                        children: [
                          Text(
                            "15",
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          Text(
                            "Friends",
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {},
                      child: Column(
                        children: [
                          Text(
                            "15",
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          Text(
                            "Friends",
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 40,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black12),
                      ),
                      child: TextButton(
                          onPressed: () {
                            navigate(context, EditProfile());
                          },
                          child: Text(
                            "Edit Profile",
                            style: TextStyle(
                              color: Color.fromARGB(255, 0, 151, 178),
                            ),
                          )),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}



// ConditionalBuilder(
//           condition: PaddleCubit.get(context).usersModel != null,
//           builder: (context) {
//             return Column(
//               children: [
//                 if (!FirebaseAuth.instance.currentUser!.emailVerified)
//                   Container(
//                     color: Colors.amber.withOpacity(.6),
//                     child: Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 20.0),
//                       child: Row(
//                         children: [
//                           Icon(Icons.info_outline),
//                           SizedBox(
//                             width: 10,
//                           ),
//                           Expanded(
//                             child: Text("Please verify your Email"),
//                           ),
//                           //SizedBox(width: 5,),
//                           TextButton(
//                             onPressed: () {
//                               FirebaseAuth.instance.currentUser!
//                                   .sendEmailVerification()
//                                   .then((value) {
//                                 showToast(
//                                     msg: "check your Mail",
//                                     state: toastStates.SUCCESS);
//                               }).catchError((err) {});
//                             },
//                             child: Text(
//                               "Send",
//                               style: TextStyle(
//                                 color: Color.fromARGB(255, 0, 151, 178),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//               ],
//             );
//           },
//           fallback: (context) => Center(child: CircularProgressIndicator()),
//         );