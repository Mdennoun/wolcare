class Workshop {
  final String title;
  final String dateAvailable;
  final String datEnd;
  final String id;
  final String description;
  final String createAt;

  Workshop(this.title, this.dateAvailable, this.datEnd, this.description,
      this.id, this.createAt);

  factory Workshop.fromJson(Map<String, dynamic> json) {
    return Workshop(
      json["title"],
      json["dateAvailable"],
      json["_id"],
      json["description"],
      json["datEnd"],
      json["createAt"],
    );
  }
}
