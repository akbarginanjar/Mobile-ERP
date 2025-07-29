import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_erp/components/button.dart';
import 'package:mobile_erp/components/form_error.dart';
import 'package:mobile_erp/controllers/login_controller.dart';
import 'package:mobile_erp/helpers/constants.dart';
import 'package:mobile_erp/helpers/keyboard.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class SignForm extends StatelessWidget {
  const SignForm({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      init: LoginController(),
      builder: (s) => Form(
        key: s.formKeyLogin,
        child: Column(
          children: [
            TextFormField(
              controller: s.mail,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: "Email",
                hintText: 'contoh@gmail.com',
                prefixIcon: Icon(Icons.mail_outline),
              ),
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: s.pass,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: "Password",
                hintText: 'Masukan password',
                prefixIcon: Icon(Icons.lock_outline),
              ),
            ),
            SizedBox(height: 10),
            // Row(
            //   children: [
            //     const Spacer(),
            //     GestureDetector(
            //       onTap: () => Get.toNamed(RouteName.lupaPassword),
            //       child: Text(
            //         "Lupa kata sandi ?",
            //         style: TextStyle(
            //           fontSize: getProportionateScreenWidth(16),
            //           color: kPrimaryColor,
            //         ),
            //       ),
            //     )
            //   ],
            // ),
            FormError(errors: s.errors),
            SizedBox(height: 20),
            SizedBox(
              child: DefaultButton(
                text: "Login",
                press: () {
                  if (s.mail.text == '' || s.pass.text == '') {
                    EasyLoading.showToast(
                      'Email atau Password tidak boleh ksosong!',
                    );
                  } else {
                    KeyboardUtil.hideKeyboard(context);
                    s.nextLogin();
                  }
                },
                color: kPrimaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
