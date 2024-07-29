import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

Widget defultFormField({
  @required TextEditingController? controller,
  @required TextInputType? type,
  @required String? lable,
  String? msg,
  IconData? prefix,
  IconData? suffix,
  bool isScure = false,
  VoidCallback? iconPress,
  VoidCallback? onTap,
  void Function(String)? onChange,
  void Function(String)? onSumbmit,
}) =>
    SizedBox(
      height: 85,
      child: TextFormField(
        controller: controller,
        keyboardType: type,
        obscureText: isScure,
        style: const TextStyle(
          fontSize: 13,
          color: Colors.black, //! check it again
        ),
        onTap: onTap,
        onFieldSubmitted: onSumbmit,
        onChanged: onChange,
        validator: (value) {
          if (value!.isEmpty) {
            return msg;
          }
          return null;
        },
        decoration: InputDecoration(
          labelStyle: const TextStyle(
            color: Colors.black,
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.circular(20),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          labelText: lable,
          prefixIcon: Icon(
            prefix,
          ),
          suffixIcon: suffix != null
              ? IconButton(
                  onPressed: iconPress,
                  icon: Icon(
                    suffix,
                  ))
              : null,
        ),
      ),
    );

void navigateAndFinish(context, Widget) => Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => Widget,
      ),
      (route) => false,
    );
void navigate(context, Widget) => Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Widget),
    );

void showToast({
  @required String? msg,
  @required toastStates? state,
}) {
  Fluttertoast.showToast(
    msg: msg!,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 5,
    backgroundColor: chooseToastColor(state!),
    textColor: Colors.white,
    fontSize: 13.0,
  );
}

enum toastStates { SUCCESS, WARNING, ERROR }

Color chooseToastColor(toastStates state) {
  Color color;
  switch (state) {
    case toastStates.SUCCESS:
      color = Colors.green;
      break;
    case toastStates.ERROR:
      color = Colors.red;
      break;
    case toastStates.WARNING:
      color = Colors.amber;
      break;
  }
  return color;
}

Widget buildBtn({
  @required String? text,
  @required VoidCallback? onTap,
}) {
  return Container(
    height: 45,
    padding: EdgeInsets.only(
      top: 2,
      left: 3,
    ),
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
      onPressed: onTap,
      minWidth: double.infinity,
      height: 25,
      color: Color.fromARGB(255, 0, 151, 178),
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      child: Text(
        text!,
        style: TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      ),
    ),
  );
}
