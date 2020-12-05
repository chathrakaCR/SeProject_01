import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:se_project02/models/userModel.dart';
import 'package:se_project02/routes/router.gr.dart';
import 'package:se_project02/viewmodels/appoinments_view_model.dart';

_buildTextView(String text) {
  return Container(
    alignment: Alignment.centerLeft,
    child:
        Text(text, style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
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
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/background.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
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
                                  onTap: () {},
                                  child: Container(
                                    height: 140,
                                    child: SingleChildScrollView(
                                      child: Column(
                                        children: [
                                          //Text(e.date),
                                          _buildTextView(
                                              "Patient : " + e.patient),
                                          _buildTextView(
                                              "Illness : " + e.illness),
                                          _buildTextView(
                                              e.eventDate.year.toString() +
                                                  "-" +
                                                  e.eventDate.month.toString() +
                                                  "-" +
                                                  e.eventDate.day.toString() +
                                                  " _ " +
                                                  e.timeSlot),
                                        ],
                                      ),
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
