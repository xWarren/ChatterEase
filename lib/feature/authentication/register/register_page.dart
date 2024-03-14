import 'package:flutter/material.dart';

import '../../../core/custom/custom_formfield.dart';
import '../../../core/resources/assets.dart';
import '../../../core/resources/colors.dart';
import '../../dashboard/dashboard_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool isTap = false;

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
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Image.asset(
            Assets.icArrowLeft
          ),
        ),
        title: const Text(
          "Register",
          style: TextStyle(
            color: CustomColors.black,
            fontSize: 18,
            fontWeight: FontWeight.normal
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(
          parent: BouncingScrollPhysics()
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            const Center(
              child: Text(
                "Create Account",
                style: TextStyle(
                  color: CustomColors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.w700
                ),
              ),
            ),
            _buildFirstName(),
            _buildLastName(),
            _buildEmail(),
            _buildPassword(),
            _buildConfirmPassword(),
            _buildCheckBox(),
            _buildButton()
          ],
        ),
      ),
    );
  }

  Widget _buildButton() {
    return Container(
      width: double.infinity,
      height: 50,
      margin:  const EdgeInsets.only(top: 30, left: 20, right: 20, bottom: 20),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: CustomColors.buttonColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8)
          )
        ),
        onPressed: isTap == false 
        ? null 
        : () {
          goToDashboard();
        }, 
        child: const Text(
          "Register",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w600
          ),
        )
      ),
    );
  }

  Widget _buildCheckBox() {
    return Container(
      margin:  const EdgeInsets.only(left: 5, right: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Checkbox(
                side: const BorderSide(color: CustomColors.buttonColor),
                activeColor: CustomColors.buttonColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                value: isTap, 
                onChanged: (value) {
                  setState(() {
                    isTap = !isTap;
                  });
                }
              ),
            ],
          ),
          const Expanded(
            child: Wrap(
              children: [
                Text(
                  "By creating an account, you agree to our ",
                  style: TextStyle(
                    color: CustomColors.black,
                    fontSize: 12,
                    fontWeight: FontWeight.normal
                  ),
                ),
                Text(
                  "Term and Conditions",
                  style: TextStyle(
                    color: CustomColors.buttonColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w500
                  ),
                ),
              ],
            ),
          ),     
        ],
      ),
    );
  }

  Widget _buildConfirmPassword() {
    return Container(
      margin:  const EdgeInsets.only(top: 30, left: 20, right: 20),
      child:  const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Confirm Password",
            style: TextStyle(
              color: CustomColors.black,
              fontSize: 15,
              fontWeight: FontWeight.normal
            ),
          ),
          SizedBox(height: 10),
          CustomTextFormField(
            hintText: "Enter your confirm password...",
            prefixImage: Assets.icPassword,
            suffixImage: Assets.icShowPassword,
            textInputAction: TextInputAction.done,
          ),
        ],
      ),     
    );
  }

  Widget _buildPassword() {
    return Container(
      margin:  const EdgeInsets.only(top: 30, left: 20, right: 20),
      child:  const Column(
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
            textInputAction: TextInputAction.next,
          ),
        ],
      ),     
    );
  }

  Widget _buildEmail() {
    return Container(
      margin:  const EdgeInsets.only(top: 30, left: 20, right: 20),
      child:  const Column(
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

  Widget _buildLastName() {
    return Container(
      margin:  const EdgeInsets.only(top: 30, left: 20, right: 20),
      child:  const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Last Name",
            style: TextStyle(
              color: CustomColors.black,
              fontSize: 15,
              fontWeight: FontWeight.normal
            ),
          ),
          SizedBox(height: 10),
          CustomTextFormField(
            hintText: "Enter your last name...",
            prefixImage: Assets.icUser,
            textInputAction: TextInputAction.next,
          ),
        ],
      ),     
    );
  }

  Widget _buildFirstName() {
    return Container(
      margin:  const EdgeInsets.only(top: 30, left: 20, right: 20),
      child:  const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "First Name",
            style: TextStyle(
              color: CustomColors.black,
              fontSize: 15,
              fontWeight: FontWeight.normal
            ),
          ),
          SizedBox(height: 10),
          CustomTextFormField(
            hintText: "Enter your first name...",
            prefixImage: Assets.icUser,
            textInputAction: TextInputAction.next,
          ),
        ],
      ),     
    );
  }
}