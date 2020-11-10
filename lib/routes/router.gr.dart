// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../about_us.dart';
import '../add_event.dart';
import '../add_record.dart';
import '../admin_home.dart';
import '../appointments_for_doctor.dart';
import '../appointments_for_patient.dart';
import '../appointments_form.dart';
import '../calendar.dart';
import '../chatbot.dart';
import '../doc_Profile_Main.dart';
import '../docmanageappointments.dart';
import '../docprofile.dart';
import '../doctor_signup.dart';
import '../stepcount.dart';
import '../main.dart';
import '../models/event.dart';
import '../models/userModel.dart';
import '../patient_signup.dart';
import '../pharm_signup.dart';
import '../pharmacy_list.dart';
import '../pharmprofile.dart';
import '../user_admin_view.dart';
import '../user_doc_view.dart';
import '../user_profile.dart';
import '../view_event.dart';
import '../view_prescriptions.dart';
import '../views/homepage.dart';
import '../stepcount.dart';

class Routes {
  static const String InitialRoute = '/';
  static const String addRecord = '/add-record';
  static const String patientSignup = '/patient-signup';
  static const String doctorSignup = '/doctor-signup';
  static const String docProfile = '/doc-profile';
  static const String adminHome = '/admin-home';
  static const String pharmProfile = '/pharm-profile';
  static const String pharmSignup = '/pharm-signup';
  static const String userDocView = '/user-doc-view';
  static const String userAdminView = '/user-admin-view';
  static const String userProfile = '/user-profile';
  static const String appointmentsForDoctor = '/appointments-for-doctor';
  static const String appointmentsForPatient = '/appointments-for-patient';
  static const String addAppointment = '/add-appointment';
  static const String docProfileMain = '/doc-profile-main';
  static const String calendar = '/Calendar';
  static const String addEventPage = '/add-event-page';
  static const String eventDetailsPage = '/event-details-page';
  static const String viewPrescriptions = '/view-prescriptions';
  static const String homePage = '/home-page';
  static const String aboutUs = '/about-us';
  static const String docManageAppointments = '/doc-manage-appointments';
  static const String stepCount = '/step-count';
  static const String chatBot = '/chat-bot';
  static const String pharmacyList = '/pharmacy-list';
  static const all = <String>{
    InitialRoute,
    addRecord,
    patientSignup,
    doctorSignup,
    docProfile,
    adminHome,
    pharmProfile,
    pharmSignup,
    userDocView,
    userAdminView,
    userProfile,
    appointmentsForDoctor,
    appointmentsForPatient,
    addAppointment,
    docProfileMain,
    calendar,
    addEventPage,
    eventDetailsPage,
    viewPrescriptions,
    homePage,
    aboutUs,
    docManageAppointments,
    chatBot,
    pharmacyList,
    stepCount,
  };
}

class NewRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.InitialRoute, page: MyHomePage),
    RouteDef(Routes.addRecord, page: AddRecord),
    RouteDef(Routes.patientSignup, page: PatientSignup),
    RouteDef(Routes.doctorSignup, page: DoctorSignup),
    RouteDef(Routes.docProfile, page: DocProfile),
    RouteDef(Routes.adminHome, page: AdminHome),
    RouteDef(Routes.pharmProfile, page: PharmProfile),
    RouteDef(Routes.pharmSignup, page: PharmSignup),
    RouteDef(Routes.userDocView, page: UserDocView),
    RouteDef(Routes.userAdminView, page: UserAdminView),
    RouteDef(Routes.userProfile, page: UserProfile),
    RouteDef(Routes.appointmentsForDoctor, page: AppointmentsForDoctor),
    RouteDef(Routes.appointmentsForPatient, page: AppointmentsForPatient),
    RouteDef(Routes.addAppointment, page: AddAppointment),
    RouteDef(Routes.docProfileMain, page: DocProfileMain),
    RouteDef(Routes.calendar, page: Calendar),
    RouteDef(Routes.addEventPage, page: AddEventPage),
    RouteDef(Routes.eventDetailsPage, page: EventDetailsPage),
    RouteDef(Routes.viewPrescriptions, page: ViewPrescriptions),
    RouteDef(Routes.homePage, page: HomePage),
    RouteDef(Routes.aboutUs, page: AboutUs),
    RouteDef(Routes.docManageAppointments, page: DocManageAppointments),
    RouteDef(Routes.stepCount, page: StepCount),
    RouteDef(Routes.chatBot, page: ChatBot),
    RouteDef(Routes.pharmacyList, page: PharmacyList),
  ];
  @override
  Map<Type, AutoRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, AutoRouteFactory>{
    MyHomePage: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => MyHomePage(),
        settings: data,
      );
    },
    AddRecord: (data) {
      final args = data.getArgs<AddRecordArguments>(
        orElse: () => AddRecordArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => AddRecord(
          key: args.key,
          user: args.user,
        ),
        settings: data,
      );
    },
    PatientSignup: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => PatientSignup(),
        settings: data,
      );
    },
    DoctorSignup: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => DoctorSignup(),
        settings: data,
      );
    },
    DocProfile: (data) {
      final args = data.getArgs<DocProfileArguments>(
        orElse: () => DocProfileArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => DocProfile(
          key: args.key,
          user: args.user,
        ),
        settings: data,
      );
    },
    AdminHome: (data) {
      final args = data.getArgs<AdminHomeArguments>(
        orElse: () => AdminHomeArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => AdminHome(
          key: args.key,
          user: args.user,
        ),
        settings: data,
      );
    },
    PharmProfile: (data) {
      final args = data.getArgs<PharmProfileArguments>(
        orElse: () => PharmProfileArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => PharmProfile(
          key: args.key,
          user: args.user,
        ),
        settings: data,
      );
    },
    PharmSignup: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => PharmSignup(),
        settings: data,
      );
    },
    UserDocView: (data) {
      final args = data.getArgs<UserDocViewArguments>(
        orElse: () => UserDocViewArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => UserDocView(
          key: args.key,
          user: args.user,
        ),
        settings: data,
      );
    },
    UserAdminView: (data) {
      final args = data.getArgs<UserAdminViewArguments>(
        orElse: () => UserAdminViewArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => UserAdminView(
          key: args.key,
          user: args.user,
        ),
        settings: data,
      );
    },
    UserProfile: (data) {
      final args = data.getArgs<UserProfileArguments>(
        orElse: () => UserProfileArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => UserProfile(
          key: args.key,
          user: args.user,
        ),
        settings: data,
      );
    },
    AppointmentsForDoctor: (data) {
      final args = data.getArgs<AppointmentsForDoctorArguments>(
        orElse: () => AppointmentsForDoctorArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => AppointmentsForDoctor(
          key: args.key,
          user: args.user,
        ),
        settings: data,
      );
    },
    AppointmentsForPatient: (data) {
      final args = data.getArgs<AppointmentsForPatientArguments>(
        orElse: () => AppointmentsForPatientArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => AppointmentsForPatient(
          key: args.key,
          user: args.user,
        ),
        settings: data,
      );
    },
    AddAppointment: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => AddAppointment(),
        settings: data,
      );
    },
    DocProfileMain: (data) {
      final args = data.getArgs<DocProfileMainArguments>(
        orElse: () => DocProfileMainArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => DocProfileMain(
          key: args.key,
          user: args.user,
          type: args.type,
        ),
        settings: data,
      );
    },
    Calendar: (data) {
      final args = data.getArgs<CalendarArguments>(
        orElse: () => CalendarArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => Calendar(
          key: args.key,
          user: args.user,
        ),
        settings: data,
      );
    },
    AddEventPage: (data) {
      final args = data.getArgs<AddEventPageArguments>(
        orElse: () => AddEventPageArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => AddEventPage(
          key: args.key,
          user: args.user,
          note: args.note,
          userNow: args.userNow,
        ),
        settings: data,
      );
    },
    EventDetailsPage: (data) {
      final args = data.getArgs<EventDetailsPageArguments>(
        orElse: () => EventDetailsPageArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => EventDetailsPage(
          key: args.key,
          event: args.event,
        ),
        settings: data,
      );
    },
    ViewPrescriptions: (data) {
      final args = data.getArgs<ViewPrescriptionsArguments>(
        orElse: () => ViewPrescriptionsArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => ViewPrescriptions(
          key: args.key,
          user: args.user,
        ),
        settings: data,
      );
    },
    HomePage: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => HomePage(),
        settings: data,
      );
    },
    AboutUs: (data) {
      final args = data.getArgs<AboutUsArguments>(
        orElse: () => AboutUsArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => AboutUs(
          key: args.key,
          user: args.user,
        ),
        settings: data,
      );
    },
    DocManageAppointments: (data) {
      final args = data.getArgs<DocManageAppointmentsArguments>(
        orElse: () => DocManageAppointmentsArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => DocManageAppointments(
          key: args.key,
          user: args.user,
        ),
        settings: data,
      );
    },
    StepCount: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => StepCount(),
        settings: data,
      );
    },
    ChatBot: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => ChatBot(),
        settings: data,
      );
    },
    PharmacyList: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => PharmacyList(),
        settings: data,
      );
    },
  };
}

/// ************************************************************************
/// Arguments holder classes
/// *************************************************************************

/// AddRecord arguments holder class
class AddRecordArguments {
  final Key key;
  final UserModel user;
  AddRecordArguments({this.key, this.user});
}

/// DocProfile arguments holder class
class DocProfileArguments {
  final Key key;
  final UserModel user;
  DocProfileArguments({this.key, this.user});
}

/// AdminHome arguments holder class
class AdminHomeArguments {
  final Key key;
  final UserModel user;
  AdminHomeArguments({this.key, this.user});
}

/// PharmProfile arguments holder class
class PharmProfileArguments {
  final Key key;
  final UserModel user;
  PharmProfileArguments({this.key, this.user});
}

/// UserDocView arguments holder class
class UserDocViewArguments {
  final Key key;
  final UserModel user;
  UserDocViewArguments({this.key, this.user});
}

/// UserAdminView arguments holder class
class UserAdminViewArguments {
  final Key key;
  final UserModel user;
  UserAdminViewArguments({this.key, this.user});
}

/// UserProfile arguments holder class
class UserProfileArguments {
  final Key key;
  final UserModel user;
  UserProfileArguments({this.key, this.user});
}

/// AppointmentsForDoctor arguments holder class
class AppointmentsForDoctorArguments {
  final Key key;
  final UserModel user;
  AppointmentsForDoctorArguments({this.key, this.user});
}

/// AppointmentsForPatient arguments holder class
class AppointmentsForPatientArguments {
  final Key key;
  final UserModel user;
  AppointmentsForPatientArguments({this.key, this.user});
}

/// DocProfileMain arguments holder class
class DocProfileMainArguments {
  final Key key;
  final UserModel user;
  final String type;
  DocProfileMainArguments({this.key, this.user, this.type});
}

/// Calendar arguments holder class
class CalendarArguments {
  final Key key;
  final UserModel user;
  CalendarArguments({this.key, this.user});
}

/// AddEventPage arguments holder class
class AddEventPageArguments {
  final Key key;
  final UserModel user;
  final EventModel note;
  final UserModel userNow;
  AddEventPageArguments({this.key, this.user, this.note, this.userNow});
}

/// EventDetailsPage arguments holder class
class EventDetailsPageArguments {
  final Key key;
  final EventModel event;
  EventDetailsPageArguments({this.key, this.event});
}

/// ViewPrescriptions arguments holder class
class ViewPrescriptionsArguments {
  final Key key;
  final UserModel user;
  ViewPrescriptionsArguments({this.key, this.user});
}

/// AboutUs arguments holder class
class AboutUsArguments {
  final Key key;
  final UserModel user;
  AboutUsArguments({this.key, this.user});
}

/// DocManageAppointments arguments holder class
class DocManageAppointmentsArguments {
  final Key key;
  final UserModel user;
  DocManageAppointmentsArguments({this.key, this.user});
}

/// ForgetPassword arguments holder class
class StepCountArguments {
  final Key key;
  final UserModel user;
  StepCountArguments({this.key, this.user});
}
