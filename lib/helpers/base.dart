abstract class Base {
  static const String secretKey =
      'aKndsan23928h98hKJbkjwlKHD9dsbjwiobqUJGHBDWHvkHSJQUBSQOPSAJHVwoihdapq';
  //Start link URL & Version
  static const String dev = "https://api-dev.expreship.id/";
  static const String prod = "https://api.bimeastindonesia.com/";
  static const String url = dev;
  static const String version = "v1";
  //End link URL & Version

  //Start Auth
  //Start Login / Lupa Password & Logout
  static const String login = "$version/auth/user-login";
  static const String logout = "$version/auth/logout";
  //End Login / Lupa Password & Logout

  //Start Refresh & Get Token
  static const String refresh = "$version/auth/refresh";
  static const String getToken = "$version/auth/token";
  //End Refresh & Get Token
  //Emd Auth

  //Start Jabatan
  static const String jabatanGet = "$version/jabatan";
  static const String jabatanPost = "$version/input/jabatan";
  //End Jabatan

  //Start Notif
  static const String notificationGet = "$version/notifikasi";
  //End Notif

  //Start Karyawan
  static const String karyawanGet = "$version/karyawan";
  static const String karyawanPost = "$version/input/karyawan";
  //End Karyawan

  //Start Level
  static const String levelGet = "$version/level";
  static const String levelPost = "$version/input/level";
  //End Level

  //Start Pengguna
  static const String userGet = "$version/user";
  static const String userPost = "$version/input/user";
  static const String gantiPin = "$version/user/ganti-pin/";
  //End Pengguna

  //Start Menu
  static const String menuGet = "$version/menu";
  static const String menuPost = "$version/input/menu";
  //End Menu

  //Start Role
  static const String roleGet = "$version/role";
  static const String rolePost = "$version/input/role";
  //End Role

  //Start Setoran
  static const String setoranIndex = "$version/transaksi-setor-list";
  static const String setoranPost = "$version/transaksi-setor";
  //End Setoran

  //Start Status Role
  static const String statusRoleGet = "$version/status-role";
  static const String statusRolePost = "$version/input/status-role";
  //End Status Role

  //Start Kendaraan
  //Kendaraan
  static const String kendaraanGet = "$version/kendaraan";
  static const String kendaraanPost = "$version/input/kendaraan";
  //Bagian
  static const String bagianKendaraanGet = "$version/kendaraan-bagian";
  static const String bagianKendaraanPost = "$version/input/kendaraan-bagian";
  //Ceklist
  static const String ceklistKendaraanGet = "$version/kendaraan-ceklist";
  static const String ceklistKendaraanPost = "$version/input/kendaraan-ceklist";
  //Perbaikan
  static const String perbaikanGet = "$version/user";
  static const String perbaikanPost = "$version/input/user";
  //End Kendaraan

  //Start Gudang
  //Gudang
  static const String gudangGet = "$version/gudang";
  static const String gudangPost = "$version/input/gudang";
  //Stock Mobil
  static const String gudangStockMobilGet = "$version/stok-mobil";
  //Teritory
  static const String gudangTeritoryGet = "$version/teritori";
  static const String gudangTeritoryPost = "$version/input/teritori";
  //Block
  static const String gudangBlokGet = "$version/gudang-blok";
  static const String gudangBlokPost = "$version/input/gudang-blok";
  //Palet
  static const String gudangPaletGet = "$version/gudang-palet";
  static const String gudangPaletPost = "$version/input/gudang-palet";
  //Rak
  static const String gudangRakGet = "$version/gudang-rak";
  static const String gudangRakPost = "$version/input/gudang-rak";
  //Laci
  static const String gudangLaciGet = "$version/gudang-laci";
  static const String gudangLaciPost = "$version/input/gudang-laci";
  //Penyimpanan
  static const String gudangPenyimpananGet = "$version/gudang-penyimpanan";
  static const String gudangPenyimpananPost =
      "$version/input/gudang-penyimpanan";
  //Disposal Hilang
  static const String gudangDisposalHilangGet =
      "$version/gudang-disposal-hilang";
  static const String gudangDisposalHilangPost =
      "$version/input/gudang-disposal-hilang";
  //Disposal Rusak
  static const String gudangDisposalRusakGet = "$version/gudang-disposal-rusak";
  static const String gudangDisposalRusakPost =
      "$version/input/gudang-disposal-rusak";
  //Mutasi
  static const String gudangMutasiGet = "$version/gudang-mutasi";
  static const String gudangMutasiPost = "$version/input/gudang-mutasi";
  //Stock Opname
  static const String gudangStockOpnameGet = "$version/stok-opname";
  static const String gudangStockOpnamePost = "$version/input/stok-opname";
  //Stock Opname
  static const String gudangStockOpnameRinciGet =
      "$version/stok-opname-rincian";
  static const String gudangStockOpnameRinciPost =
      "$version/input/stok-opname-rincian";
  //End Gudang

  //Start Barang
  // barang
  static const String barangGet = "$version/barang";
  static const String barangPost = "$version/input/barang";
  // satuan
  static const String satuanBarangGet = "$version/satuan";
  static const String satuanBarangPost = "$version/input/satuan";
  // kategori
  static const String kategoriBarangGet = "$version/kategori";
  static const String kategoriBarangPost = "$version/input/kategori";
  // penerimaan
  static const String penerimaanBarangGet = "$version/penerimaan";
  static const String penerimaanBarangPost = "$version/input/penerimaan";
  // request
  static const String requestBarangGet = "$version/request-barang";
  static const String requestBarangDetail = "$version/request-barang/";
  static const String requestBarangPost = "$version/input/request-barang";
  static const String requestBarang2Post = "$version/input/request-barang-many";

  // request
  static const String requestBarangRinciGet = "$version/request-barang-rincian";
  static const String requestBarangRinciPost =
      "$version/input/request-barang-rincian";

  // Konversi
  static const String konversiSatuanBarangGet = "$version/konversi-barang";
  static const String konversiSatuanBarangPost = "$version/konversi";

  //tujuan
  static const String requestBarangTujuanGet = "$version/request-barang-tujuan";
  static const String requestBarangTujuanPost =
      "$version/input/request-barang-tujuan";
  //End Barang

  //Start Analisis
  //Analisis
  static const String analisisGet = "$version/analisis";
  static const String analisisPost = "$version/input/analisis";
  //Brand
  static const String analisisBrandGet = "$version/brand-analisis";
  static const String analisisBrandPost = "$version/input/brand-analisis";
  //End Analisis

  //Start Bop
  //Ajuan
  static const String ajuanBopGet = "$version/bop-ajuan";
  static const String ajuanBopPost = "$version/input/bop-ajuan";
  //Laporan
  static const String laporanBopGet = "$version/bop-laporan";
  static const String laporanBopPost = "$version/input/bop-laporan";
  //End Bop

  //Start konsumen
  static const String konsumenGet = "$version/konsumen";
  static const String konsumenPost = "$version/input/konsumen";
  //End konsumen

  //Start Type Konsumen
  static const String typeKonsumenGet = "$version/konsumen-type";
  static const String typeKonsumenPost = "$version/input/konsumen-type";
  //End Type Konsumen

  //Start Dashboard-Info
  static const dashboard = "/dashboard-info";
  //End Dashboard-Info

  //Start Transaksi
  //Penjualan
  static const String penjualanGet = "$version/penjualan";
  //Pembayaran
  static const String pembayaranGet = "$version/pembayaran";
  static const String pembayaranPost = "$version/pembayaran";
  static const String pembayaranInput = "$version/input/pembayaran";
  //Setor
  static const String transaksiSetorListGet = "$version/transaksi-setor-list";
  static const String transaksiSetorRinciListGet =
      "$version/transaksi-setor-rincian-list";
  static const String transaksiSetorPost = "$version/transaksi-setor";
  static const String transaksiSetorDeleteGet =
      "$version/transaksi-setor-delete";
  //transaksi
  static const String transaksiSelesaiPost = "$version/transaksi-selesai";
  static const String transaksiTerimaPost = "$version/transaksi-terima";
  static const String transaksiCencelPost = "$version/transaksi-cancel";
  static const String transaksiUpdatePost = "$version/transaksi-update";
  static const String transaksiBarangUpdatePost =
      "$version/transaksi-barang-update";
  //End Transaksi

  //Start Kas
  //Kas
  static const String kasGet = "$version/kas";
  static const String kasPost = "$version/input/kas";
  //Kas Alur
  static const String kasAlurGet = "$version/kas-alur";
  static const String kasAlurPost = "$version/input/kas-alur";
  //End Kas

  //Start Biaya Pengambilan
  // Biaya Pengembalian
  static const String biayaPengembalianGet = "$version/biaya-pengambilan";
  static const String biayaPengembalianPost =
      "$version/input/biaya-pengambilan";
  // Biaya Pengembalian Rinci
  static const String biayaPengembalianRinciGet = "$version/biaya-operasional";
  static const String biayaPengembalianRinciPost =
      "$version/input/biaya-operasional";
  //End Biaya Pengambilan

  // Biaya Approve
  static const String approveFinancePost = "$version/biaya-pengambilan-berikan";
  static const String approveGudangPost = "$version/biaya-pengambilan-terima";

  //Start Biaya Operasional
  // Biaya Operasional
  static const String biayaOperasionalGet = "$version/biaya-operasional";
  static const String biayaOperasionalPost = "$version/input/biaya-operasional";
  // Biaya Operasional Rincian
  static const String biayaOperasionalRinciGet =
      "$version/biaya-operasional-rincian";
  static const String biayaOperasionalRinciPost =
      "$version/input/biaya-operasional-rincian";
  //End Biaya Operasional

  //Start Harga Jual
  static const String hargaJualGet = "$version/harga-jual";
  static const String hargaJualPost = "$version/input/harga-jual";
  //End Harga Jual

  //Start Pengembalian Barang Sales
  //Pengembalian
  static const String pengembalianSalesGet = "$version/pengembalian-sales";
  static const String pengembalianSalesPost =
      "$version/input/pengembalian-sales";
  //Pengembalian Rincian
  static const String pengembalianSalesRinciGet =
      "$version/pengembalian-sales-rincian";
  static const String pengembalianSalesRinciPost =
      "$version/input/pengembalian-sales-rincian";
  //Pengembalian Approve
  static const String pengembalianApproveGet = "$version/pengembalian-approve";
  static const String pengembalianApprovePost =
      "$version/input/pengembalian-approve";
  //End Pengembalian Barang Sales

  //Start Retur Konsumen
  //Laporkan
  static const String returKonsumenLaporkan =
      "$version/retur-konsumen-laporkan";
  //Retur
  static const String returKonsumenGet = "$version/retur-konsumen";
  static const String returKonsumenPost = "$version/input/retur-konsumen";
  static const String returKonsumenCheckoutPost =
      "$version/retur-konsumen-checkout";
  //Rincian
  static const String returKonsumenRinciGet = "$version/retur-konsumen-rincian";
  static const String returKonsumenRinciPost =
      "$version/input/retur-konsumen-rincian";
  //End Retur Konsumen

  //Start Print Out
  static const String setoranPrint = "$version/export-setor";
  static const String notaPenjualanPrint = "$version/cetak-penjualan";
  static const String ajuanBopPrint = "$version/cetak-ajuan-bop";
  static const String pengembalianBopPrint = "$version/cetak-reimburse-bop";
  static const String reimburseBopPrint = "$version/cetak-reimburse-bop";
  static const String bopGudangPrint = "$version/cetak-bop-gudang";
  static const String pengembalianBarangPrint =
      "$version/cetak-pengambilan-barang";
  static const String perbaikanKendaraanPrint =
      "$version/cetak-perbaikan-kendaraan";
  static const String pengembalianSalesPrint =
      "$version/cetak-pengembalian-sales";
  static const String stockOpnamePrint = "$version/cetak-stok-opname";
  static const String disposalPrint = "$version/cetak-disposal";
  static const String suratJalanPrint = "$version/cetak-surat-jalan";
  static const String laporanBopPrint = "$version/cetak-laporan-bop";

  //End Print Out

  //Start data user
  static String token = "tokens";
  static String user = "users";
  static String access = "access";
  static String gudang = "gudang";

  static String namePrint = "name_print";
  static String typePrint = "type_print";
  static String addressPrint = "address_print";
  static String statusPrint = "status_print";
  //End data user
}

abstract class RouteName {
  //error page
  static const noPage = "/404";
  static const maintanancePage = "/maintanance";
  //auth page
  static const splash = "/splash_screen";
  static const login = "/login_screen";
  static const lupaPassword = "/forgot_screen";
  static const otpPassword = "/otp_screen";
  static const pin = "/pin_screen";
  //home page
  static const home = "/home_screen";
  //profile page
  static const profile = "/profile_screen";
  //barang page
  static const barang = "/barang";
  static const satuanBarang = "/satuan";
  static const kategoriBarang = "/kategori";
  static const requestBarang = "/ajuanbarang";
  static const detailAjuanBarang = "/ajuanbarang/detail";
  static const tambahAjuanBarang = "/ajuanbarang/tambah";
  static const penerimaanBarang = "/penerimaan-barang";
  //Stock Barang Mobil page
  static const stockBarangMobil = "/kendaraan-barang";
  //konsumen page
  static const konsumen = "/konsumen";
  static const ajuanKonsumen = "/ajuankonsumen";
  //analisis page
  static const analisis = "/analisis";
  static const tambahAnalisis = "/analisis/add";
  static const detailAnalisis = "/analisis/detail";
  //penjualan page
  static const penjualan = "/penjualan";
  //collection page
  static const collection = "/collection";
  static const bayarCollection = "/bayar_collection";

  //rincian barang request
  static const requestGudang = "/request-gudang";
  //Retur Konsumen
  static const returKonsumen = "/retur-konsumen";
  //Setoran
  static const setoran = "/setoran";
  static const belumSetoran = "/setoran/belum-setor";
  static const sudahSetoran = "/setoran/sudah-setor";
  //Ceklist Kendaraan
  static const ceklistKendaraan = "/ceklist";
  //Ceklist Kendaraan
  static const perbaikanKendaraan = "/kendaraan/form-perbaikan";
  //Stock Gudang
  static const stockGudang = "/stock-in";
  //Stock Gudang
  static const stockOpname = "/stock-opname";
  //Pengembalian Barang Sales
  static const pengembalianBarangSales = "/pengembalian";
  //Akun
  static const akun = "/akun";
  //Kategori Akun
  static const kategoriAkun = "/kategori-akun";
  //Pembelian
  static const pembelian = "/pembelian";
  //Biaya Entertain
  static const biayaEntertain = "/biaya-entertain";
  //Penggajian
  static const penggajian = "/penggajian";
  //Hutang Perusahaan
  static const hutangPerusahaan = "/hutang-perusahaan";
  //Biaya Pajak
  static const biayaPajak = "/biaya-pajak";
  //Arus Kas
  static const kas = "/laporan/arus-kas";
  //jurnal
  static const jurnal = "/laporan/jurnal";
  //Laba rugi
  static const labaRugi = "/laporan/laba-rugi";
  //BOP Gudang
  static const bopGudang = "/biaya-operasional";
  //Arus Laba rugi
  static const ekspedisi = "/pengambilan-barang";
  //Notifikasi
  static const notifikasi = "/notifikasi";

  //nota
  static const notaPenjualan = "/nota_penjualan";
  static const notaCollection = "/nota_collection";

  //profile page
  static const bop = "/bop";
}

abstract class OflineBase {
  //Analisis Market
  static const analisisList = "list_analisis";
  static const analisisKirim = "kirim_analisis";

  //Penjualan
  static const penjualanList = "list_penjualan";
  static const penjualanKirim = "kirim_penjualan";

  //Collection
  static const collectionList = "list_collection";
  static const collectionKirim = "kirim_collection";

  //karyawan
  static const karyawanList = "list_karyawan";
  static const karyawanKirim = "kirim_karyawan";

  //type Konsumen
  static const typeKonsumenList = "list_type_konsumen";
  static const typeKonsumenKirim = "kirim_type_konsumen";

  //Konversi
  static const konversiList = "list_konversi";
  static const konversiKirim = "kirim_konversi";

  //Konsumen
  static const konsumenList = "list_konsumen";
  static const konsumenKirim = "kirim_konsumen";

  //Gudang Mobil
  static const gudangMobilList = "list_gudang_mobil";
  static const gudangMobilKirim = "kirim_gudang_mobil";

  //Stock Mobil
  static const stockMobilList = "list_stock_mobil";
  static const stockMobilKirim = "kirim_stock_mobil";

  //Ajuan Bop
  static const ajuanBopList = "list_ajuan_bop";
  static const ajuanBopKirim = "kirim_ajuan_bop";
}
