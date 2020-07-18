class User {
  final String lastName;
  final String firstName;
  final String type;

  User(this.lastName, this.firstName, this.type);

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      json["lastname"],
      json["firstname"],
      json["type"],
    );
  }
}
