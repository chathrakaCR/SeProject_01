import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:se_project02/models/userModel.dart';
import 'package:se_project02/services/auth.dart';
import 'package:se_project02/routes/router.gr.dart';
import 'package:se_project02/viewmodels/search_viewmodel.dart';
import 'viewmodels/patient_record_viewmodel.dart';

_buildTextView(String text) {
  return Container(
    alignment: Alignment.centerLeft,
    child: Text(text, style: TextStyle(fontSize: 25)),
  );
}

class UserProfile extends StatefulWidget {
  final UserModel user;
  const UserProfile({Key key, this.user}) : super(key: key);

  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: ChangeNotifierProvider(
        create: (context) => PatientRecordViewModel(widget.user.id),
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
                      ExtendedNavigator.of(context).push(Routes.InitialRoute);
                    }),
              ],
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
            body: TabBarView(
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
                              Text('NIC\t\t\t\t\t\t\t\t\t: ${widget.user.nic}')
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
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: ListView(
                                                        shrinkWrap: true,
                                                        children: <Widget>[
                                                          Container(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    10),
                                                            decoration:
                                                                BoxDecoration(
                                                                    border:
                                                                        Border
                                                                            .all(
                                                                      color: Colors
                                                                          .black,
                                                                      width: 3,
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
                                                                  height: 25.0,
                                                                ),
                                                                _buildTextView(
                                                                    "Medicines : " +
                                                                        e.medicines),
                                                                SizedBox(
                                                                  height: 25.0,
                                                                ),
                                                                _buildTextView(
                                                                    "Duration : " +
                                                                        e.duration),
                                                                SizedBox(
                                                                  height: 25.0,
                                                                ),
                                                                _buildTextView(
                                                                    "Tests : " +
                                                                        e.testsTo),
                                                                SizedBox(
                                                                  height: 25.0,
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
                              Center(child: FaIcon(FontAwesomeIcons.list)),
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
                    MaterialButton(
                      onPressed: () {
                        showSearch(context: context, delegate: Searchdata());
                        //ExtendedNavigator.of(context).push(Routes.docSearch);
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
                                    ' Make an Appointment',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                )
                              ],
                            ),
                          )),
                    )
                  ],
                ),
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

class Searchdata extends SearchDelegate<String> {
  SearchViewModel viewModel = SearchViewModel("doctor");

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
      child: Consumer<SearchViewModel>(builder: (context, model, child) {
        return model.users != null
            ? ListView.builder(
                itemBuilder: (context, index) => ListTile(
                  onTap: () {
                    ExtendedNavigator.of(context).push(Routes.docProfileMain,
                        arguments: DocProfileMainArguments(
                            user: model.users[index], type: "patient"));
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
