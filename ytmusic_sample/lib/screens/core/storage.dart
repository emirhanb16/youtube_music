import 'package:shared_preferences/shared_preferences.dart';

class Storage {
  loadUser() async {
    SharedPreferences storage = await SharedPreferences.getInstance();
    var name = storage.getString("name");
    var phone = storage.getString("phone");
    var id = storage.getInt("id");
    var email = storage.getString("email");

    if (id == null) {
      // oturum yok
      return null;
    } else {
      return {"id": id, "name": name, "phone": phone, "email": email};
    }
  }

  saveUser({
    required int id,
    required String name,
    required String email,
    required String phone,
  }) async {
    SharedPreferences storage = await SharedPreferences.getInstance();
    storage.setInt("id", id);
    storage.setString("name", name);
    storage.setString("phone", phone);
    storage.setString("email", email);
  }
}
