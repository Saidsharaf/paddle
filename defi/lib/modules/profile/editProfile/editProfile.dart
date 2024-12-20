import 'dart:io';

import 'package:defi/layout/cubitHome/cubit_home.dart';
import 'package:defi/layout/cubitHome/state_home.dart';
import 'package:defi/shared/component/component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PaddleCubit, PaddleStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var userModel = PaddleCubit.get(context).usersModel;
        var coverImage = PaddleCubit.get(context).coverImage;
        var ProfileImage = PaddleCubit.get(context).profileImage;
        var nameController = TextEditingController();
        var bioController = TextEditingController();

        nameController.text = userModel!.name!;
        bioController.text = userModel.bio!;
        return Scaffold(
          appBar: AppBar(
            actions: [
              TextButton(
                onPressed: () {
                  PaddleCubit.get(context).updateInfoUser(
                      bio: bioController.text, name: nameController.text);
                },
                child: Text(
                  "Update",
                  style: TextStyle(
                    color: Color.fromARGB(255, 0, 151, 178),
                  ),
                ),
              ),
              SizedBox(
                width: 20,
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  if (state is paddleProfileUploadLoadingState||state is paddleCoverUploadLoadingState||state is paddleUpdateUserLoadingState)
                    LinearProgressIndicator(
                      color: Color.fromARGB(255, 0, 151, 178),
                    ),
                  if (state is paddleProfileUploadLoadingState ||state is paddleCoverUploadLoadingState||state is paddleUpdateUserLoadingState)
                    SizedBox(
                      height: 5,
                    ),
                  Container(
                    height: 195,
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        Align(
                          alignment: Alignment.topCenter,
                          child: Stack(
                            alignment: AlignmentDirectional.topEnd,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(4),
                                child: Container(
                                  height: 140,
                                  width: double.infinity,
                                  child: coverImage == null
                                      ? Image.network(
                                          PaddleCubit.get(context).usersModel!.cover!,
                                          fit: BoxFit.cover,
                                        )
                                      : Image.file(
                                          File(coverImage.path),
                                          fit: BoxFit.cover,
                                        ),
                                  // decoration: BoxDecoration(
                                  //   borderRadius: BorderRadius.circular(4),
                                  //   // image: DecorationImage(
                                  //   //   image: NetworkImage(
                                  //   //     "https://img.freepik.com/free-photo/young-female-suffering-from-toothache-shirt-skirt-looking-painful_176474-24446.jpg?t=st=1722030467~exp=1722034067~hmac=2d6118395da2dd4aed1a8e12d05e8abcd74a795de344c9a041ff1c10f56e8cb5&w=740",
                                  //   //   ),
                                  //   //   fit: BoxFit.cover,
                                  //   // ),
                                  // ),
                                ),
                              ),
                              CircleAvatar(
                                radius: 17,
                                backgroundColor:
                                    Color.fromARGB(255, 0, 151, 178),
                                child: IconButton(
                                  onPressed: () {
                                    PaddleCubit.get(context).getCoverPicker();
                                  },
                                  icon: Icon(Icons.edit),
                                  iconSize: 18,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Stack(
                          alignment: AlignmentDirectional.bottomEnd,
                          children: [
                            CircleAvatar(
                              radius: 64,
                              backgroundColor:
                                  Theme.of(context).scaffoldBackgroundColor,
                              child: CircleAvatar(
                                  radius: 60,
                                  backgroundImage: ProfileImage == null
                                      ? NetworkImage(
                                          PaddleCubit.get(context).usersModel!.profileImage!,
                                        )
                                      : FileImage(
                                          File(ProfileImage.path),
                                        ) as ImageProvider),
                            ),
                            CircleAvatar(
                              radius: 17,
                              backgroundColor: Color.fromARGB(255, 0, 151, 178),
                              child: IconButton(
                                onPressed: () {
                                  PaddleCubit.get(context).getProfilePicker();
                                },
                                icon: Icon(Icons.edit),
                                iconSize: 18,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  if (PaddleCubit.get(context).profileImage != null ||
                      PaddleCubit.get(context).coverImage != null)
                    SizedBox(
                      height: 15,
                    ),
                  if (PaddleCubit.get(context).profileImage != null ||
                      PaddleCubit.get(context).coverImage != null)
                    Row(
                      children: [
                        if (PaddleCubit.get(context).profileImage != null)
                          Expanded(
                              child: buildBtn(
                                  text: "Update Profile",
                                  onTap: () {
                                    PaddleCubit.get(context).uploadProfileImage(
                                        name: nameController.text,
                                        bio: bioController.text);
                                  })),
                        SizedBox(
                          width: 5,
                        ),
                        if (PaddleCubit.get(context).coverImage != null)
                          Expanded(
                              child:
                                  buildBtn(text: "Update Cover", onTap: () {})),
                      ],
                    ),
                  SizedBox(
                    height: 15,
                  ),
                  defultFormField(
                    controller: nameController,
                    type: TextInputType.name,
                    lable: "Name",
                    prefix: Icons.person_pin_rounded,
                  ),
                  defultFormField(
                    controller: bioController,
                    type: TextInputType.name,
                    lable: "Bio",
                    prefix: Icons.info,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
