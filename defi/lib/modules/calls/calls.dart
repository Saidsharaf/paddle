import 'package:defi/modules/calls/makeCall/makeCall.dart';
import 'package:defi/modules/calls/zegoCall/zegoCall.dart';
import 'package:defi/shared/component/component.dart';
import 'package:flutter/material.dart';

class Calls extends StatelessWidget {
  const Calls({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 60,
            width: double.infinity,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  blurRadius: 1.5,
                  color: Colors.black87,
                ),
              ],
              color: Color.fromARGB(255, 247, 244, 244),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: Row(
                children: [
                  Text("press here to make ur own call",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontFamily: "Inter")),
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width / 15,
                  ),
                  IconButton(
                      onPressed: () {
                        navigate(context, MakeCall());
                      },
                      icon: Icon(
                        Icons.add_call,
                        color: Color.fromARGB(255, 0, 151, 178),
                      ))
                ],
              ),
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) => callGroup(context),
            itemCount: 3,
          ),
        ),
      ],
    );
  }

  Widget callGroup(context) { 
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 186,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              blurRadius: 1.5,
              color: Colors.black87,
            ),
          ],
          color: Color.fromARGB(255, 247, 244, 244),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "let's play paddle !!",
                style: TextStyle(
                  fontFamily: "Title",
                  fontSize: 18,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(
                        "https://images.pexels.com/photos/458381/pexels-photo-458381.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"),
                    radius: 25,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  CircleAvatar(
                    backgroundImage: NetworkImage(
                        "https://images.pexels.com/photos/1130624/pexels-photo-1130624.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"),
                    radius: 16,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  CircleAvatar(
                    backgroundImage: NetworkImage(
                        "https://images.pexels.com/photos/1839904/pexels-photo-1839904.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"),
                    radius: 16,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  CircleAvatar(
                    backgroundImage: NetworkImage(
                        "https://images.pexels.com/photos/2323072/pexels-photo-2323072.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"),
                    radius: 16,
                  ),
                ],
              ),
              Divider(),
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Icon(Icons.mic),
                  Text("4"),
                  Spacer(),
                  Container(
                    width: 90,
                    height: 35,
                    padding: EdgeInsets.only(top: 2, left: 3),
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
                        navigate(context, ZegoCall());
                      },
                      minWidth: double.infinity,
                      height: 35,
                      color: Color.fromARGB(255, 0, 151, 178),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)),
                      child: Text(
                        "Join",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
