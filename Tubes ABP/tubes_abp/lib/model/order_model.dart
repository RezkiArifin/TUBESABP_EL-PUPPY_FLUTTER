class order {
  int? id;
  String? produk;
  int? no_telp;
  String? jumlah;
  String? alamat;
  Null? createdAt;
  Null? updatedAt;

  order(
      {this.id,
      this.produk,
      this.no_telp,
      this.jumlah,
      this.alamat,
      this.createdAt,
      this.updatedAt});

  factory order.fromJson(dynamic json) {
    return order(
        id: json['id'],
        produk: json['produk'],
        no_telp: json['no_telp'],
        jumlah: json['jumlah'],
        alamat: json['alamat'],
        createdAt: json['created_at'],
        updatedAt: json['updated_at']);
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'produk': produk,
        'no_telp': no_telp,
        'jumlah': jumlah,
        'alamat': alamat,
        'created_at': createdAt,
        'updated_at': updatedAt,
      };
}
