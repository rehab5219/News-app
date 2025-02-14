// import 'package:shared_preferences/shared_preferences.dart';
//
// class SharedHelper{
//   static SharedPreferences? prefs;
//
//   static Future<void> init () async {
//     prefs = await SharedPreferences.getInstance();
//   }
//
//   static save (String key, dynamic value) async {
//     if(value is int){
//       await prefs?.setInt(key, value);
//     }else if(value is double){
//       await prefs?.setDouble(key, value);
//     }else if(value is bool){
//       await prefs?.setBool(key, value);
//     }else if(value is String){
//       await prefs?.setString(key, value);
//     }else if(value is List<String>){
//       await prefs?.setStringList(key, value);
//     }else{
//       throw Exception("UnSupported type for Shared Helper");
//     }
//   }
//
//   static dynamic get(String key) {
//     return prefs?.get(key);
//   }
//
//   static Future<bool?> removeKey(String key) async {
//     return await prefs?.remove(key);
//   }
//
//   static clearAll() async {
//     return await prefs?.clear();
//   }
// }