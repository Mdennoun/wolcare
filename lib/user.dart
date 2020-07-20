class User {

  final String id;
  final String lastName;
  final String firstName;
  final String email;
  final String password;
  final String type;
  final String pseudo;
  final String photo;
  final bool sex;
  final int requestIssued;
  final int requestFulfilled;





  User(this.id, this.lastName, this.firstName, this.email, this.password, this.type, this.pseudo, this.photo, this.sex, this.requestIssued, this.requestFulfilled);

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      json["_id"],
      json["lastname"],
      json["firstname"],
      json["email"],
      json["password"],
      json["type"],
      json["pseudo"],
      json["photo"],
      json["sex"],
      json["requestIssued"],
      json["requestFulfilled"],
    );
  }
}
