import 'package:rapidinho/database/common.dart' as common;

// profile object for user to login and sign up
class Profile {
  int id;
  String name;
  String phone;
  String address;
  String password;
  String email;

  Profile(
      {this.id,
      this.name,
      this.phone,
      this.address,
      this.password,
      this.email});

  Profile.fromMap(Map<String, dynamic> res)
      : id = res["id"],
        name = res["name"],
        phone = res["phone"],
        address = res["address"],
        password = res["password"],
        email = res["email"];

  // data mapping to Profile object
  Map<String, Object> toMap() {
    return {
      common.id: id,
      common.name: name,
      common.phone: phone,
      common.address: address,
      common.password: password,
      common.email: email
    };
  }

  @override
  String toString() {
    return 'Profile (ID - $id, Name - $name, Phone - $phone, Location - $address, Email - $email)';
  }
}

Profile currentProfile = Profile(); // declare global profile object
