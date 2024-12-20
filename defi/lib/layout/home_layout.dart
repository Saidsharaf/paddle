import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:defi/layout/cubitHome/cubit_home.dart';
import 'package:defi/layout/cubitHome/state_home.dart';
import 'package:defi/modules/loginAndRegister/login.dart';
import 'package:defi/shared/component/component.dart';
import 'package:defi/shared/network/local/sharedPref.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({super.key});

  @override
  Widget build(BuildContext context) {
    int index = 0;
    int count = 0;
    return BlocConsumer<PaddleCubit, PaddleStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = PaddleCubit.get(context);
        if (index != 0 && count == 0) {
          cubit.currentIndex = index;
          count++;
        }
        return ConditionalBuilder(
          condition: true,
          builder: (context) => Scaffold(
            extendBody: true,
            //backgroundColor: Colors.grey[100],
            appBar: AppBar(
              actions: [
                IconButton(
                    onPressed: () {
                      //  navigate(context, Search());
                      sharedPref.removeData(key: "uId").then((value) {
                        navigateAndFinish(context, LoginScreen());
                      });
                    },
                    icon: Icon(Icons.search)),
                IconButton(
                  onPressed: () {
                    //  navigate(context, Search());
                    PaddleCubit.get(context).changeMode();
                  },
                  icon: Icon(Icons.brightness_4_outlined),
                ),
                SizedBox(
                  width: 12,
                ),
              ],
              title: Text(cubit.title[cubit.currentIndex]),
              centerTitle: true,
              //backgroundColor: Colors.blueAccent,
            ),

            body: cubit.screens[cubit.currentIndex],
            bottomNavigationBar: CurvedNavigationBar(
              color: Color.fromARGB(255, 0, 151, 178),
              height: 50,
              animationCurve: Easing.linear,
              backgroundColor: Colors.transparent,
              animationDuration: Duration(milliseconds: 500),
              items: cubit.itemIcons,
              index: cubit.currentIndex,
              onTap: (value) {
                cubit.changeNav(value);
              },
            ),
          ),
          fallback: (context) => Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
