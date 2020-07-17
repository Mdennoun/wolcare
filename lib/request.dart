class Request {
  final String id;
  final String title;
  final String createAt;
  final String psuedoUser;

  Request(this.id, this.title, this.createAt, this.psuedoUser);

  factory Request.fromJson(Map<String, dynamic> json) {
    return Request(

      json["_id"],
      json["title"],
      json["createAt"],
      json["datEnd"],
    );
  }
}