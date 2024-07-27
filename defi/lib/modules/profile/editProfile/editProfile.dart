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
        var nameController = TextEditingController();
        var bioController = TextEditingController();

        nameController.text = userModel!.name!;
        bioController.text = userModel.bio!;
        return Scaffold(
          appBar: AppBar(),
          body: Padding(
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
                                        "https://img.freepik.com/free-photo/young-female-suffering-from-toothache-shirt-skirt-looking-painful_176474-24446.jpg?t=st=1722030467~exp=1722034067~hmac=2d6118395da2dd4aed1a8e12d05e8abcd74a795de344c9a041ff1c10f56e8cb5&w=740",
                                        fit: BoxFit.cover,
                                      )
                                    : Image.file(File(coverImage.path),fit: BoxFit.cover,),
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
                              backgroundColor: Color.fromARGB(255, 0, 151, 178),
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
                              backgroundImage: NetworkImage(
                                  "https://img.freepik.com/free-photo/close-up-portrait-cheerful-glamour-girl-with-cute-make-up-smiling-white-teeth-looking-happy-camera-standing-blue-background_1258-70300.jpg?t=st=1722029166~exp=1722032766~hmac=18801d6daffe1934bb76c8bfc5de7ab0c058bbe36accc8173d2a7cabd3d70c0d&w=740"),
                            ),
                          ),
                          CircleAvatar(
                            radius: 17,
                            backgroundColor: Color.fromARGB(255, 0, 151, 178),
                            child: IconButton(
                              onPressed: () {},
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
        );
      },
    );
  }
}
