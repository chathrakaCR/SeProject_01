import 'package:flutter/material.dart';

class DocProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Doc Profile',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
              icon: Icon(Icons.search),
              color: Colors.white,
              onPressed: () {
                showSearch(context: context, delegate: Searchdata());
              }),
        ],
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
                      'DOC NAME',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.white),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'E-MAIL',
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'REG-NUM',
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
                Navigator.of(context).pushNamed('/main');
              },
            )
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
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
            label: 'Settings',
          ),
        ],
        selectedItemColor: Colors.green[900],
        backgroundColor: Colors.lightGreen[200],
      ),
    );
  }
}

class Searchdata extends SearchDelegate<String> {
  final names = ['amal', 'kamal', 'nimal', 'kalum'];

  final recentsearch = ['kamal', 'niaml'];

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
    // TODO: implement buildResults
    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final finalList = query.isEmpty
        ? recentsearch
        : names.where((p) => p.startsWith(query)).toList();

    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        onTap: () {
          Navigator.of(context).pushNamed('/userprofile');
        },
        leading: Icon(Icons.person_rounded),
        title: RichText(
          text: TextSpan(
              text: finalList[index].substring(0, query.length),
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
              children: [
                TextSpan(
                    text: finalList[index].substring(query.length),
                    style: TextStyle(color: Colors.grey))
              ]),
        ),
      ),
      itemCount: finalList.length,
    );
  }
}
