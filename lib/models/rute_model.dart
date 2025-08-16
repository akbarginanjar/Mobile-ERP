class RuteModel {
  final int id;
  final String namaRute;
  final String createdAt;
  final String updatedAt;
  final String? deletedAt;

  RuteModel({
    this.id = 0,
    this.namaRute = '',
    this.createdAt = '',
    this.updatedAt = '',
    this.deletedAt,
  });

  factory RuteModel.fromJson(Map<String, dynamic> json) {
    return RuteModel(
      id: json['id'] ?? 0,
      namaRute: json['nama_rute'] ?? '',
      createdAt: json['created_at'] ?? '',
      updatedAt: json['updated_at'] ?? '',
      deletedAt: json['deleted_at'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nama_rute': namaRute,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'deleted_at': deletedAt,
    };
  }
}
