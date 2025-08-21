class StokMobilModel {
  int? idGudang;
  int? idBarang;
  String? nama;
  String? kode;
  String? satuan;
  String? kategori;
  int? hargaDasar;
  int? stok;
  List<HargaJual>? hargaJual;
  List<Konversi>? konversi;

  StokMobilModel({
    this.idGudang,
    this.idBarang,
    this.nama,
    this.kode,
    this.satuan,
    this.kategori,
    this.hargaDasar,
    this.stok,
    this.hargaJual,
    this.konversi,
  });

  factory StokMobilModel.fromJson(Map<String, dynamic> json) {
    return StokMobilModel(
      idGudang: json['id_gudang'],
      idBarang: json['id_barang'],
      nama: json['nama'],
      kode: json['kode'],
      satuan: json['satuan'],
      kategori: json['kategori'],
      hargaDasar: json['harga_dasar'],
      stok: json['stok'],
      hargaJual: json['harga_jual'] != null
          ? (json['harga_jual'] as List)
                .map((e) => HargaJual.fromJson(e))
                .toList()
          : [],
      konversi: json['konversi'] != null
          ? (json['konversi'] as List).map((e) => Konversi.fromJson(e)).toList()
          : [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id_gudang": idGudang,
      "id_barang": idBarang,
      "nama": nama,
      "kode": kode,
      "satuan": satuan,
      "kategori": kategori,
      "harga_dasar": hargaDasar,
      "stok": stok,
      "harga_jual": hargaJual?.map((e) => e.toJson()).toList(),
      "konversi": konversi?.map((e) => e.toJson()).toList(),
    };
  }
}

class HargaJual {
  int? id;
  int? tipeKonsumenId;
  int? barangId;
  int? harga;
  String? createdAt;
  String? updatedAt;
  Tipe? tipe;

  HargaJual({
    this.id,
    this.tipeKonsumenId,
    this.barangId,
    this.harga,
    this.createdAt,
    this.updatedAt,
    this.tipe,
  });

  factory HargaJual.fromJson(Map<String, dynamic> json) {
    return HargaJual(
      id: json['id'],
      tipeKonsumenId: json['tipe_konsumen_id'],
      barangId: json['barang_id'],
      harga: json['harga'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      tipe: json['tipe'] != null ? Tipe.fromJson(json['tipe']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "tipe_konsumen_id": tipeKonsumenId,
      "barang_id": barangId,
      "harga": harga,
      "created_at": createdAt,
      "updated_at": updatedAt,
      "tipe": tipe?.toJson(),
    };
  }
}

class Tipe {
  int? id;
  String? nama;

  Tipe({this.id, this.nama});

  factory Tipe.fromJson(Map<String, dynamic> json) {
    return Tipe(id: json['id'], nama: json['nama']);
  }

  Map<String, dynamic> toJson() {
    return {"id": id, "nama": nama};
  }
}

class Konversi {
  int? id;
  int? idBarang;
  int? idSatuan;
  int? no;
  int? nilai;
  String? createdAt;
  String? updatedAt;
  Satuan? satuan;

  Konversi({
    this.id,
    this.idBarang,
    this.idSatuan,
    this.no,
    this.nilai,
    this.createdAt,
    this.updatedAt,
    this.satuan,
  });

  factory Konversi.fromJson(Map<String, dynamic> json) {
    return Konversi(
      id: json['id'],
      idBarang: json['id_barang'],
      idSatuan: json['id_satuan'],
      no: json['no'],
      nilai: json['nilai'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      satuan: json['satuan'] != null ? Satuan.fromJson(json['satuan']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "id_barang": idBarang,
      "id_satuan": idSatuan,
      "no": no,
      "nilai": nilai,
      "created_at": createdAt,
      "updated_at": updatedAt,
      "satuan": satuan?.toJson(),
    };
  }
}

class Satuan {
  int? id;
  String? satuan;

  Satuan({this.id, this.satuan});

  factory Satuan.fromJson(Map<String, dynamic> json) {
    return Satuan(id: json['id'], satuan: json['satuan']);
  }

  Map<String, dynamic> toJson() {
    return {"id": id, "satuan": satuan};
  }
}
