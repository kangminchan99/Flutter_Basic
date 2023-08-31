class Album {
  int? userid;
  int? id;
  String? title;
  Album({this.id, this.title, this.userid});

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      userid: json['userid'],
      id: json['id'],
      title: json['title'],
    );
  }
}
