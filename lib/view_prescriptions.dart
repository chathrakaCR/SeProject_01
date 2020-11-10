import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:se_project02/models/userModel.dart';
import 'package:se_project02/routes/router.gr.dart';
import 'package:url_launcher/url_launcher.dart';
import 'viewmodels/patient_record_viewmodel.dart';

_buildTextView(String text) {
  return Container(
    alignment: Alignment.centerLeft,
    child: Text(text, style: TextStyle(fontSize: 25)),
  );
}

_makingPhoneCall() async {
  const url = 'tel:0719855825';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

class ViewPrescriptions extends StatefulWidget {
  final UserModel user;

  const ViewPrescriptions({Key key, this.user}) : super(key: key);

  @override
  _ViewPrescriptionsState createState() => _ViewPrescriptionsState();
}

class _ViewPrescriptionsState extends State<ViewPrescriptions> {
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
                  'Patient Profile',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              backgroundColor: Colors.green,
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
                  Container(
                    child: Consumer<PatientRecordViewModel>(
                        builder: (context, model, child) {
                      return model.medicines != null &&
                              model.medicines.length > 0
                          ? ListView(
                              shrinkWrap: true,
                              padding: EdgeInsets.only(
                                  top: 30, left: 40, right: 40, bottom: 40),
                              children: model.medicines.map((e) {
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
                                                                "Illness : " +
                                                                    e.illness),
                                                            SizedBox(
                                                              height: 30.0,
                                                            ),
                                                            _buildTextView(
                                                                "Medicines : " +
                                                                    e.medicines),
                                                            SizedBox(
                                                              height: 30.0,
                                                            ),
                                                            _buildTextView(
                                                                "Duration : " +
                                                                    e.duration),
                                                            SizedBox(
                                                              height: 30.0,
                                                            ),
                                                            _buildTextView(
                                                                "Comments : " +
                                                                    e.comments),
                                                            SizedBox(
                                                              height: 20.0,
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
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                _makingPhoneCall();
              },
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
