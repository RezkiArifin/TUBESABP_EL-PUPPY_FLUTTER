class notif {
  String? pesan;
  String? user;
  String? image_url;

  notif({this.pesan, this.user, this.image_url});

  factory notif.fromJson(dynamic json) {
    return notif(
        pesan: json['pesan'], user: json['user'], image_url: json['image_url']);
  }

  Map<String, dynamic> toJson() =>
      {'pesan': pesan, 'user': user, 'image_url': image_url};
}
