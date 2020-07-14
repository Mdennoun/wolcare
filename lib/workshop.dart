class Workshop {
  final String title;
  final String dateAvailable;
  final String datEnd;

  Workshop(this.title, this.dateAvailable, this.datEnd);

  factory Workshop.fromJson(Map<String, dynamic> json) {
    return Workshop(
      json["title"],
      json["dateAvailable"],
      json["datEnd"],
    );
  }
}