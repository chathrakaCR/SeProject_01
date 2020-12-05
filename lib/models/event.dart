import 'package:firebase_helpers/firebase_helpers.dart';

class EventModel extends DatabaseItem {
  final String doc_id;
  final String id;
  final String patient;
  final String doctor;
  final String illness;
  final String timeSlot;
  final DateTime eventDate;

  EventModel(
      {this.doc_id,
      this.id,
      this.doctor,
      this.patient,
      this.illness,
      this.timeSlot,
      this.eventDate})
      : super(id);

  factory EventModel.fromMap(Map data) {
    return EventModel(
      doctor: data["doctor"],
      patient: data["patient"],
      doc_id: data['doc_id'],
      illness: data['illness'],
      timeSlot: data['timeSlot'],
      eventDate: data['event_date'].toDate(),
    );
  }

  factory EventModel.fromDS(String id, Map<String, dynamic> data) {
    return EventModel(
      //patient: patient,
      id: id,
      doc_id: data['doc_id'],
      illness: data['illness'],
      timeSlot: data['timeSlot'],
      eventDate: data['event_date'].toDate(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "doctor":doctor,
      "patient": patient,
      "doc_id": doc_id,
      "illness": illness,
      "timeSlot": timeSlot,
      "event_date": eventDate,
      "id": id,
    };
  }
}
