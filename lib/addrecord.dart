import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:se_project02/models/medicine.dart';

class AddRecord extends StatefulWidget {
  @override
  _AddRecordState createState() => _AddRecordState();
}

class _AddRecordState extends State<AddRecord> {
  List<Medicine> _mediList = new List();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Add Patient Records',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
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
                  child: Column(
                    children: [
                      FormBuilderTextField(
                        attribute: 'TYPE',
                        decoration: InputDecoration(
                            labelText: 'Type: ', hintText: 'Type of Illness'),
                      ),
                      FormBuilderTextField(
                        attribute: 'DAYS',
                        decoration: InputDecoration(
                            labelText: 'Days: ', hintText: 'Days from now'),
                      ),
                      FormBuilderTextField(
                        attribute: 'COMMENTS',
                        decoration: InputDecoration(
                            labelText: 'Comments: ',
                            hintText: 'Overall Comments'),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: _mediList.length,
                  itemBuilder: (context, index) => Container(
                    padding: EdgeInsets.only(bottom: 10),
                    margin: EdgeInsets.only(bottom: 10),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 3),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: FormBuilder(
                        child: Column(
                      children: [
                        FormBuilderTextField(
                          attribute: 'MEDCINE',
                          onChanged: (value) =>
                              _mediList[index].medicine = value,
                          decoration: InputDecoration(
                              icon: Icon(Icons.medical_services),
                              labelText: 'Medicine: '),
                        ),
                        FormBuilderTextField(
                          attribute: 'DOSE',
                          decoration: InputDecoration(
                              suffixText: 'mg/ml',
                              icon: Icon(Icons.format_color_reset_sharp),
                              labelText: 'Dose: '),
                        ),
                        FormBuilderTextField(
                          attribute: 'QUANTITY',
                          decoration: InputDecoration(
                              suffixText: 'tablets/pills',
                              icon: Icon(Icons.local_pharmacy),
                              labelText: 'Quantity: '),
                        ),
                        FormBuilderTextField(
                          attribute: 'FREQUENCY',
                          decoration: InputDecoration(
                              suffixText: 'hourly',
                              icon: Icon(Icons.lock_clock),
                              labelText: 'Frequecy: '),
                        ),
                        FormBuilderTextField(
                          attribute: 'COMMENTS1',
                          decoration: InputDecoration(
                              icon: Icon(Icons.comment),
                              labelText: 'Comments: '),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: FlatButton(
                              onPressed: () => setState(() {
                                    _mediList.removeAt(index);
                                  }),
                              child: Text('Remove')),
                        )
                      ],
                    )),
                  ),
                ),
              )
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              _mediList.add(Medicine());
            });
          },
          tooltip: 'Increment',
          child: Icon(Icons.add_box),
          elevation: 2.0,
          backgroundColor: Colors.green,
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: [
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
        ));
  }
}
