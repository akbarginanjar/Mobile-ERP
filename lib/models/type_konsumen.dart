class TypeKonsumenModel {
  final int id;
  final String nama;

  TypeKonsumenModel({required this.id, required this.nama});

  factory TypeKonsumenModel.fromJson(Map<String, dynamic> json) {
    return TypeKonsumenModel(id: json['id'], nama: json['nama']);
  }
}

class TipeKonsumenResponse {
  final bool status;
  final int record;
  final int total;
  final List<TypeKonsumenModel> data;

  TipeKonsumenResponse({
    required this.status,
    required this.record,
    required this.total,
    required this.data,
  });

  factory TipeKonsumenResponse.fromJson(Map<String, dynamic> json) {
    return TipeKonsumenResponse(
      status: json['status'],
      record: json['record'],
      total: json['total'],
      data: (json['data'] as List)
          .map((item) => TypeKonsumenModel.fromJson(item))
          .toList(),
    );
  }
}
