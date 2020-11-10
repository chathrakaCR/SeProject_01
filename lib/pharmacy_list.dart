import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:se_project02/routes/router.gr.dart';
import 'package:se_project02/viewmodels/pharmacy_search_viewmodel.dart';

_buildTextView(String text) {
  return Container(
      alignment: Alignment.centerLeft,
      child: Row(
        children: [
          Icon(Icons.local_hospital),
          SizedBox(
            width: 10,
          ),
          Text(text, style: TextStyle(fontSize: 20))
        ],
      ));
}

class PharmacyList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ChangeNotifierProvider(
        create: (context) => PharmacySearchViewModel(),
        child: Scaffold(
            appBar: AppBar(
              title: Text(
                'View Pharmacies',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            body: Container(
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/background.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
              child: ListView(
                padding:
                    EdgeInsets.only(top: 30, left: 10, right: 10, bottom: 0),
                children: [
                  Container(
                    child: Container(
                      height: 40,
                      child: Text(
                        'Pharmacy List',
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
                    child: Consumer<PharmacySearchViewModel>(
                        builder: (context, model, child) {
                      return model.users != null && model.users.length > 0
                          ? ListView(
                              shrinkWrap: true,
                              padding: EdgeInsets.only(
                                  top: 30, left: 10, right: 10, bottom: 0),
                              children: model.users.map((e) {
                                return GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    height: 100,
                                    child: Column(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                color: Colors.black,
                                                width: 1,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(1)),
                                          child: Column(children: [
                                            _buildTextView(e.name),
                                            Text(e.address),
                                          ]),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        )
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
