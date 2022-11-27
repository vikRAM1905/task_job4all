import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/colorUtils.dart';
import '../utils/constants.dart';
import '../utils/imageUtils.dart';

class SplashPage extends StatefulWidget {
  SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with TickerProviderStateMixin {
  Animation? _logoAnimation;
  AnimationController? _logoAnimationController;

  bool _initialized = false;
  bool _error = false;
  String? errorMsg;

  @override
  void initState() {
    super.initState();

    _logoAnimationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    _logoAnimation = Tween(begin: 0.0, end: 200.0).animate(CurvedAnimation(
        curve: Curves.bounceOut, parent: _logoAnimationController!));

    _logoAnimationController!.addStatusListener((AnimationStatus status) {});
    _logoAnimationController!.forward();
    startTime();
  }

  startTime() async {
    var _duration = new Duration(seconds: 5);
    return new Timer(_duration, navigationPage);
  }

  void navigationPage() {
    setState(() {
      Get.offAllNamed(ROUTE_LOGIN);
    });
  }

  @override
  void dispose() {
    super.dispose();
    //SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    _logoAnimationController?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(color: primaryColor),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [secondChild(size), companyName(size)],
        ),
      ),
    );
  }

  Widget secondChild(Size size) {
    Size size = MediaQuery.of(context).size;
    return AnimatedBuilder(
      animation: _logoAnimationController!,
      builder: (context, child) {
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
      },
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
}
