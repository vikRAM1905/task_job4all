import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/colorUtils.dart';
import '../utils/imageUtils.dart';
import 'dashboard.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: primaryColor,
          child: Column(
            children: [
              companyName(size),
              SizedBox(height: size.height * 0.10),
              secondChild(size),
              SizedBox(height: size.height * 0.05),
              buttonWidget(size, "Poster", () {
                Get.to(() => DashboardPage(), arguments: 1);
              }, secondaryColor, Colors.blue),
              SizedBox(height: size.height * 0.02),
              buttonWidget(size, "Bidder", () {
                Get.to(() => DashboardPage(), arguments: 2);
              }, Color.fromARGB(255, 62, 67, 159), secondaryColor)
            ],
          ),
        ),
      ),
    );
  }

  Widget secondChild(Size size) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.only(left: 30, right: 20, bottom: 5),
      // width: size.width * 0.80,
      // height: size.height * 0.30,
      child: Center(
        child: Image.asset(
          splashBg,
          // width: double.infinity,
          // height: size.height * 0.30,
          fit: BoxFit.fill,
        ),
      ),
    );
  }

  Widget companyName(Size size) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              'Building a community to get work done!\nNo Job or Skill is too small!',
              textAlign: TextAlign.center,
              style: TextStyle(
                  height: 2,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }

  Widget buttonWidget(
      Size size, String name, onTap, Color bgColor, Color txtColor) {
    return Container(
      height: size.height * 0.07,
      width: size.width * 0.80,
      decoration: BoxDecoration(
          color: bgColor, borderRadius: BorderRadius.circular(20)),
      child: InkWell(
          onTap: onTap,
          child: Center(
              child: Text(name,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: txtColor)))),
    );
  }
}
