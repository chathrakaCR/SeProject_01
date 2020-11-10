import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:se_project02/models/userModel.dart';
import 'package:se_project02/routes/router.gr.dart';
import 'viewmodels/patient_record_viewmodel.dart';

_buildTextView(String text) {
  return Container(
    alignment: Alignment.centerLeft,
    child: Text(text, style: TextStyle(fontSize: 25)),
  );
}

class UserAdminView extends StatefulWidget {
  final UserModel user;
  const UserAdminView({Key key, this.user}) : super(key: key);

  @override
  _UserAdminViewState createState() => _UserAdminViewState();
}

class _UserAdminViewState extends State<UserAdminView> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: ChangeNotifierProvider(
        create: (context) => PatientRecordViewModel(widget.user.id),
        child: Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              leading: IconButton(
                icon: Icon(Icons.arrow_back),
                color: Colors.white,
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).pop();
                },
              ),
              title: Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  '          Patient Profile',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
              ),
              backgroundColor: Colors.green,
              bottom: TabBar(
                tabs: [
                  // if (userNow.userType != 'Pharmacy')
                  Tab(
                    text: 'Profile',
                    icon: Icon(Icons.person),
                  ),
                  Tab(
                    text: 'Terminal',
                    icon: Icon(Icons.assignment),
                  ),
                  // if (widget.user.userType == userNow.userType)
                  Tab(
                    text: 'Appointments',
                    icon: Icon(Icons.assignment),
                  ),
                ],
              ),
            ),
            body: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/background.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
              child: TabBarView(
                children: [
                  //if (userNow.userType != 'Pharmacy')
                  Container(
                    child: ListView(
                      padding: EdgeInsets.all(40),
                      children: [
                        Container(
                            child: Container(
                          height: 30,
                          color: Colors.transparent,
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.black,
                                  width: 1.5,
                                  style: BorderStyle.solid,
                                ),
                                borderRadius: BorderRadius.circular(10)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(Icons.person),
                                SizedBox(
                                  width: 10,
                                ),
                                Text('Name\t\t\t\t: ${widget.user.name}')
                              ],
                            ),
                          ),
                        )),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                            child: Container(
                          height: 30,
                          color: Colors.transparent,
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.black,
                                  width: 1.5,
                                  style: BorderStyle.solid,
                                ),
                                borderRadius: BorderRadius.circular(10)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(Icons.alternate_email_rounded),
                                SizedBox(
                                  width: 10,
                                ),
                                Text('E-Mail\t\t\t\t: ${widget.user.email}')
                              ],
                            ),
                          ),
                        )),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                            child: Container(
                          height: 30,
                          color: Colors.transparent,
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.black,
                                  width: 1.5,
                                  style: BorderStyle.solid,
                                ),
                                borderRadius: BorderRadius.circular(10)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(Icons.phone),
                                SizedBox(
                                  width: 10,
                                ),
                                Text('Tel No\t\t\t\t: ${widget.user.telnum}')
                              ],
                            ),
                          ),
                        )),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                            child: Container(
                          height: 30,
                          color: Colors.transparent,
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.black,
                                  width: 1.5,
                                  style: BorderStyle.solid,
                                ),
                                borderRadius: BorderRadius.circular(10)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(Icons.mail),
                                SizedBox(
                                  width: 10,
                                ),
                                Text('Address\t: ${widget.user.address}')
                              ],
                            ),
                          ),
                        )),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                            child: Container(
                          height: 30,
                          color: Colors.transparent,
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.black,
                                  width: 1.5,
                                  style: BorderStyle.solid,
                                ),
                                borderRadius: BorderRadius.circular(10)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(Icons.person),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                    'NIC\t\t\t\t\t\t\t\t\t: ${widget.user.nic}')
                              ],
                            ),
                          ),
                        )),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                            child: Container(
                          height: 30,
                          color: Colors.transparent,
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.black,
                                  width: 1.5,
                                  style: BorderStyle.solid,
                                ),
                                borderRadius: BorderRadius.circular(10)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(Icons.group),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                    'Gender\t\t\t: ${widget.user.gender == Gender.Male ? 'Male' : 'Female'}')
                              ],
                            ),
                          ),
                        ))
                      ],
                    ),
                  ),
                  Container(
                    child: ListView(
                      padding: EdgeInsets.only(
                          top: 30, left: 40, right: 40, bottom: 40),
                      children: [
                        Container(
                          child: Container(
                            height: 40,
                            child: Text(
                              'Medical Records',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30,
                                  color: Colors.lightGreen[900]),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        //if (userNow.userType == 'Doctor')
                        // MaterialButton(
                        //   onPressed: () {
                        //     ExtendedNavigator.of(context).push(Routes.addRecord,
                        //         arguments: AddRecordArguments(user: widget.user));
                        //     //ExtendedNavigator.of(context).push(Routes.addRecord);
                        //   },
                        //   child: Container(
                        //     alignment: Alignment.topLeft,
                        //     height: 40.0,
                        //     color: Colors.transparent,
                        //     child: Container(
                        //       decoration: BoxDecoration(
                        //           border: Border.all(
                        //             color: Colors.black,
                        //             width: 3,
                        //             style: BorderStyle.solid,
                        //           ),
                        //           borderRadius: BorderRadius.circular(20.0)),
                        //       child: Row(
                        //         mainAxisAlignment: MainAxisAlignment.center,
                        //         children: [
                        //           Center(child: FaIcon(FontAwesomeIcons.plus)),
                        //           SizedBox(
                        //             width: 10.0,
                        //           ),
                        //           Center(
                        //             child: Text(
                        //               ' Add Record',
                        //               style: TextStyle(
                        //                   fontWeight: FontWeight.bold,
                        //                   fontSize: 20),
                        //             ),
                        //           )
                        //         ],
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        Container(
                          child: Consumer<PatientRecordViewModel>(
                              builder: (context, model, child) {
                            return model.medicines != null &&
                                    model.medicines.length > 0
                                ? ListView(
                                    shrinkWrap: true,
                                    padding: EdgeInsets.only(
                                        top: 30,
                                        left: 40,
                                        right: 40,
                                        bottom: 40),
                                    children: model.medicines.map((e) {
                                      return GestureDetector(
                                        onTap: () {
                                          showDialog(
                                              context: context,
                                              builder: (context) => Dialog(
                                                    child: Container(
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: ListView(
                                                          shrinkWrap: true,
                                                          children: <Widget>[
                                                            Container(
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(10),
                                                              decoration:
                                                                  BoxDecoration(
                                                                      border:
                                                                          Border
                                                                              .all(
                                                                        color: Colors
                                                                            .black,
                                                                        width:
                                                                            3,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              10)),
                                                              child: Column(
                                                                children: [
                                                                  _buildTextView(
                                                                      "Illness : " +
                                                                          e.illness),
                                                                  SizedBox(
                                                                    height:
                                                                        25.0,
                                                                  ),
                                                                  _buildTextView(
                                                                      "Medicines : " +
                                                                          e.medicines),
                                                                  SizedBox(
                                                                    height:
                                                                        25.0,
                                                                  ),
                                                                  _buildTextView(
                                                                      "Duration : " +
                                                                          e.duration),
                                                                  SizedBox(
                                                                    height:
                                                                        25.0,
                                                                  ),
                                                                  _buildTextView(
                                                                      "Tests : " +
                                                                          e.testsTo),
                                                                  SizedBox(
                                                                    height:
                                                                        25.0,
                                                                  ),
                                                                  _buildTextView(
                                                                      "Comments : " +
                                                                          e.comments),
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ));
                                        },
                                        child: Container(
                                          height: 100,
                                          child: Column(
                                            children: [
                                              //Text(e.date),
                                              _buildTextView(e.date),
                                            ],
                                          ),
                                        ),
                                      );
                                    }).toList(),
                                  )
                                : Container();
                          }),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                  // if (userNow.userType != 'Doctor' &&
                  // userNow.userType != 'Admin' &&
                  // userNow.userType != 'Pharmacy')
                  ListView(
                    padding: EdgeInsets.only(
                        top: 100, left: 40, right: 40, bottom: 40),
                    children: [
                      MaterialButton(
                        onPressed: () {
                          ExtendedNavigator.of(context).push(
                              Routes.appointmentsForPatient,
                              arguments: AppointmentsForPatientArguments(
                                  user: widget.user));
                        },
                        child: Container(
                          height: 80.0,
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
                                Center(child: FaIcon(FontAwesomeIcons.search)),
                                SizedBox(
                                  width: 10.0,
                                ),
                                Center(
                                  child: Text(
                                    ' Current Appointments',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            floatingActionButton: FloatingActionButton(
              onPressed: () {},
              tooltip: 'Increment',
              child: Icon(Icons.phone),
              elevation: 2.0,
              backgroundColor: Colors.green,
            ),
            bottomNavigationBar: BottomNavigationBar(
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.info_sharp),
                  label: 'About us',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.assignment),
                  label: 'news',
                ),
              ],
              selectedItemColor: Colors.green[900],
              backgroundColor: Colors.lightGreen[200],
              onTap: (value) {
                switch (value) {
                  case 0:
                    ExtendedNavigator.of(context).push(Routes.aboutUs);
                    break;
                  case 1:
                    ExtendedNavigator.of(context).push(Routes.homePage);
                    break;
                  default:
                }
              },
            )),
      ),
    );
  }
}
