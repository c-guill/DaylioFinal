import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ManageData {
  final Future<SharedPreferences> preferences = SharedPreferences.getInstance();

  void setCodePin(String code) async{
    SharedPreferences prefs = await preferences;
    prefs.setString("pinCode", code);
  }

  Future<String> getCodePin() async{
    SharedPreferences prefs = await preferences;
    String? pc = prefs.getString("pinCode");
    return pc ?? "" ;
  }

  void setUID(User user) async{
    SharedPreferences prefs = await preferences;
    prefs.setString("uid", user.uid);
  }

  Future<String> getUID() async{
    SharedPreferences prefs = await preferences;
    String? uid = prefs.getString("uid");
    return uid ?? "" ;
  }

}