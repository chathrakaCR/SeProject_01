import 'package:provider/provider.dart';
import 'package:se_project02/models/event.dart';
import 'package:flutter/material.dart';
import 'package:se_project02/event_firestore_service.dart';
import 'package:se_project02/models/userModel.dart';
import 'package:se_project02/services/auth.dart';
import 'package:se_project02/viewmodels/time_view.dart';

String t;
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
  var selectTime;

  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
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
        body: Form(
          key: _formKey,
          child: Container(
            alignment: Alignment.center,
            child: ListView(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 8.0),
                  child: TextFormField(
                    controller: _illnessDescription,
                    validator: (value) =>
                        (value.isEmpty) ? "Please Enter title" : null,
                    style: style,
                    decoration: InputDecoration(
                        labelText: "Description About the illness",
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8))),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 8.0),
                  child: TextFormField(
                    controller: _timeSlot,
                    minLines: 1, //can be adjest the box sizes....
                    maxLines: 1, //can be adjest the box sizes....
                    validator: (value) =>
                        (value.isEmpty) ? "Please Select Time Slot" : null,
                    style: style,
                    decoration: InputDecoration(
                        labelText: "Select Time Slot Number",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8))),
                  ),
                ),
                SizedBox(height: 8.0),
                for (int i = 0; i < widget.user.slots.length; i++)
                  Container(
                    child: Consumer<TimeViewModel>(
                        builder: (context, model, child) {
                      return model.time != null && model.time.length > 0
                          ? ListView(
                              shrinkWrap: true,
                              children: model.time.map((e) {
                                return GestureDetector(
                                  onTap: () {
                                    t = e.slots[i];
                                  },
                                  child: Container(
                                    height: 50,
                                    child: Column(
                                      children: [
                                        Text(e.slots[i]),
                                      ],
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
                  title: Text("Time"),
                  subtitle: Text(
                      "${_eventDate.year} - ${_eventDate.month} - ${_eventDate.day}"),
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
                                    "time_slot": t,
                                    "event_date": widget.note.eventDate
                                  });
                                } else {
                                  await eventDBS.createItem(EventModel(
                                      id: userNow.id,
                                      doc_id: widget.user.id,
                                      illness: _illnessDescription.text,
                                      timeSlot: t,
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
                              style: style.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
              ],
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
