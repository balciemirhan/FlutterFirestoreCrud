import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud_operations/auth/signup.dart';
import 'package:crud_operations/core/theme/text.dart';
import 'package:crud_operations/core/widgets/auth_button.dart';
import 'package:crud_operations/core/widgets/my_textformfield.dart';
import 'package:crud_operations/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({Key? key, required this.formKey}) : super(key: key);

  final GlobalKey<FormState> formKey;

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController userNameController = TextEditingController();
  RegisterService registerService = RegisterService();

//butona atamak için oluşturduğum fonksiyon. => register()

/* ----------------------- Register Function -----------------------  */

// ----------  controller'ı , form süreci sonrası imha et. ----------

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return Form(
      key: widget.formKey,
      child: Column(
        children: [
          /* ----------------------- MyTextformfields -----------------------  */

          MyTextformfield(
            controller: userNameController,
            hintText: "Kullanıcı Adı",
            prefixIcon: const Icon(Icons.email_outlined),
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return AppText.validEmail;
              }
              return null;
            },
          ),
          const SizedBox(height: 15),
          MyTextformfield(
            controller: emailController,
            hintText: AppText.email,
            prefixIcon: const Icon(Icons.email_outlined),
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return AppText.validEmail;
              }
              return null;
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: MyTextformfield(
              controller: passwordController,
              hintText: AppText.password,
              prefixIcon: const Icon(Icons.email_outlined),
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if (value != null && value.length < 6) {
                  return AppText.validPassword;
                }
                return null;
              },
            ),
          ),
          MyTextformfield(
            controller: confirmPasswordController,
            hintText: AppText.confirmPassword,
            prefixIcon: const Icon(Icons.email_outlined),
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              if (value != null && value.length < 6) {
                return AppText.validPassword;
              }
              return null;
            },
          ),

          /* ----------------------- Auth Button -----------------------  */

          Padding(
            padding: EdgeInsets.only(top: mediaQuery.height / 12),
            child: AuthButton(
              formKey: widget.formKey,
              buttonTitle: AppText.registerButtonTitle,
              auth: () => RegisterService().createUser(
                  userNameController.text,
                  emailController.text,
                  passwordController.text,
                  confirmPasswordController.text),
            ),
          ),
        ],
      ),
    );
  }
}
