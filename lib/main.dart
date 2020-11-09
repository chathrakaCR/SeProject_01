import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:se_project02/models/userModel.dart';
import 'package:se_project02/routes/router.gr.dart';
import 'package:se_project02/services/auth.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.green, accentColor: Colors.white),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: NewRouter(),
      builder: ExtendedNavigator.builder(
          router: NewRouter(), builder: (context, extendedNav) => extendedNav),
      // routes: <String, WidgetBuilder>{
      //   '/patientsignup': (BuildContext context) => new PatientSignup(),
      //   '/doctorsignup': (BuildContext context) => new DoctorSignup(),
      //   '/docprofile': (BuildContext context) => new DocProfile(),
      //   '/main': (BuildContext context) => new MyHomePage(),
      //   '/adminhome': (BuildContext context) => new AdminHome(),
      //   '/pharmprofile': (BuildContext context) => new PharmProfile(),
      //   '/pharmsignup': (BuildContext context) => new PharmSignup(),
      //   '/userprofile': (BuildContext context) => new UserProfile(),
      //   '/docsearch': (BuildContext context) => new DocSearch(),
      //   '/patientsearch': (BuildContext context) => new PatientSearch(),
      //   '/addrecord': (BuildContext context) => new AddRecord(),
      //   '/appointments': (BuildContext context) => new Appointments(),
      //   '/appointmentsfordoctor': (BuildContext context) =>
      //       new AppointmentsForDoctor(),
      //   '/appointmentsform': (BuildContext context) => new AppointmentForm(),
      // },
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _email = "";
  String _password = "";
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
                  onChanged: (value) => _email = value,
                  decoration: InputDecoration(
                      labelText: 'EMAIL',
                      labelStyle: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.grey),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.green))),
                ),
                SizedBox(height: 20.0),
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
                    child: MaterialButton(
                      onPressed: () async {
                        UserModel user = await Auth().signIn(_email, _password);
                        if (user == null) {
                          Fluttertoast.showToast(
                            msg: " Invalid Username or Password",
                            toastLength: Toast.LENGTH_SHORT,
                            textColor: Colors.black,
                            fontSize: 16,
                            backgroundColor: Colors.grey[200],
                          );
                          ExtendedNavigator.of(context)
                              .push(Routes.InitialRoute);
                          return;
                        }
                        Get.put(user);
                        print(user);
                        switch (user.userType) {
                          case 'Patient':
                            ExtendedNavigator.of(context).push(
                                Routes.userProfile,
                                arguments: UserProfileArguments(user: user));
                            break;
                          case 'Doctor':
                            ExtendedNavigator.of(context).push(
                                Routes.docProfile,
                                arguments: DocProfileArguments(user: user));
                            break;
                          case 'Admin':
                            ExtendedNavigator.of(context).push(Routes.adminHome,
                                arguments: AdminHomeArguments(user: user));
                            break;
                          case 'Pharmacy':
                            ExtendedNavigator.of(context).push(
                                Routes.pharmProfile,
                                arguments: PharmProfileArguments(user: user));
                            break;
                          default:
                        }
                        //Navigator.of(context).pushNamed('/adminhome');
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
                MaterialButton(
                  onPressed: () async {
                    //ExtendedNavigator.of(context).push(Routes.homePage);
                    UserModel user = await Auth().googleSignIn();
                    Get.put(user);
                    print(user);
                    switch (user.userType) {
                      case 'Patient':
                        ExtendedNavigator.of(context).push(Routes.userProfile,
                            arguments: UserProfileArguments(user: user));
                        break;
                      case 'Doctor':
                        ExtendedNavigator.of(context).push(Routes.docProfile,
                            arguments: DocProfileArguments(user: user));
                        break;
                      case 'Admin':
                        ExtendedNavigator.of(context).push(Routes.adminHome,
                            arguments: AdminHomeArguments(user: user));
                        break;
                      case 'Pharmacy':
                        ExtendedNavigator.of(context).push(Routes.pharmProfile,
                            arguments: PharmProfileArguments(user: user));
                        break;
                      default:
                    }
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
                  ExtendedNavigator.of(context).push(Routes.patientSignup);
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
