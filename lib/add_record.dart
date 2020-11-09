import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:se_project02/routes/router.gr.dart';
import 'package:se_project02/models/userModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddRecord extends StatefulWidget {
  final UserModel user;
  const AddRecord({Key key, this.user}) : super(key: key);
  @override
  _AddRecordState createState() => _AddRecordState();
}

class _AddRecordState extends State<AddRecord> {
  TextEditingController illnessController = TextEditingController();
  TextEditingController daysSinceController = TextEditingController();
  TextEditingController medicinesController = TextEditingController();
  TextEditingController durationController = TextEditingController();
  TextEditingController allergiesController = TextEditingController();
  TextEditingController testsToController = TextEditingController();
  TextEditingController commentController = TextEditingController();

  Map<String, dynamic> medi;
  CollectionReference collectionReference =
      Firestore.instance.collection("PatientData");
  DateTime now = DateTime.now();
  addData() {
    medi = {
      "date": (now.year.toString() +
          "/" +
          now.month.toString() +
          "/" +
          now.day.toString() +
          " - " +
          now.hour.toString() +
          ":" +
          now.minute.toString() +
          ":" +
          now.second.toString()),
      //DateTime.now().toString(),
      "patient_id": widget.user.id,
      "illness": illnessController.text,
      "daysSince": daysSinceController.text,
      "medicines": medicinesController.text,
      "duration": durationController.text,
      "allergies": allergiesController.text,
      "testsTo": testsToController.text,
      "comments": commentController.text,
    };

    collectionReference
        .add(medi)
        //.whenComplete(() => print('Added to the database'))
        .whenComplete(() => Fluttertoast.showToast(
              msg: " Record Added Successfully",
              toastLength: Toast.LENGTH_SHORT,
              textColor: Colors.black,
              fontSize: 16,
              backgroundColor: Colors.grey[200],
            ))
        .whenComplete(() => ExtendedNavigator.of(context).push(
            Routes.userDocView,
            arguments: UserDocViewArguments(user: widget.user)));
  }

  _buildTextField(
      TextEditingController controller, String hint, String labelText) {
    return Container(
      child: TextField(
        controller: controller,
        decoration: InputDecoration(labelText: labelText, hintText: hint),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    //dynamic currentTime = DateFormat.jm().format(DateTime.now());
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Add Patient Records',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        body: ListView(
          padding: EdgeInsets.all(10),
          children: [
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                    width: 3,
                  ),
                  borderRadius: BorderRadius.circular(10)),
              child: FormBuilder(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      _buildTextField(
                          illnessController, 'Describe illness ', 'Illness '),
                      _buildTextField(daysSinceController,
                          'Days since symptoms', 'Num of Days'),
                      _buildTextField(medicinesController, 'Names of Medicines',
                          'Medicines'),
                      _buildTextField(durationController,
                          'Duration of medication', 'Duration'),
                      _buildTextField(allergiesController,
                          'Enter Special allergies', 'Special allergies'),
                      _buildTextField(
                          testsToController, 'Tests to be performed', 'Tests'),
                      _buildTextField(
                          commentController, 'Enter More Info', 'Comments'),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // bool res = await Auth().addMedi(_medi);
            // print(res);
            // setState(() {
            //   _mediList.add(Medicine());
            // });
          },
          tooltip: 'Increment',
          child: Icon(Icons.call),
          elevation: 2.0,
          backgroundColor: Colors.green,
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.info_sharp),
              label: 'About us',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.check_box),
              label: 'Submit',
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
                addData();
                break;
              default:
            }
          },
        ));
  }
}
