import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:se_project02/models/userModel.dart';
import 'package:se_project02/routes/router.gr.dart';
import 'package:se_project02/viewmodels/patient_search_viewmodel.dart';

class DocProfile extends StatelessWidget {
  final UserModel user;

  const DocProfile({Key key, this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Welcome Dr. ${user.name}',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
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
                      margin: EdgeInsets.only(top: 10),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      '${user.name}',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.white),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      '${user.email}',
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      '${user.docReg}',
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                  ],
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.arrow_back),
              title: Text(
                'Log Out',
                style: TextStyle(fontSize: 15),
              ),
              onTap: () {
                ExtendedNavigator.of(context).push(Routes.InitialRoute);
              },
            )
          ],
        ),
      ),
      //below
      body: ListView(
        padding: EdgeInsets.only(top: 100, left: 40, right: 40, bottom: 40),
        children: [
          GestureDetector(
            onTap: () {
              ExtendedNavigator.of(context).push(Routes.appointmentsForDoctor,
                  arguments: AppointmentsForDoctorArguments(user: user));
              //Navigator.of(context).pushNamed('/appointmentsfordoctor');
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
                    Center(child: FaIcon(FontAwesomeIcons.list)),
                    SizedBox(
                      width: 10.0,
                    ),
                    Center(
                      child: Text(
                        ' My Appointments',
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
            onTap: () {
              showSearch(context: context, delegate: Searchdata());
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
                          ' Search Patients',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      )
                    ],
                  ),
                )),
          ),
        ],
      ),

      //above
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
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
      ),
    );
  }
}

class Searchdata extends SearchDelegate<String> {
  PatientSearchViewModel viewModel = PatientSearchViewModel();

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = '';
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation,
        ),
        onPressed: () {
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isNotEmpty) {
      viewModel.query(query);
    }

    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Consumer<PatientSearchViewModel>(builder: (context, model, child) {
        return model.users != null
            ? ListView.builder(
                itemBuilder: (context, index) => ListTile(
                  onTap: () {
                    ExtendedNavigator.of(context).push(Routes.userDocView,
                        arguments:
                            UserDocViewArguments(user: model.users[index]));
                  },
                  leading: Icon(Icons.person_rounded),
                  title: RichText(
                    text: TextSpan(
                        text:
                            model.users[index].name.substring(0, query.length),
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                        children: [
                          TextSpan(
                              text: model.users[index].name
                                  .substring(query.length),
                              style: TextStyle(color: Colors.grey))
                        ]),
                  ),
                ),
                itemCount: model.users.length,
              )
            : Container();
      }),
    );
  }
}
