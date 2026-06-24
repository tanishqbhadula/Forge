class UserModel {
  final String firstname;
  final String lastname;
  final String email;
  final String password;

  const UserModel({
    required this.firstname,
    required this.lastname,
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toJSON() {
    return {
      "first_name" : firstname,
      "last_name" : lastname,
      "email" : email,
      "password" : password,
    };
  }
}