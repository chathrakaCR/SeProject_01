import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:se_project02/models/event.dart';
import 'package:flutter/material.dart';
import 'package:se_project02/event_firestore_service.dart';
import 'package:se_project02/models/userModel.dart';
import 'package:se_project02/services/auth.dart';
import 'package:se_project02/viewmodels/time_view.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

UserModel userNow;
Future<UserModel> getUser() async {
  userNow = await Auth().curUser();
}

class AddEventPage extends StatefulWidget {
  final UserModel user;
  final UserModel userNow;

  const AddEventPage({Key key, this.user, this.note, this.userNow})
      : super(key: key);

  final EventModel note;

  // const AddEventPage({Key key, this.note}) : super(key: key);

  @override
  _AddEventPageState createState() => _AddEventPageState();
}

class _AddEventPageState extends State<AddEventPage> {
  String x = "No";
  var selectedTime;

  // TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  TextEditingController _illnessDescription;
  TextEditingController _timeSlot;
  DateTime _eventDate;
  final _formKey = GlobalKey<FormState>();
  final _key = GlobalKey<ScaffoldState>();
  bool processing;

  @override
  void initState() {
    super.initState();
    _illnessDescription = TextEditingController(
        text: widget.note != null ? widget.note.illness : "");
    _timeSlot = TextEditingController(
        text: widget.note != null ? widget.note.timeSlot : "");

    _eventDate = DateTime.now();
    processing = false;
  }

  @override
  Widget build(BuildContext context) {
    getUser();
    return ChangeNotifierProvider(
      create: (context) => TimeViewModel(widget.user.id),
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.note != null ? "Edit Note" : "Add Appointment"),
        ),
        key: _key,
        body: Container(
          margin: EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Container(
              alignment: Alignment.center,
              child: ListView(
                children: <Widget>[
                  SizedBox(height: 8.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 8.0),
                    child: TextFormField(
                      controller: _illnessDescription,
                      validator: (value) =>
                          (value.isEmpty) ? "Please Enter title" : null,
                      //  style: style,
                      decoration: InputDecoration(
                          labelText: "Description About the illness",
                          filled: true,
                          fillColor: Colors.yellowAccent[50],
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15))),
                    ),
                  ),
                  SizedBox(height: 8.0),
                  ListTile(
                      title: Text(
                    'Select a time slot',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  )),
                  for (int i = 0; i < widget.user.slots.length; i++)
                    Container(
                      child: Consumer<TimeViewModel>(
                          builder: (context, model, child) {
                        return model.time != null && model.time.length > 0
                            ? ListView(
                                shrinkWrap: true,
                                children: model.time.map((e) {
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Center(
                                      child: Material(
                                        borderRadius:
                                            BorderRadius.circular(60.0),
                                        shadowColor: Colors.greenAccent,
                                        elevation: 4.0,
                                        child: MaterialButton(
                                          onPressed: () async {
                                            selectedTime = e.slots[i];
                                            DocumentReference docRef = Firestore
                                                .instance
                                                .collection('Users')
                                                .document(widget.user.id);
                                            DocumentSnapshot doc =
                                                await docRef.get();
                                            List items = doc.data['slots'];
                                            if (items.contains(selectedTime) ==
                                                true) {
                                              docRef.updateData({
                                                'slots': FieldValue.arrayRemove(
                                                    [selectedTime])
                                              });
                                            }
                                          },
                                          child: Container(
                                            height: 50,
                                            child: Column(
                                              children: <Widget>[
                                                //Text(e.date),

                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Container(
                                                    child: Text(
                                                      e.slots[i],
                                                      style: TextStyle(
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                }).toList(),
                              )
                            : Container();
                      }),
                    ),
                  const SizedBox(height: 10.0),
                  ListTile(
                    title: Text(
                      "Select Date",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      "${_eventDate.year} - ${_eventDate.month} - ${_eventDate.day}",
                      style: TextStyle(fontSize: 25),
                    ),
                    onTap: () async {
                      DateTime picked = await showDatePicker(
                          context: context,
                          initialDate: _eventDate,
                          firstDate: DateTime(_eventDate.year - 5),
                          lastDate: DateTime(_eventDate.year + 5));
                      if (picked != null) {
                        setState(() {
                          _eventDate = picked;
                        });
                      }
                    },
                  ),
                  SizedBox(height: 8.0),
                  processing
                      ? Center(child: CircularProgressIndicator())
                      : Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Material(
                            elevation: 5.0,
                            borderRadius: BorderRadius.circular(30.0),
                            color: Theme.of(context).primaryColor,
                            child: MaterialButton(
                              onPressed: () async {
                                if (_formKey.currentState.validate()) {
                                  setState(() {
                                    processing = true;
                                  });
                                  if (widget.note != null) {
                                    await eventDBS.updateData(widget.note.id, {
                                      //"doc_id": widget.user.id,
                                      "illness": _illnessDescription.text,
                                      //    "time_slot": _timeSlot.text,
                                      "event_date": widget.note.eventDate
                                    });
                                  } else {
                                    await eventDBS.createItem(EventModel(
                                        id: userNow.id,
                                        doc_id: widget.user.id,
                                        illness: _illnessDescription.text,
                                        timeSlot: selectedTime,
                                        eventDate: _eventDate));
                                  }
                                  Navigator.pop(context);
                                  setState(() {
                                    processing = false;
                                  });
                                }
                                //Navigator.pop(context);
                              },
                              child: Text(
                                "BOOK",
                              ),
                            ),
                          ),
                        ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _illnessDescription.dispose();

    _timeSlot.dispose();

    super.dispose();
  }
}
