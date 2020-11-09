import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:se_project02/models/userModel.dart';
import 'package:se_project02/routes/router.gr.dart';
import 'package:se_project02/services/auth.dart';
import 'package:fluttertoast/fluttertoast.dart';

class DoctorSignup extends StatefulWidget {
  @override
  _DoctorSignupState createState() => _DoctorSignupState();
}

class _DoctorSignupState extends State<DoctorSignup> {
  final UserModel _user = UserModel();
  String _password = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Doctor Registration',
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
                    onChanged: (value) => {
                      _user.name = value,
                      _user.docName = value.trim().toLowerCase(),
                    },
                    decoration: InputDecoration(
                        labelText: 'NAME',
                        labelStyle: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.grey),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.green))),
                  ),
                  SizedBox(height: 10.0),
                  TextField(
                    onChanged: (value) => _user.docReg = value,
                    decoration: InputDecoration(
                        labelText: 'Reg No',
                        labelStyle: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.grey),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.green))),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  TextField(
                    onChanged: (value) => _user.telnum = value,
                    decoration: InputDecoration(
                        labelText: 'TEL No',
                        labelStyle: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.grey),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.green))),
                  ),
                  SizedBox(height: 10.0),
                  TextField(
                    onChanged: (value) => _user.address = value,
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
                    onChanged: (value) => _user.birthday = value,
                    decoration: InputDecoration(
                        labelText: 'BIRTHDAY',
                        labelStyle: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.grey),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.green))),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  Text("GENDER"),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Radio(
                        value: Gender.Male,
                        groupValue: _user.gender,
                        onChanged: (value) => setState(() {
                          _user.gender = value;
                        }),
                      ),
                      Text(
                        'Male',
                      ),
                      Radio(
                        value: Gender.Femail,
                        groupValue: _user.gender,
                        onChanged: (value) => setState(() {
                          _user.gender = value;
                        }),
                      ),
                      Text('Female'),
                    ],
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  TextField(
                    onChanged: (value) => _user.nic = value,
                    decoration: InputDecoration(
                        labelText: 'NIC',
                        labelStyle: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.grey),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.green))),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    onChanged: (value) => _user.email = value,
                    decoration: InputDecoration(
                        labelText: 'E-MAIL',
                        labelStyle: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.grey),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.green))),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    onChanged: (value) => _password = value,
                    decoration: InputDecoration(
                        labelText: 'PASSWORD',
                        labelStyle: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.grey),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.green))),
                    obscureText: true,
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
                      child: MaterialButton(
                        onPressed: () async {
                          _user.userType = "Doctor";
                          String tmp;
                          bool res = await Auth()
                              .register(_user, _password)
                              .whenComplete(() => tmp = _user.id)
                              .whenComplete(
                                () => Fluttertoast.showToast(
                                  msg: _user.name + " Registered Successfully",
                                  toastLength: Toast.LENGTH_SHORT,
                                  textColor: Colors.black,
                                  fontSize: 16,
                                  backgroundColor: Colors.grey[200],
                                ),
                              )
                              .whenComplete(
                                () => Fluttertoast.showToast(
                                  msg: _user.name + " Registered Successfully",
                                  toastLength: Toast.LENGTH_SHORT,
                                  textColor: Colors.black,
                                  fontSize: 16,
                                  backgroundColor: Colors.grey[200],
                                ),
                              );
                          print(tmp);
                          print(res);
                          if (_user.userType == 'Doctor') {
                            Navigator.pop(context);
                            Navigator.pop(context);
                            //ExtendedNavigator.of(context).push(Routes.adminHome);
                          } else {
                            ExtendedNavigator.of(context)
                                .push(Routes.InitialRoute);
                          }
                        },
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
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Container(
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
