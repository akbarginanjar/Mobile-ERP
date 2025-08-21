class GudangModel {
  int? id;
  int? jenis;
  String? namaGudang;
  String? alamat;
  String? keterangan;
  Teritori? teritori;
  Karyawan? karyawan;
  Karyawan? driver;
  Kendaraan? kendaraan;

  GudangModel({
    this.id,
    this.jenis,
    this.namaGudang,
    this.alamat,
    this.keterangan,
    this.teritori,
    this.karyawan,
    this.driver,
    this.kendaraan,
  });

  factory GudangModel.fromJson(Map<String, dynamic> json) {
    return GudangModel(
      id: json['id'],
      jenis: json['jenis'],
      namaGudang: json['nama_gudang'],
      alamat: json['alamat'],
      keterangan: json['keterangan'],
      teritori: json['teritori'] != null
          ? Teritori.fromJson(json['teritori'])
          : null,
      karyawan: json['karyawan'] != null
          ? Karyawan.fromJson(json['karyawan'])
          : null,
      driver: json['driver'] != null ? Karyawan.fromJson(json['driver']) : null,
      kendaraan: json['kendaraan'] != null
          ? Kendaraan.fromJson(json['kendaraan'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "jenis": jenis,
      "nama_gudang": namaGudang,
      "alamat": alamat,
      "keterangan": keterangan,
      "teritori": teritori?.toJson(),
      "karyawan": karyawan?.toJson(),
      "driver": driver?.toJson(),
      "kendaraan": kendaraan?.toJson(),
    };
  }
}

class Teritori {
  int? id;
  String? namaTeritori;
  String? keterangan;
  List<dynamic>? anggota;

  Teritori({this.id, this.namaTeritori, this.keterangan, this.anggota});

  factory Teritori.fromJson(Map<String, dynamic> json) {
    return Teritori(
      id: json['id'],
      namaTeritori: json['nama_teritori'],
      keterangan: json['keterangan'],
      anggota: json['anggota'] ?? [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "nama_teritori": namaTeritori,
      "keterangan": keterangan,
      "anggota": anggota,
    };
  }
}

class Karyawan {
  int? id;
  int? jk;
  int? agama;
  int? statusPerkawinan;
  int? statusKaryawan;
  int? statusSp;
  String? kampusSekolah;
  String? pendidikanTerakhir;
  String? kualifikasiPendidikan;
  String? masaKerja;
  String? gradeKaryawan;
  String? fileFoto;
  String? tempatLahir;
  String? tanggalLahir;
  String? nik;
  String? nip;
  String? namaLengkap;
  String? noHp;
  String? email;
  String? alamat;
  String? urlFoto;
  String? jkDef;
  String? agamaDef;
  Jabatan? jabatan;

  Karyawan({
    this.id,
    this.jk,
    this.agama,
    this.statusPerkawinan,
    this.statusKaryawan,
    this.statusSp,
    this.kampusSekolah,
    this.pendidikanTerakhir,
    this.kualifikasiPendidikan,
    this.masaKerja,
    this.gradeKaryawan,
    this.fileFoto,
    this.tempatLahir,
    this.tanggalLahir,
    this.nik,
    this.nip,
    this.namaLengkap,
    this.noHp,
    this.email,
    this.alamat,
    this.urlFoto,
    this.jkDef,
    this.agamaDef,
    this.jabatan,
  });

  factory Karyawan.fromJson(Map<String, dynamic> json) {
    return Karyawan(
      id: json['id'],
      jk: json['jk'],
      agama: json['agama'],
      statusPerkawinan: json['status_perkawinan'],
      statusKaryawan: json['status_karyawan'],
      statusSp: json['status_sp'],
      kampusSekolah: json['kampus_sekolah'],
      pendidikanTerakhir: json['pendidikan_terakhir'],
      kualifikasiPendidikan: json['kualifikasi_pendidikan'],
      masaKerja: json['masa_kerja'],
      gradeKaryawan: json['grade_karyawan'],
      fileFoto: json['file_foto'],
      tempatLahir: json['tempat_lahir'],
      tanggalLahir: json['tanggal_lahir'],
      nik: json['nik'],
      nip: json['nip'],
      namaLengkap: json['nama_lengkap'],
      noHp: json['no_hp'],
      email: json['email'],
      alamat: json['alamat'],
      urlFoto: json['url_foto'],
      jkDef: json['jk_def'],
      agamaDef: json['agama_def'],
      jabatan: json['jabatan'] != null
          ? Jabatan.fromJson(json['jabatan'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "jk": jk,
      "agama": agama,
      "status_perkawinan": statusPerkawinan,
      "status_karyawan": statusKaryawan,
      "status_sp": statusSp,
      "kampus_sekolah": kampusSekolah,
      "pendidikan_terakhir": pendidikanTerakhir,
      "kualifikasi_pendidikan": kualifikasiPendidikan,
      "masa_kerja": masaKerja,
      "grade_karyawan": gradeKaryawan,
      "file_foto": fileFoto,
      "tempat_lahir": tempatLahir,
      "tanggal_lahir": tanggalLahir,
      "nik": nik,
      "nip": nip,
      "nama_lengkap": namaLengkap,
      "no_hp": noHp,
      "email": email,
      "alamat": alamat,
      "url_foto": urlFoto,
      "jk_def": jkDef,
      "agama_def": agamaDef,
      "jabatan": jabatan?.toJson(),
    };
  }
}

class Jabatan {
  int? id;
  String? namaJabatan;

  Jabatan({this.id, this.namaJabatan});

  factory Jabatan.fromJson(Map<String, dynamic> json) {
    return Jabatan(id: json['id'], namaJabatan: json['nama_jabatan']);
  }

  Map<String, dynamic> toJson() {
    return {"id": id, "nama_jabatan": namaJabatan};
  }
}

class Kendaraan {
  int? id;
  String? namaKendaraan;
  String? merkKendaraan;
  String? jenisKendaraan;
  String? platNomer;
  String? noStnk;
  String? tglStnk;
  String? noKir;
  String? tglKir;
  String? tglPajakTh;
  int? notif;

  Kendaraan({
    this.id,
    this.namaKendaraan,
    this.merkKendaraan,
    this.jenisKendaraan,
    this.platNomer,
    this.noStnk,
    this.tglStnk,
    this.noKir,
    this.tglKir,
    this.tglPajakTh,
    this.notif,
  });

  factory Kendaraan.fromJson(Map<String, dynamic> json) {
    return Kendaraan(
      id: json['id'],
      namaKendaraan: json['nama_kendaraan'],
      merkKendaraan: json['merk_kendaraan'],
      jenisKendaraan: json['jenis_kendaraan'],
      platNomer: json['plat_nomer'],
      noStnk: json['no_stnk'],
      tglStnk: json['tgl_stnk'],
      noKir: json['no_kir'],
      tglKir: json['tgl_kir'],
      tglPajakTh: json['tgl_pajak_th'],
      notif: json['notif'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "nama_kendaraan": namaKendaraan,
      "merk_kendaraan": merkKendaraan,
      "jenis_kendaraan": jenisKendaraan,
      "plat_nomer": platNomer,
      "no_stnk": noStnk,
      "tgl_stnk": tglStnk,
      "no_kir": noKir,
      "tgl_kir": tglKir,
      "tgl_pajak_th": tglPajakTh,
      "notif": notif,
    };
  }
}
