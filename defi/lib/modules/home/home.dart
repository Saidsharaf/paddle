import 'package:card_swiper/card_swiper.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:day_night_time_picker/day_night_time_picker.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    // List<String> items = [
    //   "https://images.pexels.com/photos/458381/pexels-photo-458381.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
    //   "https://images.pexels.com/photos/1839904/pexels-photo-1839904.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
    //   "https://images.pexels.com/photos/1130624/pexels-photo-1130624.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
    // ];
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          // Container(
          //   height: 150,
          //   child: Swiper(
          //     itemCount: 3,
          //     itemBuilder: (context, index) {
          //       return ClipRRect(
          //           borderRadius: BorderRadius.circular(15),
          //           child: Image.network(
          //             items[index],
          //             fit: BoxFit.cover,
          //           ));
          //     },
          //     viewportFraction: .8,
          //     scale: .9,
          //   ),
          // ),
          SizedBox(
            height: 5,
          ),
          Container(
            height: 100,
            child: DatePicker(
              DateTime.now(),
              onDateChange: (selectedDate) {
                print(selectedDate.month);
              },
              initialSelectedDate: DateTime.now(),
              selectionColor: Colors.black,
              selectedTextColor: Colors.white,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).push(
                showPicker(
                  context: context,
                  minHour: 9,
                  maxHour: 23,
                  value: Time(hour: 9, minute: 00),
                  sunrise: TimeOfDay(hour: 6, minute: 0),
                  disableMinute: true,
                  sunset: TimeOfDay(hour: 18, minute: 0), // optional
                  duskSpanInMinutes: 120, // optional
                  onChange: (time) {
                    print(time.hour);
                  },
                ),
              );
            },
            child: Text(
              "Choose the time",
              style: TextStyle(
                color: Color.fromARGB(255, 0, 151, 178),
              ),
            ),
          ),
          Row(
            children: [
              Text("period of time : "),
              SizedBox(
                width: 50,
              ),
              DropdownButton<String>(
                value: "1",
                items: [
                  DropdownMenuItem(
                    child: Text('1'),
                    value: '1',
                  ),
                  DropdownMenuItem(
                    child: Text('2'),
                    value: '2',
                  ),
                  DropdownMenuItem(
                    child: Text('3'),
                    value: '3',
                  ),
                  DropdownMenuItem(
                    child: Text('4'),
                    value: '4',
                  ),
                ],
                onChanged: (value) {
                  print(value);
                },
              ),
            ],
          ),
          SizedBox(height: 20,),
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
              onPressed: () {},
              minWidth: double.infinity,
              height: 55,
              color: Color.fromARGB(255, 0, 151, 178),
              elevation: 0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50)),
              child: Text(
                "Send to Admin",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
