import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:mobile_erp/helpers/base.dart';
import 'package:mobile_erp/helpers/constants.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class MenuHome extends StatelessWidget {
  const MenuHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 17),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Card(
                    elevation: 0,
                    margin: EdgeInsets.symmetric(horizontal: 7, vertical: 0),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.grey[300]!),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: InkWell(
                      onTap: () {
                        Get.toNamed(RouteName.analisis);
                      },
                      borderRadius: BorderRadius.circular(20),
                      child: Padding(
                        padding: const EdgeInsets.all(25),
                        child: Icon(
                          PhosphorIcons.chartBar(),
                          color: kPrimaryColor,
                          size: 35,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 6),
                  Text("Analisis", style: TextStyle(fontSize: 14)),
                  Text("Market", style: TextStyle(fontSize: 14)),
                ],
              ),
              Column(
                children: [
                  Card(
                    elevation: 0,
                    margin: EdgeInsets.symmetric(horizontal: 7, vertical: 0),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.grey[300]!),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: InkWell(
                      onTap: () {},
                      borderRadius: BorderRadius.circular(20),
                      child: Padding(
                        padding: const EdgeInsets.all(25),
                        child: Icon(
                          PhosphorIcons.clipboard(),
                          color: kPrimaryColor,
                          size: 35,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 6),
                  Text("Ajuan", style: TextStyle(fontSize: 14)),
                  Text("Barang", style: TextStyle(fontSize: 14)),
                ],
              ),
              Column(
                children: [
                  Card(
                    elevation: 0,
                    margin: EdgeInsets.symmetric(horizontal: 7, vertical: 0),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.grey[300]!),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: InkWell(
                      onTap: () {},
                      borderRadius: BorderRadius.circular(20),
                      child: Padding(
                        padding: const EdgeInsets.all(25),
                        child: Icon(
                          PhosphorIcons.userPlus(),
                          color: kPrimaryColor,
                          size: 35,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 6),
                  Text("Ajuan", style: TextStyle(fontSize: 14)),
                  Text("Konsumen", style: TextStyle(fontSize: 14)),
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 17),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Card(
                    elevation: 0,
                    margin: EdgeInsets.symmetric(horizontal: 7, vertical: 0),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.grey[300]!),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: InkWell(
                      onTap: () {},
                      borderRadius: BorderRadius.circular(20),
                      child: Padding(
                        padding: const EdgeInsets.all(25),
                        child: Icon(
                          PhosphorIcons.truck(),
                          color: kPrimaryColor,
                          size: 35,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 6),
                  Text("Stok Barang", style: TextStyle(fontSize: 14)),
                  Text("(Mobil)", style: TextStyle(fontSize: 14)),
                ],
              ),
              Column(
                children: [
                  Card(
                    elevation: 0,
                    margin: EdgeInsets.symmetric(horizontal: 7, vertical: 0),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.grey[300]!),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: InkWell(
                      onTap: () {},
                      borderRadius: BorderRadius.circular(20),
                      child: Padding(
                        padding: const EdgeInsets.all(25),
                        child: Icon(
                          PhosphorIcons.note(),
                          color: kPrimaryColor,
                          size: 35,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 6),
                  Text("Ajuan", style: TextStyle(fontSize: 14)),
                  Text("BOP Sales", style: TextStyle(fontSize: 14)),
                ],
              ),
              Column(
                children: [
                  Card(
                    elevation: 0,
                    margin: EdgeInsets.symmetric(horizontal: 7, vertical: 0),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.grey[300]!),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: InkWell(
                      onTap: () {},
                      borderRadius: BorderRadius.circular(20),
                      child: Padding(
                        padding: const EdgeInsets.all(25),
                        child: Icon(
                          PhosphorIcons.shoppingCart(),
                          color: kPrimaryColor,
                          size: 35,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 6),
                  Text("Penjualan", style: TextStyle(fontSize: 14)),
                  Text("", style: TextStyle(fontSize: 14)),
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 17),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Card(
                    elevation: 0,
                    margin: EdgeInsets.symmetric(horizontal: 7, vertical: 0),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.grey[300]!),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: InkWell(
                      onTap: () {},
                      borderRadius: BorderRadius.circular(20),
                      child: Padding(
                        padding: const EdgeInsets.all(25),
                        child: Icon(
                          PhosphorIcons.currencyDollar(),
                          color: kPrimaryColor,
                          size: 35,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 6),
                  Text("Collection", style: TextStyle(fontSize: 14)),
                  Text("", style: TextStyle(fontSize: 14)),
                ],
              ),
              Column(
                children: [
                  Card(
                    elevation: 0,
                    margin: EdgeInsets.symmetric(horizontal: 7, vertical: 0),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.grey[300]!),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: InkWell(
                      onTap: () {},
                      borderRadius: BorderRadius.circular(20),
                      child: Padding(
                        padding: const EdgeInsets.all(25),
                        child: Icon(
                          PhosphorIcons.users(),
                          color: kPrimaryColor,
                          size: 35,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 6),
                  Text("Retur", style: TextStyle(fontSize: 14)),
                  Text("Konsumen", style: TextStyle(fontSize: 14)),
                ],
              ),
              Column(
                children: [
                  Card(
                    elevation: 0,
                    margin: EdgeInsets.symmetric(horizontal: 7, vertical: 0),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.grey[300]!),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: InkWell(
                      onTap: () {},
                      borderRadius: BorderRadius.circular(20),
                      child: Padding(
                        padding: const EdgeInsets.all(25),
                        child: Icon(
                          PhosphorIcons.creditCard(),
                          color: kPrimaryColor,
                          size: 35,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 6),
                  Text("Setoran", style: TextStyle(fontSize: 14)),
                  Text("", style: TextStyle(fontSize: 14)),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
