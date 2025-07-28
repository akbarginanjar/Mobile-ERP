import 'package:flutter/material.dart';
import 'package:mobile_erp/helpers/constants.dart';

class BootomSheet {
  static requestBootomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      // shape: const RoundedRectangleBorder(
      //     borderRadius: BorderRadius.vertical(
      //   top: Radius.circular(30),
      // )),
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.95,
        maxChildSize: 1,
        minChildSize: 0.32,
        expand: false,
        builder: (context, scrollController) {
          return const SheetAjuanBarang();
          // return SingleChildScrollView(
          //     controller: scrollController, child: Container());
        },
      ),
    );
  }
}

class SheetAjuanBarang extends StatelessWidget {
  const SheetAjuanBarang({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          backgroundColor: kPrimaryColor,
        ),
        body: Container(),
      ),
    );
  }
}

class Coba extends StatelessWidget {
  const Coba({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
