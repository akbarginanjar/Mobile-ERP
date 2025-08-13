class AjuanBarangModel {
  int? id;
  String? no;
  int? idGudang;
  int? status;
  String? tanggalWaktu;
  String? keterangan;
  List<RincianBarang>? rincianBarang;
  Sales? sales;
  StatusData? statusData;

  AjuanBarangModel({
    this.id,
    this.no,
    this.idGudang,
    this.status,
    this.tanggalWaktu,
    this.keterangan,
    this.rincianBarang,
    this.sales,
    this.statusData,
  });

  factory AjuanBarangModel.fromJson(Map<String, dynamic> json) {
    return AjuanBarangModel(
      id: json['id'],
      no: json['no'],
      idGudang: json['id_gudang'],
      status: json['status'],
      tanggalWaktu: json['tanggal_waktu'],
      keterangan: json['keterangan'],
      rincianBarang: json['rincian_barang'] != null
          ? List<RincianBarang>.from(
              json['rincian_barang'].map((x) => RincianBarang.fromJson(x)),
            )
          : null,
      sales: json['sales'] != null ? Sales.fromJson(json['sales']) : null,
      statusData: json['status_data'] != null
          ? StatusData.fromJson(json['status_data'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'no': no,
      'id_gudang': idGudang,
      'status': status,
      'tanggal_waktu': tanggalWaktu,
      'keterangan': keterangan,
      'rincian_barang': rincianBarang?.map((x) => x.toJson()).toList(),
      'sales': sales?.toJson(),
      'status_data': statusData?.toJson(),
    };
  }
}

class RincianBarang {
  int? id;
  int? qtyRequest;
  int? apprSpv;
  String? keterangan;
  dynamic barang;
  List<Tujuan>? tujuan;

  RincianBarang({
    this.id,
    this.qtyRequest,
    this.apprSpv,
    this.keterangan,
    this.barang,
    this.tujuan,
  });

  factory RincianBarang.fromJson(Map<String, dynamic> json) {
    return RincianBarang(
      id: json['id'],
      qtyRequest: json['qty_request'],
      apprSpv: json['appr_spv'],
      keterangan: json['keterangan'],
      barang: json['barang'],
      tujuan: json['tujuan'] != null
          ? List<Tujuan>.from(json['tujuan'].map((x) => Tujuan.fromJson(x)))
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'qty_request': qtyRequest,
      'appr_spv': apprSpv,
      'keterangan': keterangan,
      'barang': barang,
      'tujuan': tujuan?.map((x) => x.toJson()).toList(),
    };
  }
}

class Tujuan {
  int? id;
  int? rincianRequestId;
  int? gudangId;
  int? apprGudang;
  int? apprSales;
  int? qtyReal;
  int? qtyRequest;
  String? keterangan;

  Tujuan({
    this.id,
    this.rincianRequestId,
    this.gudangId,
    this.apprGudang,
    this.apprSales,
    this.qtyReal,
    this.qtyRequest,
    this.keterangan,
  });

  factory Tujuan.fromJson(Map<String, dynamic> json) {
    return Tujuan(
      id: json['id'],
      rincianRequestId: json['rincian_request_id'],
      gudangId: json['gudang_id'],
      apprGudang: json['appr_gudang'],
      apprSales: json['appr_sales'],
      qtyReal: json['qty_real'],
      qtyRequest: json['qty_request'],
      keterangan: json['keterangan'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'rincian_request_id': rincianRequestId,
      'gudang_id': gudangId,
      'appr_gudang': apprGudang,
      'appr_sales': apprSales,
      'qty_real': qtyReal,
      'qty_request': qtyRequest,
      'keterangan': keterangan,
    };
  }
}

class Sales {
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
  dynamic fileFoto;
  String? tempatLahir;
  String? tanggalLahir;
  String? nik;
  String? nip;
  String? namaLengkap;
  String? noHp;
  String? email;
  String? alamat;
  dynamic urlFoto;
  String? jkDef;
  String? agamaDef;
  Jabatan? jabatan;

  Sales({
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

  factory Sales.fromJson(Map<String, dynamic> json) {
    return Sales(
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
      'id': id,
      'jk': jk,
      'agama': agama,
      'status_perkawinan': statusPerkawinan,
      'status_karyawan': statusKaryawan,
      'status_sp': statusSp,
      'kampus_sekolah': kampusSekolah,
      'pendidikan_terakhir': pendidikanTerakhir,
      'kualifikasi_pendidikan': kualifikasiPendidikan,
      'masa_kerja': masaKerja,
      'grade_karyawan': gradeKaryawan,
      'file_foto': fileFoto,
      'tempat_lahir': tempatLahir,
      'tanggal_lahir': tanggalLahir,
      'nik': nik,
      'nip': nip,
      'nama_lengkap': namaLengkap,
      'no_hp': noHp,
      'email': email,
      'alamat': alamat,
      'url_foto': urlFoto,
      'jk_def': jkDef,
      'agama_def': agamaDef,
      'jabatan': jabatan?.toJson(),
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
    return {'id': id, 'nama_jabatan': namaJabatan};
  }
}

class StatusData {
  int? id;
  dynamic warna;
  int? dataStatus;
  String? namaStatus;

  StatusData({this.id, this.warna, this.dataStatus, this.namaStatus});

  factory StatusData.fromJson(Map<String, dynamic> json) {
    return StatusData(
      id: json['id'],
      warna: json['warna'],
      dataStatus: json['data_status'],
      namaStatus: json['nama_status'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'warna': warna,
      'data_status': dataStatus,
      'nama_status': namaStatus,
    };
  }
}
