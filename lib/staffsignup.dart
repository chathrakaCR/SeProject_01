import 'package:flutter/material.dart';

String initValue = "Select your Birth Date";
bool isDateSelected = false;
DateTime birthDate; // instance of DateTime
String birthDateInString;

class StaffSignup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Staff Registration',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        child: Column(
          //padding: EdgeInsets.only(left: 10.0, right: 10.0),
          children: [
            SizedBox(
              height: 15.0,
            ),
            Container(
              //height: height - 170,
              //color: Colors.red,
              padding: EdgeInsets.only(top: 35.0, right: 20.0, left: 20),
              child: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(
                        labelText: 'NAME',
                        labelStyle: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.grey),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.green))),
                  ),
                  SizedBox(height: 10.0),
                  TextField(
                    decoration: InputDecoration(
                        labelText: 'Staff Id',
                        labelStyle: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.grey),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.green))),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  TextField(
                    decoration: InputDecoration(
                        labelText: 'TEL No',
                        labelStyle: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.grey),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.green))),
                  ),
                  SizedBox(height: 10.0),
                  TextField(
                    decoration: InputDecoration(
                        labelText: 'ADDRESS',
                        labelStyle: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.grey),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.green))),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  TextField(
                    decoration: InputDecoration(
                        labelText: 'BIRTHDAY',
                        labelStyle: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.grey),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.green))),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  TextField(
                    decoration: InputDecoration(
                        labelText: 'GENDER',
                        labelStyle: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.grey),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.green))),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  TextField(
                    decoration: InputDecoration(
                        labelText: 'NIC',
                        labelStyle: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.grey),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.green))),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                  Container(
                    height: 40.0,
                    child: Material(
                      borderRadius: BorderRadius.circular(60.0),
                      shadowColor: Colors.greenAccent,
                      color: Colors.green,
                      elevation: 7.0,
                      child: GestureDetector(
                        onTap: () {},
                        child: Center(
                          child: Text(
                            'REGISTER',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    height: 40.0,
                    color: Colors.transparent,
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black,
                            width: 1.5,
                            style: BorderStyle.solid,
                          ),
                          borderRadius: BorderRadius.circular(60.0)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 10.0,
                          ),
                          Center(
                            child: Text(
                              ' Go Back',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
