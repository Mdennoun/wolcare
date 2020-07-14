class Request {
  final String title;
  final String createAt;
  final String psuedoUser;

  Request(this.title, this.createAt, this.psuedoUser);

  factory Request.fromJson(Map<String, dynamic> json) {
    return Request(
      json["title"],
      json["createAt"],
      json["datEnd"],
    );
  }
}