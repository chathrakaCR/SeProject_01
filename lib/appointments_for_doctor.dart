import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:se_project02/models/userModel.dart';
import 'package:se_project02/routes/router.gr.dart';
import 'package:se_project02/viewmodels/appoinments_view_model.dart';

_buildTextView(String text) {
  return Container(
    alignment: Alignment.centerLeft,
    child: Text(text, style: TextStyle(fontSize: 25)),
  );
}

class AppointmentsForDoctor extends StatelessWidget {
  final UserModel user;

  const AppointmentsForDoctor({Key key, this.user}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ChangeNotifierProvider(
        create: (context) => AppointmentsViewModel(user.id, "doctor"),
        child: Scaffold(
            appBar: AppBar(
              title: Text(
                'View Appointments',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            body: Container(
              child: ListView(
                padding:
                    EdgeInsets.only(top: 30, left: 40, right: 40, bottom: 40),
                children: [
                  Container(
                    child: Container(
                      height: 40,
                      child: Text(
                        'Appointments',
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
                  Container(
                    child: Consumer<AppointmentsViewModel>(
                        builder: (context, model, child) {
                      return model.event != null && model.event.length > 0
                          ? ListView(
                              shrinkWrap: true,
                              padding: EdgeInsets.only(
                                  top: 30, left: 40, right: 40, bottom: 40),
                              children: model.event.map((e) {
                                return GestureDetector(
                                  onTap: () {
                                    showDialog(
                                        context: context,
                                        builder: (context) => Dialog(
                                              child: Container(
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: ListView(
                                                    shrinkWrap: true,
                                                    children: <Widget>[
                                                      Container(
                                                        padding:
                                                            EdgeInsets.all(10),
                                                        decoration:
                                                            BoxDecoration(
                                                                border:
                                                                    Border.all(
                                                                  color: Colors
                                                                      .black,
                                                                  width: 3,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10)),
                                                        child: Column(
                                                          children: [
                                                            _buildTextView(
                                                                "Type : " +
                                                                    e.illness),
                                                            SizedBox(
                                                              width: 20.0,
                                                            ),
                                                            _buildTextView(
                                                                "Days : " +
                                                                    e.timeSlot),
                                                            SizedBox(
                                                              width: 20.0,
                                                            ),
                                                            _buildTextView(
                                                                "Date :" +
                                                                    e.eventDate
                                                                        .toString()),
                                                            SizedBox(
                                                              width: 20.0,
                                                            ),
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
                                        _buildTextView(e.illness),
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
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            bottomNavigationBar: BottomNavigationBar(
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.settings),
                  label: 'Settings',
                ),
              ],
              selectedItemColor: Colors.green[900],
              backgroundColor: Colors.lightGreen[200],
              onTap: (value) {
                switch (value) {
                  case 0:
                    ExtendedNavigator.of(context).push(Routes.InitialRoute);
                    break;
                  case 1:
                    ExtendedNavigator.of(context).push(Routes.InitialRoute);
                    break;
                  default:
                }
              },
            )),
      ),
    );
  }
}
