class Login {
  final bool auth;
  final String token;
  final String idUser;
  final String platform;

  Login(this.auth, this.token, this.idUser, this.platform);

  factory Login.fromJson(Map<String, dynamic> json) {
    return Login(
      json["auth"],
      json["token"],
      json["idUser"],
      json["platform"],
    );
  }
}