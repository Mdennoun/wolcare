class Request {
  final String id;
  final String title;
  final String createAt;
  final String pseudoUser;
  final String idCreator;
  final String description;
  final String idVolunteer;


  Request(this.id, this.title, this.createAt, this.pseudoUser, this.idCreator, this.description, this.idVolunteer);

  factory Request.fromJson(Map<String, dynamic> json) {
    return Request(

      json["_id"],
      json["title"],
      json["createAt"],
      json["idCreator"],
      json["psuedo"],
      json["description"],
      json["idVolunteer"]



    );
  }
}