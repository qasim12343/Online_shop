class User{
  String firstName = "";
  String lastName = "";
  String password = "";
  String email = "";
  String phoneNumber = "";

  User({required this.firstName,lastName,required this.password, required this.email, required this.phoneNumber});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is User &&
              runtimeType == other.runtimeType &&
              firstName == other.firstName &&
              lastName == other.lastName &&
              password == other.password;

  @override
  int get hashCode =>
      firstName.hashCode ^ lastName.hashCode ^ password.hashCode;

  @override
  String toString() {
    return 'firstName: $firstName $lastName, password: $password';
  }
}