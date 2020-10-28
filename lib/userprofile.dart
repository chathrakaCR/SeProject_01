import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:se_project02/models/userModel.dart';
import 'package:se_project02/services/auth.dart';

class UserProfile extends StatelessWidget {
  final UserModel user = Get.find();
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            title: Text(
              'User Profile',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            actions: [
              IconButton(
                  icon: Icon(Icons.logout),
                  color: Colors.white,
                  onPressed: () {
                    Auth().logout();
                    Navigator.of(context).pushNamed('/main');
                  }),
            ],
            backgroundColor: Colors.green,
            bottom: TabBar(
              tabs: [
                Tab(
                  text: 'Profile',
                  icon: Icon(Icons.person),
                ),
                Tab(
                  text: 'Terminal',
                  icon: Icon(Icons.assignment),
                )
              ],
            ),
          ),
          body: TabBarView(
            children: [
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
                            Text('Name: ${user.name}')
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
                            Text('E-Mail: ${user.email}')
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
                            Text('Tel No:${user.telnum} ')
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
                            Text('Address: ${user.address}')
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
                            Text('NIC: ${user.nic} ')
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
                                'Gender: ${user.gender == Gender.Male ? 'Male' : 'Female'} ')
                          ],
                        ),
                      ),
                    ))
                  ],
                ),
              ),
              Container(
                child: ListView(
                  padding:
                      EdgeInsets.only(top: 30, left: 40, right: 40, bottom: 40),
                  children: [
                    Container(
                      child: Container(
                        height: 40,
                        child: Text(
                          'Patient Records',
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
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed('/addrecord');
                      },
                      child: Container(
                        alignment: Alignment.topLeft,
                        height: 40.0,
                        color: Colors.transparent,
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.black,
                                width: 3,
                                style: BorderStyle.solid,
                              ),
                              borderRadius: BorderRadius.circular(20.0)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Center(child: FaIcon(FontAwesomeIcons.plus)),
                              SizedBox(
                                width: 10.0,
                              ),
                              Center(
                                child: Text(
                                  ' Add Record',
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
                      height: 20,
                    ),
                    Container(
                      child: Text('Rec 01'),
                    )
                  ],
                ),
              )
            ],
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
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: 'settings',
              ),
            ],
            selectedItemColor: Colors.green[900],
            backgroundColor: Colors.lightGreen[200],
            onTap: (value) {
              switch (value) {
                case 0:
                  Navigator.of(context).pushNamed('/main');
                  break;
                case 1:
                  Navigator.of(context).pushNamed('/main');
                  break;
                default:
              }
            },
          )),
    );
  }
}
