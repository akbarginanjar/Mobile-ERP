import 'package:flutter/material.dart';
import 'package:mobile_erp/components/button.dart';
import 'package:mobile_erp/helpers/constants.dart';

class AnalisisCard extends StatelessWidget {
  final Map<String, dynamic> data;
  final VoidCallback onDetailPressed;

  const AnalisisCard({
    super.key,
    required this.data,
    required this.onDetailPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.grey[300]!, width: 1.3),
        borderRadius: BorderRadius.circular(15),
      ),
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.date_range, color: kPrimaryColor),
                SizedBox(width: 5),
                Text(
                  "Tanggal : ${data['tanggal'] ?? '-'}",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Sales"),
                Text(data['karyawan']?['nama_lengkap'] ?? '-'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text("Tipe"), Text(data['tipe']['nama'] ?? '-')],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text("Konsumen"), Text(data['nama_costumer'] ?? '-')],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text("Kecamatan"), Text(data['kecamatan'] ?? '-')],
            ),
            SizedBox(height: 7),
            SizedBox(
              width: double.infinity,
              child: Card(
                elevation: 0,
                margin: EdgeInsets.all(0),
                color: Colors.grey[200],
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 8,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [Text("Alamat :"), Text(data['alamat'] ?? '-')],
                  ),
                ),
              ),
            ),
            SizedBox(height: 7),
            DefaultButtonSecond(text: 'Lihat Detail', press: onDetailPressed),
          ],
        ),
      ),
    );
  }
}
