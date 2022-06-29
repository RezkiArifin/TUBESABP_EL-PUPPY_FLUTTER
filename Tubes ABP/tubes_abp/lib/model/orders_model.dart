class orders {
  String? produk;
  String? no_telp;
  String? jumlah;
  String? alamat;
  Null? createdAt;
  Null? updatedAt;

  orders(
      {this.produk,
      this.no_telp,
      this.jumlah,
      this.alamat,
      this.createdAt,
      this.updatedAt});

  factory orders.fromJson(dynamic json) {
    return orders(
        produk: json['produk'],
        no_telp: json['no_telp'],
        jumlah: json['jumlah'],
        alamat: json['alamat'],
        createdAt: json['created_at'],
        updatedAt: json['updated_at']);
  }

  Map<String, dynamic> toJson() => {
        'produk': produk,
        'no_telp': no_telp,
        'jumlah': jumlah,
        'alamat': alamat,
        'created_at': createdAt,
        'updated_at': updatedAt,
      };
}
