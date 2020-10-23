import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AdminHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Admin Page',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.green,
        ),
        drawer: Drawer(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(20),
                color: Colors.green,
                child: Center(
                  child: Column(
                    children: [
                      Container(
                        height: 100,
                        width: 100,
                        margin: EdgeInsets.only(top: 30),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: const DecorationImage(
                                image: AssetImage('assets/admin.jpeg'),
                                fit: BoxFit.cover)),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Chathraka Ranaweera',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.white),
                      ),
                      Text(
                        'bcuranaweera@gmail.com',
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.add_box),
                title: Text(
                  'Add Doctor',
                  style: TextStyle(fontSize: 15),
                ),
                onTap: () {
                  Navigator.of(context).pushNamed('/doctorsignup');
                },
              ),
              ListTile(
                leading: Icon(Icons.add_box),
                title: Text(
                  'Add Staff',
                  style: TextStyle(fontSize: 15),
                ),
                onTap: () {
                  Navigator.of(context).pushNamed('/staffsignup');
                },
              ),
              ListTile(
                leading: Icon(Icons.add_box),
                title: Text(
                  'Add Pharmacy',
                  style: TextStyle(fontSize: 15),
                ),
                onTap: () {
                  Navigator.of(context).pushNamed('/pharmsignup');
                },
              ),
              ListTile(
                leading: Icon(Icons.arrow_back),
                title: Text(
                  'Log Out',
                  style: TextStyle(fontSize: 15),
                ),
                onTap: () {
                  Navigator.of(context).pushNamed('/main');
                },
              )
            ],
          ),
        ),
        body: ListView(
          padding: EdgeInsets.only(top: 100, left: 40, right: 40, bottom: 40),
          children: [
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed('/docsearch');
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
                          ' Search Doctor',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
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
            GestureDetector(
              onTap: () {},
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
                            ' Search Staff',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                        )
                      ],
                    ),
                  )),
            )
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          tooltip: 'Increment',
          child: Icon(Icons.add),
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
        ));
  }
}
