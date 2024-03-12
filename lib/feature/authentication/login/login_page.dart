import 'package:chatter_ease/feature/authentication/register/register_page.dart';
import 'package:flutter/material.dart';

import '../../../core/custom/custom_formfield.dart';
import '../../../core/resources/assets.dart';
import '../../../core/resources/colors.dart';
import '../../dashboard/dashboard_page.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  void goToDashboard() {
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(
        builder: (context) => const DashboardPage()
      ), 
      (Route<dynamic> route) => false
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(
          parent: BouncingScrollPhysics()
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildImage(),
              _buildText(),
              _buildEmail(),
              _buildPassword(),
              _buildForgotPassword(),
              _buildButton(),
              _buildCreateAccount()
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildText() {
    return const Center(
      child: Text(
        "Welcome",
        style: TextStyle(
          color: CustomColors.black,
          fontSize: 30,
          fontWeight: FontWeight.bold
        ),
      ),
    );
  }

  Widget _buildImage() {
    return Center(
      child: Image.asset(
        Assets.loginImage,
        height: 300,
        width: 280,
      ),
    );
  }

  Widget _buildCreateAccount() {
    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Don't have an account?",
            style: TextStyle(
              color: Colors.grey.shade700,
              fontSize: 13,
              fontWeight: FontWeight.normal
            ),
          ),
          const SizedBox(width: 5),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => const RegisterPage()));
              print("Register Page");
            },
            child: const Text(
              "Create Account",
              style: TextStyle(
                color: CustomColors.buttonColor,
                fontSize: 13,
                fontWeight: FontWeight.normal
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildButton() {
    return Container(
      height: 60,
      width: double.infinity,
      margin: const EdgeInsets.only(top: 50, left: 10, right: 10),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: CustomColors.buttonColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8)
          )
        ),
        onPressed: () {
          goToDashboard();
        },
        child: const Text(
          "Login",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w600
          ),
        ),
      ),
    );
  }

  Widget _buildForgotPassword() {
    return Padding(
      padding: const EdgeInsets.only(top: 10, right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          GestureDetector(
            onTap: () {
            },
            child: const Text(
              "Forgot Password?",
              style: TextStyle(
                color: CustomColors.buttonColor,
                fontSize: 15,
                fontWeight: FontWeight.w500
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPassword() {
    return Container(
      margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Password",
            style: TextStyle(
              color: CustomColors.black,
              fontSize: 15,
              fontWeight: FontWeight.normal
            ),
          ),
          SizedBox(height: 10),
          CustomTextFormField(
            hintText: "Enter your password...",
            prefixImage: Assets.icPassword,
            suffixImage: Assets.icShowPassword,
            obscureText: true,
            textInputAction: TextInputAction.done,
          ),
        ],
      ),     
    );
  }

  Widget _buildEmail() {
    return Container(
      margin: const EdgeInsets.only(top: 30, left: 10, right: 10),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Email",
            style: TextStyle(
              color: CustomColors.black,
              fontSize: 15,
              fontWeight: FontWeight.normal
            ),
          ),
          SizedBox(height: 10),
          CustomTextFormField(
            hintText: "Enter your email...",
            prefixImage: Assets.icEmail,
            suffixImage: Assets.icCheck,
            textInputAction: TextInputAction.next,
          ),
        ],
      ),     
    );
  }
}