class PenyimpananBarangModel {
  final int id;
  final int paletId;
  final int stok;
  final StokInfo info;
  final String konversiKet;
  final Gudang gudang;
  final Blok? blok;
  final Palet palet;
  final dynamic
  rak; // Bisa disesuaikan dengan tipe yang sesuai jika ada datanya
  final dynamic
  laci; // Bisa disesuaikan dengan tipe yang sesuai jika ada datanya
  final Barang barang;

  PenyimpananBarangModel({
    required this.id,
    required this.paletId,
    required this.stok,
    required this.info,
    required this.konversiKet,
    required this.gudang,
    this.blok,
    required this.palet,
    this.rak,
    this.laci,
    required this.barang,
  });

  factory PenyimpananBarangModel.fromJson(Map<String, dynamic> json) {
    return PenyimpananBarangModel(
      id: json['id'] as int,
      paletId: json['palet_id'] as int,
      stok: json['stok'] as int,
      info: StokInfo.fromJson(json['info']),
      konversiKet: json['konversi_ket'] as String,
      gudang: Gudang.fromJson(json['gudang']),
      blok: json['blok'] != null ? Blok.fromJson(json['blok']) : null,
      palet: Palet.fromJson(json['palet']),
      rak: json['rak'],
      laci: json['laci'],
      barang: Barang.fromJson(json['barang']),
    );
  }
}

class StokInfo {
  final int penyimpanan;
  final int stokKeMobil;
  final int dariSales;

  StokInfo({
    required this.penyimpanan,
    required this.stokKeMobil,
    required this.dariSales,
  });

  factory StokInfo.fromJson(Map<String, dynamic> json) {
    return StokInfo(
      penyimpanan: json['penyimpanan'] as int,
      stokKeMobil: json['stok ke mobil'] as int,
      dariSales: json['dari sales'] as int,
    );
  }
}

class Gudang {
  final int id;
  final int jenis;
  final String namaGudang;
  final String alamat;
  final String keterangan;
  final Teritori teritori;
  final Karyawan karyawan;
  final dynamic driver;
  final dynamic kendaraan;

  Gudang({
    required this.id,
    required this.jenis,
    required this.namaGudang,
    required this.alamat,
    required this.keterangan,
    required this.teritori,
    required this.karyawan,
    this.driver,
    this.kendaraan,
  });

  factory Gudang.fromJson(Map<String, dynamic> json) {
    return Gudang(
      id: json['id'] as int,
      jenis: json['jenis'] as int,
      namaGudang: json['nama_gudang'] as String,
      alamat: json['alamat'] as String,
      keterangan: json['keterangan'] as String,
      teritori: Teritori.fromJson(json['teritori']),
      karyawan: Karyawan.fromJson(json['karyawan']),
      driver: json['driver'],
      kendaraan: json['kendaraan'],
    );
  }
}

class Teritori {
  final int id;
  final String namaTeritori;
  final String keterangan;
  final List<dynamic> anggota;

  Teritori({
    required this.id,
    required this.namaTeritori,
    required this.keterangan,
    required this.anggota,
  });

  factory Teritori.fromJson(Map<String, dynamic> json) {
    return Teritori(
      id: json['id'] as int,
      namaTeritori: json['nama_teritori'] as String,
      keterangan: json['keterangan'] as String,
      anggota: json['anggota'] as List<dynamic>,
    );
  }
}

class Karyawan {
  final int id;
  final int jk;
  final int agama;
  final int statusPerkawinan;
  final dynamic statusKaryawan;
  final int statusSp;
  final String kampusSekolah;
  final String pendidikanTerakhir;
  final String kualifikasiPendidikan;
  final String masaKerja;
  final String gradeKaryawan;
  final dynamic fileFoto;
  final String tempatLahir;
  final String tanggalLahir;
  final String nik;
  final String nip;
  final String namaLengkap;
  final String noHp;
  final String email;
  final String alamat;
  final dynamic urlFoto;
  final String jkDef;
  final String agamaDef;
  final Jabatan jabatan;

  Karyawan({
    required this.id,
    required this.jk,
    required this.agama,
    required this.statusPerkawinan,
    this.statusKaryawan,
    required this.statusSp,
    required this.kampusSekolah,
    required this.pendidikanTerakhir,
    required this.kualifikasiPendidikan,
    required this.masaKerja,
    required this.gradeKaryawan,
    this.fileFoto,
    required this.tempatLahir,
    required this.tanggalLahir,
    required this.nik,
    required this.nip,
    required this.namaLengkap,
    required this.noHp,
    required this.email,
    required this.alamat,
    this.urlFoto,
    required this.jkDef,
    required this.agamaDef,
    required this.jabatan,
  });

  factory Karyawan.fromJson(Map<String, dynamic> json) {
    return Karyawan(
      id: json['id'] as int,
      jk: json['jk'] as int,
      agama: json['agama'] as int,
      statusPerkawinan: json['status_perkawinan'] as int,
      statusKaryawan: json['status_karyawan'],
      statusSp: json['status_sp'] as int,
      kampusSekolah: json['kampus_sekolah'] as String,
      pendidikanTerakhir: json['pendidikan_terakhir'] as String,
      kualifikasiPendidikan: json['kualifikasi_pendidikan'] as String,
      masaKerja: json['masa_kerja'] as String,
      gradeKaryawan: json['grade_karyawan'] as String,
      fileFoto: json['file_foto'],
      tempatLahir: json['tempat_lahir'] as String,
      tanggalLahir: json['tanggal_lahir'] as String,
      nik: json['nik'] as String,
      nip: json['nip'] as String,
      namaLengkap: json['nama_lengkap'] as String,
      noHp: json['no_hp'] as String,
      email: json['email'] as String,
      alamat: json['alamat'] as String,
      urlFoto: json['url_foto'],
      jkDef: json['jk_def'] as String,
      agamaDef: json['agama_def'] as String,
      jabatan: Jabatan.fromJson(json['jabatan']),
    );
  }
}

class Jabatan {
  final int id;
  final String namaJabatan;

  Jabatan({required this.id, required this.namaJabatan});

  factory Jabatan.fromJson(Map<String, dynamic> json) {
    return Jabatan(
      id: json['id'] as int,
      namaJabatan: json['nama_jabatan'] as String,
    );
  }
}

class Blok {
  final int id;
  final String blok;
  final Gudang gudang;

  Blok({required this.id, required this.blok, required this.gudang});

  factory Blok.fromJson(Map<String, dynamic> json) {
    return Blok(
      id: json['id'] as int,
      blok: json['blok'] as String,
      gudang: Gudang.fromJson(json['gudang']),
    );
  }
}

class Palet {
  final int id;
  final String palet;
  final Gudang gudang;
  final Blok blok;

  Palet({
    required this.id,
    required this.palet,
    required this.gudang,
    required this.blok,
  });

  factory Palet.fromJson(Map<String, dynamic> json) {
    return Palet(
      id: json['id'] as int,
      palet: json['palet'] as String,
      gudang: Gudang.fromJson(json['gudang']),
      blok: Blok.fromJson(json['blok']),
    );
  }
}

class Barang {
  final int id;
  final String kode;
  final String nama;
  final String varian;
  final int jenis;
  final int hargaDasar;
  final Satuan satuan;
  final Kategori kategori;
  final List<HargaJual> hargaJual;
  final List<Konversi> konversi;

  Barang({
    required this.id,
    required this.kode,
    required this.nama,
    required this.varian,
    required this.jenis,
    required this.hargaDasar,
    required this.satuan,
    required this.kategori,
    required this.hargaJual,
    required this.konversi,
  });

  factory Barang.fromJson(Map<String, dynamic> json) {
    return Barang(
      id: json['id'] as int,
      kode: json['kode'] as String,
      nama: json['nama'] as String,
      varian: json['varian'] as String,
      jenis: json['jenis'] as int,
      hargaDasar: json['harga_dasar'] as int,
      satuan: Satuan.fromJson(json['satuan']),
      kategori: Kategori.fromJson(json['kategori']),
      hargaJual: (json['harga_jual'] as List)
          .map((e) => HargaJual.fromJson(e))
          .toList(),
      konversi: (json['konversi'] as List)
          .map((e) => Konversi.fromJson(e))
          .toList(),
    );
  }
}

class Satuan {
  final int id;
  final String satuan;

  Satuan({required this.id, required this.satuan});

  factory Satuan.fromJson(Map<String, dynamic> json) {
    return Satuan(id: json['id'] as int, satuan: json['satuan'] as String);
  }
}

class Kategori {
  final int id;
  final String kategori;

  Kategori({required this.id, required this.kategori});

  factory Kategori.fromJson(Map<String, dynamic> json) {
    return Kategori(
      id: json['id'] as int,
      kategori: json['kategori'] as String,
    );
  }
}

class HargaJual {
  final int id;
  final int tipeKonsumenId;
  final int barangId;
  final int harga;
  final String createdAt;
  final String updatedAt;
  final TipeKonsumen tipe;

  HargaJual({
    required this.id,
    required this.tipeKonsumenId,
    required this.barangId,
    required this.harga,
    required this.createdAt,
    required this.updatedAt,
    required this.tipe,
  });

  factory HargaJual.fromJson(Map<String, dynamic> json) {
    return HargaJual(
      id: json['id'] as int,
      tipeKonsumenId: json['tipe_konsumen_id'] as int,
      barangId: json['barang_id'] as int,
      harga: json['harga'] as int,
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String,
      tipe: TipeKonsumen.fromJson(json['tipe']),
    );
  }
}

class TipeKonsumen {
  final int id;
  final String nama;

  TipeKonsumen({required this.id, required this.nama});

  factory TipeKonsumen.fromJson(Map<String, dynamic> json) {
    return TipeKonsumen(id: json['id'] as int, nama: json['nama'] as String);
  }
}

class Konversi {
  final int id;
  final int idBarang;
  final int idSatuan;
  final int no;
  final int nilai;
  final String createdAt;
  final String updatedAt;
  final Satuan satuan;

  Konversi({
    required this.id,
    required this.idBarang,
    required this.idSatuan,
    required this.no,
    required this.nilai,
    required this.createdAt,
    required this.updatedAt,
    required this.satuan,
  });

  factory Konversi.fromJson(Map<String, dynamic> json) {
    return Konversi(
      id: json['id'] as int,
      idBarang: json['id_barang'] as int,
      idSatuan: json['id_satuan'] as int,
      no: json['no'] as int,
      nilai: json['nilai'] as int,
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String,
      satuan: Satuan.fromJson(json['satuan']),
    );
  }
}
