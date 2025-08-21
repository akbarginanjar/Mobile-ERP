import 'package:flutter/material.dart' hide Badge;
import 'package:get/get.dart';
import 'package:mobile_erp/controllers/ajuan_barang_controller.dart';
import 'package:mobile_erp/helpers/constants.dart';
import 'package:mobile_erp/models/ajuan_barang_model.dart';
import 'package:mobile_erp/views/ajuan_barang/rincian_ajuan_barang_screen.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class CardAjuanBarang extends StatelessWidget {
  final AjuanBarangModel item;
  const CardAjuanBarang({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final AjuanBarangController controller = Get.find();
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey, // warna border
            width: 0.5, // ketebalan
          ),
        ),
      ),
      child: ListTile(
        contentPadding: EdgeInsets.only(bottom: 4, left: 15, right: 15),
        onTap: () async {
          final result = await Get.to(
            RincianAjuanBarangScreen(ajuanBarang: item),
          );
          if (result == true) {
            controller.onRefresh();
          }
        },
        leading: CircleAvatar(child: Icon(PhosphorIcons.boxArrowUp())),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('ID AJUAN BARANG', style: TextStyle(fontSize: 10)),
            Text(item.no ?? "-"),
            Text(
              'Tanggal Ajuan : ${formatTanggal(item.tanggalWaktu.toString())}',
              style: const TextStyle(fontSize: 12),
            ),
            const SizedBox(height: 5),
          ],
        ),
        subtitle: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            BadgeComponent(
              borderRadius: 8,
              text: item.statusData!.namaStatus.toString(),
              backgroundColor: () {
                final status = item.statusData!.namaStatus
                    .toString()
                    .toUpperCase();
                if (status == "DITERIMA") {
                  return Colors.green[800]!;
                } else if (status == "PENDING" || status == "DITOLAK") {
                  return Colors.red[800]!;
                } else if (status == "DISETUJUI SPV") {
                  return Colors.lightBlue;
                } else if (status == "DISETUJUI GUDANG") {
                  return Colors.purple[800]!;
                }
                return Colors.grey; // default
              }(),
              textColor: Colors.white,
            ),
          ],
        ),
        trailing: const Icon(
          Icons.arrow_forward_ios_rounded,
          size: 18,
          color: Colors.grey,
        ),
      ),
    );
  }
}
