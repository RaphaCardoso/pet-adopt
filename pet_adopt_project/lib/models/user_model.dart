class UserModel {
  final String name;
  final String email;
  final String phone;
  final String? image;
  final String password;
  final String confirmpassword;

  UserModel(
      {required this.name,
      required this.email,
      required this.phone,
      this.image,
      required this.password,
      required this.confirmpassword});

  UserModel.fromMap(Map<String, dynamic> map)
      : name = map['name'],
        email = map['email'],
        phone = map['phone'],
        image = map['image'],
        password = map['passaword'],
        confirmpassword = map['confirmpassword'];

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'phone': phone,
      'password': password,
      'confirmpassword': confirmpassword,
    };
  }

  @override
  String toString() {
    return 'UserModel{name: $name, email: $email, phone: $phone, password: $password, confirmpassword: $confirmpassword}';
  }
}
