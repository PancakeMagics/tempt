part of '../../service.dart';

/// [Users] Table should be the only drift implementation.
///
/// 1. It is redundant to generate many DataCompanionClass, DataTable.
/// 2. [User] have many field, instead of [_ImplFirestore] and [_ImplHive] doing transactions all through [Json],
///    [_ImplDrift] makes [User]-instance's transactions be like a language.
///
@DataClassName('User')
class Users extends Table {
  const Users();

  IntColumn get id => integer().autoIncrement()();
  TextColumn get idFireAuth => text()();
  // TextColumn get
}

// TODO
// /// app user
// class AppUser {
//   final String name;
//   final String email;
//   final List<Note> noteList;
//   final List<Event> eventList;
//   final List<Course> courseList;
//   final Map<String, DateThings> dateThingsMap;
//
// // factory AppUser._initUser({
// //   String name = '',
// //   String email = '',
// // }) =>
// //     AppUser(
// //     );
//
// // factory AppUser.createUserByModel(Model model, Object data) {
// //   throw UnimplementedError();
// // }
//
// // TODO: authProvider
// // factory AppUser.createUserByLogin({
// //   required String name,
// //   required String email,
// // }) {
// //   final user = AppUser._initUser(
// //     name: name,
// //     email: email,
// //   );
// //   return user;
// // }
// }
//
// /// event user
// class EventUser {
//   final String name;
//   final Event currentEvent;
//   final List<Note> noteList;
//   final List<Event> relativeEventList;
//   final List<Course> relativeCourseList;
//   // final LinkedHashMap<String, DateThings> relativeDateThingsMap;
//
//   EventUser({
//     required this.name,
//     required this.currentEvent,
//     required this.noteList,
//     required this.relativeEventList,
//     required this.relativeCourseList,
//     // required this.relativeDateThingsMap,
//   });
//
// // factory EventUser.createUserByEvent({required Event currentEvent, required String name}) =>
// //     EventUser(
// //     );
//
// }
//
// /// org user
// class OrgUser {
//   final String name;
//   final String contact;
//   final Org currentOrg;
//   final List<String> currentOrgEventIdList;
//   final List<String> currentOrgCourseIdList;
//   final List<String> relativeEventIdList;
//   final List<String> relativeCourseIdList;
//   final List<Note> noteList;
// // final LinkedHashMap<String, DateThings> currentOrgDateThingsMap;
// // final LinkedHashMap<String, DateThings> relativeDateThingsMap;
//
//
// // factory OrgUser.createUserByOrg({
// //   required Org org,
// //   required String name,
// // }) =>
// //     OrgUser(
// //     );
//
// }


// TODO: unmodifiable: https://dart.academy/immutable-data-patterns-in-dart-and-flutter/#:~:text=There%20are%20a%20number%20of,what%20code%20is%20accessing%20it.