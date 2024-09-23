// ignore_for_file: camel_case_types

class credential {
  int? id;
  String firstName;
  String lastName;
  String number;
  String userName;
  String pswd;

  credential(
      {required this.firstName,
        required this.lastName,
        required this.number,
        required this.userName,
        required this.pswd,
        this.id});

  factory credential.fromJson(Map json) {
    return credential(
        id: json['id'] ?? 0,
        firstName: json['firstname'] ?? 'unknown',
        lastName: json['lastname'] ?? 'unknown',
        number: json['number'] ?? 'unknown',
        userName: json['username'] ?? 'unknown',
        pswd: json['password'] ?? 'unknown');
  }

  @override
  String toString() {
    return '{"id": $id,"firstname":"$firstName","lastname":"$lastName","number":"$number","username":"$userName","password":"$pswd"}';
  }
}
