import 'package:flutter/material.dart';

class UserProfile extends StatelessWidget {
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
                            Text('Name: ')
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
                            Text('E-Mail: ')
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
                            Text('Tel No: ')
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
                            Text('Address: ')
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
                            Text('NIC: ')
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
                            Text('Gender: ')
                          ],
                        ),
                      ),
                    ))
                  ],
                ),
              ),
              Container(
                child: ListView(
                  padding: EdgeInsets.all(40),
                  children: [
                    Container(
                      child: Container(
                        height: 80,
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
                      height: 30,
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
          )),
    );
  }
}
