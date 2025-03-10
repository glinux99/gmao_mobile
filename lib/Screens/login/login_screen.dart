import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import '../../Resources/Components/button.dart';
import '../../Resources/Components/text_fields.dart';
import '../../Resources/Constants/global_variables.dart';
import '../../Resources/Providers/users_provider.dart';
import '../../main.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameCtrller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  padding: const EdgeInsets.all(0),
                  child: Image.asset(
                    'assets/images/ve.png',
                    height: 200,
                  )),
              const Text(
                "Authentification Ve Tasks",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                "Saisissez un numéro de téléphone ou une adresse mail pour recevoir un code de confirmation",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 12, color: Colors.grey[600]),
              ),
              const SizedBox(height: 32),
              TextFormFieldWidget(
                hintText: "Téléphone ou addresse mail",
                textColor: AppColors.kBlackColor,
                backColor: AppColors.kTextFormBackColor,
                editCtrller: _usernameCtrller,
                inputType: TextInputType.text,
              ),
              const SizedBox(height: 10),
              CustomButton(
                  canSync: true,
                  text: 'Connection',
                  backColor: AppColors.kPrimaryColor,
                  textColor: AppColors.kWhiteColor,
                  callback: () {
                    if (_usernameCtrller.text.isEmpty) {
                      ToastNotification.showToast(
                          msg: 'Veuillez saisir le champ requis');
                      return;
                    }
                    navKey.currentContext!.read<UserProvider>().login(
                        data: {
                          'username': _usernameCtrller.text.trim(),
                          'password': '123456'
                        },
                        callback: () {
                          // Navigation.pushReplaceNavigate(
                          //     page: const MainPage());
                        });
                  })
              // CustomButton(
              //   title: "Connection",
              //   onTap: () {
              //     controller.authenticate(
              //         username: _usernameCtrller.text.trim());
              //   },
              // )
            ],
          ),
        ),
      ),
    );
  }
}
