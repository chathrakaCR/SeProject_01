import 'package:auto_route/auto_route_annotations.dart';
import 'package:se_project02/add_record.dart';
import 'package:se_project02/stepcount.dart';
import 'package:se_project02/user_doc_view.dart';
import 'package:se_project02/view_prescriptions.dart';

import '../admin_home.dart';
import '../docprofile.dart';
import '../doctor_signup.dart';
import '../main.dart';
import '../patient_signup.dart';
import '../pharmprofile.dart';
import '../pharm_signup.dart';
import '../user_profile.dart';
import '../appointments_for_doctor.dart';
import '../appointments_for_patient.dart';
import '../appointments_form.dart';
import '../calendar.dart';
import '../add_event.dart';
import '../user_doc_view.dart';
import '../user_admin_view.dart';
import '../doc_Profile_Main.dart';
import '../view_event.dart';
import '../view_prescriptions.dart';
import '../views/homepage.dart';
import '../about_us.dart';
import '../docmanageappointments.dart';
import '../stepcount.dart';
import '../chatbot.dart';
import '../pharmacy_list.dart';
import '../stepcount.dart';

@MaterialAutoRouter(
  routes: <AutoRoute>[
    // initial route is named "/"
    MaterialRoute(page: MyHomePage, initial: true, name: "InitialRoute"),
    MaterialRoute(page: AddRecord, initial: false),
    MaterialRoute(page: PatientSignup, initial: false),
    MaterialRoute(page: DoctorSignup, initial: false),
    MaterialRoute(page: DocProfile, initial: false),
    MaterialRoute(page: AdminHome, initial: false),
    MaterialRoute(page: PharmProfile, initial: false),
    MaterialRoute(page: PharmSignup, initial: false),
    MaterialRoute(page: UserDocView, initial: false),
    MaterialRoute(page: UserAdminView, initial: false),
    MaterialRoute(page: UserProfile, initial: false),
    MaterialRoute(page: AppointmentsForDoctor, initial: false),
    MaterialRoute(page: AppointmentsForPatient, initial: false),
    MaterialRoute(page: AddAppointment, initial: false),
    MaterialRoute(page: DocProfileMain, initial: false), //newly added...
    MaterialRoute(page: Calendar, initial: false),
    MaterialRoute(page: AddEventPage, initial: false),
    MaterialRoute(page: EventDetailsPage, initial: false),
    MaterialRoute(page: ViewPrescriptions, initial: false),
    MaterialRoute(page: HomePage, initial: false),
    MaterialRoute(page: AboutUs, initial: false),
    MaterialRoute(page: DocManageAppointments, initial: false),
    MaterialRoute(page: StepCount, initial: false),
    MaterialRoute(page: ChatBot, initial: false),
    MaterialRoute(page: PharmacyList, initial: false),
  ],
)
class $NewRouter {}

// '/patientsignup': (BuildContext context) => new PatientSignup(),
//         '/doctorsignup': (BuildContext context) => new DoctorSignup(),
//         '/docprofile': (BuildContext context) => new DocProfile(),
//         '/main': (BuildContext context) => new MyHomePage(),
//         '/adminhome': (BuildContext context) => new AdminHome(),
//         '/pharmprofile': (BuildContext context) => new PharmProfile(),
//         '/pharmsignup': (BuildContext context) => new PharmSignup(),
//         '/userprofile': (BuildContext context) => new UserProfile(),
//         '/docsearch': (BuildContext context) => new DocSearch(),
//         '/patientsearch': (BuildContext context) => new PatientSearch(),
//         '/addrecord': (BuildContext context) => new AddRecord(),
//         '/appointments': (BuildContext context) => new Appointments(),
//         '/appointmentsfordoctor': (BuildContext context) =>
//             new AppointmentsForDoctor(),
//         '/appointmentsform': (BuildContext context) => new AppointmentForm(),
