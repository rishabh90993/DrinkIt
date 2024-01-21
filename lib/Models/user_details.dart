
import 'package:shared_preferences/shared_preferences.dart';

class UserDetails {
  String? name;
  String? email;
  String? uid;
  String? photoUrl;

  static UserDetails? currentUser;

  UserDetails({this.name, this.email, this.uid, this.photoUrl});

  Future<void> saveUserDetails() async {
    SharedPreferences _preference = await SharedPreferences.getInstance();
    _preference.setString("name", this.name ?? "");
    _preference.setString("email", this.email ?? "");
    _preference.setString("uid", this.uid ?? "");
    _preference.setString("photoUrl", this.photoUrl ?? "");
    currentUser = this;
  }

  static Future<bool> getUserDetails() async {
    SharedPreferences _preference = await SharedPreferences.getInstance();
    if(_preference.getString("email")==null) return false;

    currentUser = UserDetails(
      name: _preference.getString("name") ?? "",
      email: _preference.getString("email") ?? "",
      uid: _preference.getString("uid")?? "",
      photoUrl: _preference.getString("photoUrl") ?? "",
    );
    return true;
  }

}

