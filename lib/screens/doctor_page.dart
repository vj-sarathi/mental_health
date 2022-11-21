import 'package:flutter/material.dart';
import 'dart:ui';

import 'package:mental_health_tracker/model/doctor_list.dart';

class DoctorPage extends StatefulWidget {
  const DoctorPage({Key? key}) : super(key: key);

  @override
  State<DoctorPage> createState() => _DoctorPageState();
}

class _DoctorPageState extends State<DoctorPage> {
  List<DoctorListModel> dummyDoctorList = doctorList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("My Doctors")),
        backgroundColor: Colors.blueAccent.shade200,
      ),
      body: ListView.builder(
          itemCount: dummyDoctorList.length,
          itemBuilder: (BuildContext context, int index) {
            return doctorItem(index);
      }),
    );
  }

  Widget doctorItem(int index) {
    return Card(
      elevation: 10,
      shadowColor: Colors.black,
      color: Colors.blueAccent.shade200,
      child: SizedBox(
        width: 500,
        height: 110,
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Row(
            children: [
              CircleAvatar(
                radius: 40,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  backgroundImage: NetworkImage(dummyDoctorList[index].url),
                  //NetworkImage
                  radius: 40,
                ), //CircleAvatar
              ), //CircleAvatar
              const SizedBox(
                width: 10,
                height: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Name: ${dummyDoctorList[index].name}",
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ), //Textstyle
                  ), //Text
                  const SizedBox(

                    height: 10,
                  ), //SizedBox
                  Text(
                    "Speciality: ${dummyDoctorList[index].speciality}",
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.white,
                    ), //Textstyle
                  ), //
                  const SizedBox(
                    height: 10,
                  ), //SizedBox
                  Text(
                    "Hospital: ${dummyDoctorList[index].hospital}",
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.white,
                    ), //Textstyle
                  ), //Text
                  const SizedBox(

                    height: 10,
                  ), //SizedBox
                  Text(
                   "Hospital ${ dummyDoctorList[index].email}",
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.white,
                    ), //Textstyle
                  ), //Text
                ],
              ) //SizedBox
            ],
          ), //Column
        ), //Padding
      ), //SizedBox
    );
  }
}
