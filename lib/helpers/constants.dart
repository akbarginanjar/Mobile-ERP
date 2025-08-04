import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

const kPrimaryColor = Colors.orange;
const kSecondaryColor = Color(0xFF979797);
const kTextColor = Color(0xFF757575);

final headingStyle = TextStyle(
  fontSize: 28,
  fontWeight: FontWeight.bold,
  color: Colors.black,
  height: 1.5,
);

final headingStyleLight = TextStyle(
  fontSize: 28,
  fontWeight: FontWeight.bold,
  color: Colors.white,
  height: 1.5,
);

// Form Error
final RegExp emailValidatorRegExp = RegExp(
  r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
);
const String kEmailNullError = "Masukkan email Anda";
const String kInvalidEmailError = "Silakan Masukkan Email yang Valid";
const String kPassNullError = "Silakan Masukkan kata sandi Anda";
const String kShortPassError = "Kata sandi terlalu pendek";
const String kMatchPassError = "Kata sandi tidak cocok";
const String kNamelNullError = "Please Enter your name";
const String kPhoneNumberNullError = "Please Enter your phone number";
const String kAddressNullError = "Please Enter your address";
// ignore: constant_identifier_names
const String PinError = "Pin Salah !!";

final otpInputDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 15),
  border: outlineInputBorder(),
  focusedBorder: outlineInputBorder(),
  enabledBorder: outlineInputBorder(),
);

OutlineInputBorder outlineInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(15),
    borderSide: const BorderSide(color: Colors.white),
  );
}

String formatRupiah(int value) {
  return 'Rp ${NumberFormat.decimalPattern('id').format(value)}';
}

String formatTanggal(String tanggalString) {
  try {
    final DateTime parsedDate = DateTime.parse(tanggalString);
    return DateFormat('dd-MM-yyyy').format(parsedDate);
  } catch (e) {
    return '-'; // fallback jika parsing gagal
  }
}

String convertToIdr(number) {
  final formatter = NumberFormat.currency(
    locale: 'id_ID',
    symbol: 'Rp ',
    decimalDigits: 0,
  );
  return formatter.format(number);
}

String convertToIdrSymbolNo(num number) {
  final formatter = NumberFormat.decimalPattern('id_ID');
  return formatter.format(number); // Output: 1.500.000
}

String convertToDefault(String uang) {
  return uang.replaceAll(RegExp(r'[^0-9]'), '');
}

class CurrencyFormat extends TextInputFormatter {
  final NumberFormat _formatter = NumberFormat.decimalPattern('id_ID');

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    String newText = newValue.text;

    // Hapus semua karakter non-digit
    String numericString = newText.replaceAll(RegExp(r'[^0-9]'), '');

    if (numericString.isEmpty) {
      return newValue.copyWith(
        text: '',
        selection: TextSelection.collapsed(offset: 0),
      );
    }

    // Format kembali ke format 1.000.000 dst.
    String formatted = _formatter.format(int.parse(numericString));

    return TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(offset: formatted.length),
    );
  }
}

// const kDefaultPaddin = 20.0;
// const kTextLightColor = Color(0xFFACACAC);
// const defaultDuration = Duration(milliseconds: 250);
// const kAnimationDuration = Duration(milliseconds: 200);
// const kPrimaryLightColor = Color(0xFFFFECDF);
// const kPrimaryGradientColor = LinearGradient(
//   begin: Alignment.topLeft,
//   end: Alignment.bottomRight,
//   colors: [Color(0xFFFFA53E), Color(0xFFFF7643)],
// );

  // MoneyFormatter fmf = MoneyFormatter(
  //     amount: double.parse(uang.toString()),
  //     settings: MoneyFormatterSettings(
  //         symbol: 'Rp',
  //         thousandSeparator: '.',
  //         decimalSeparator: ',',
  //         symbolAndNumberSeparator: ' ',
  //         fractionDigits: 0,
  //         compactFormatType: CompactFormatType.short));