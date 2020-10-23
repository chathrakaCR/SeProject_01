import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:se_project02/AddDisease.dart';
import 'package:se_project02/adminhome.dart';
import 'package:se_project02/adddisease.dart';
import 'package:se_project02/patientsearch.dart';
import 'package:se_project02/pharmsignup.dart';
import 'package:se_project02/staffsignup.dart';
import 'doctorsignup.dart';
import 'patientsignup.dart';
import 'pharmsignup.dart';
import 'userprofile.dart';
import 'docprofile.dart';
import 'docsearch.dart';
import 'adddisease.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.green, accentColor: Colors.white),
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        '/patientsignup': (BuildContext context) => new PatientSignup(),
        '/docprofile': (BuildContext context) => new DocProfile(),
        '/main': (BuildContext context) => new MyHomePage(),
        '/adminhome': (BuildContext context) => new AdminHome(),
        '/staffsignup': (BuildContext context) => new StaffSignup(),
        '/pharmsignup': (BuildContext context) => new PharmSignup(),
        '/userprofile': (BuildContext context) => new UserProfile(),
        '/docsearch': (BuildContext context) => new DocSearch(),
        '/patientsearch': (BuildContext context) => new PatientSearch(),
        '/adddisease': (BuildContext context) => new AddDisease(),
      },
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.only(left: 10.0, right: 10.0),
        children: [
          Container(
            child: Stack(
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(15.0, 170.0, 0.0, 0.0),
                  child: Text(
                    'E-Care',
                    style:
                        TextStyle(fontSize: 80.0, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(260.0, 170.0, 0.0, 0.0),
                  child: Text(
                    '.',
                    style: TextStyle(
                        fontSize: 80.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.green),
                  ),
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 35.0, right: 20.0, left: 20),
            child: Column(
              children: [
                TextField(
                  decoration: InputDecoration(
                      labelText: 'EMAIL',
                      labelStyle: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.grey),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.green))),
                ),
                SizedBox(height: 20.0),
                TextField(
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
                Container(
                  alignment: Alignment(1.0, 0.0),
                  padding: EdgeInsets.only(top: 15.0, left: 20.0),
                  child: InkWell(
                      child: Text(
                    'forgot password',
                    style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline),
                  )),
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
                      onTap: () {
                        Navigator.of(context).pushNamed('/docprofile');
                      },
                      child: Center(
                        child: Text(
                          'LOGIN',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.white),
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
                    Navigator.of(context).pushNamed('/userprofile');
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
                          Center(child: FaIcon(FontAwesomeIcons.google)),
                          SizedBox(
                            width: 10.0,
                          ),
                          Center(
                            child: Text(
                              ' Log In With Google',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 15.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'New to E-Care ?',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: 10.0,
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed('/patientsignup');
                },
                child: Text(
                  'Register',
                  style: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
