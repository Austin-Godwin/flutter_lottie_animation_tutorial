import 'package:flutter/material.dart';
import 'package:flutter_animation_test/constants.dart';
import 'package:flutter_animation_test/views/splash_screen/component/bottom_part.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _coffeeController;
  bool cupAnimated = false;
  bool animatedCafeText = false;

  @override
  initState() {
    _coffeeController = AnimationController(vsync: this);
    _coffeeController.addListener(() {
      if (_coffeeController.value > 0.7) {
        _coffeeController.stop();
        cupAnimated = true;
        setState(() {});
        // setState(() {
        //   cupAnimated = true;
        // });
        Future.delayed(const Duration(seconds: 1), (() {
          animatedCafeText = true;
          setState(() {});
          // setState(() {
          //   animatedCafeText = true;
          // });
        }));
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _coffeeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: cafeBrown,
      body: Stack(
        children: [
          AnimatedContainer(
            duration: const Duration(seconds: 1),
            height: cupAnimated ? screenHeight / 1.9 : screenHeight,
            decoration: BoxDecoration(
              color: const Color(0xffffffff),
              borderRadius: BorderRadius.circular(cupAnimated ? 40.0 : 0.0),
              // cupAnimated ? BorderRadius.circular(40.0) : BorderRadius.zero,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                !cupAnimated
                    ? Lottie.asset("assets/coffeesplash.json",
                        controller: _coffeeController, onLoaded: (composition) {
                        _coffeeController
                          ..duration = composition.duration
                          ..forward();
                      })
                    : Image.asset(
                        "assets/coffeepic.png",
                        height: 190.0,
                        width: 190.0,
                      ),
                Center(
                  child: AnimatedOpacity(
                    opacity: animatedCafeText ? 1 : 0,
                    duration: const Duration(seconds: 1),
                    child: const Text(
                      "C A F É",
                      style: TextStyle(fontSize: 50.0, color: cafeBrown),
                    ),
                  ),
                )
                // Visibility(
                //   visible: !cupAnimated,
                //   child: Lottie.asset("assets/coffeesplash.json",
                //       controller: _coffeeController, onLoaded: (composition) {
                //     _coffeeController
                //       ..duration = composition.duration
                //       ..forward();
                //   }),
                // ),
                // Visibility(
                //   visible: cupAnimated,
                //   child: Image.asset(
                //     "assets/coffeepic.png",
                //     height: 190.0,
                //     width: 190.0,
                //   ),
                // ),
                // Center(
                //   child: AnimatedOpacity(
                //     opacity: animatedCafeText ? 1 : 0,
                //     duration: const Duration(seconds: 1),
                //     child: const Text(
                //       "C A F É",
                //       style: TextStyle(fontSize: 50.0, color: cafeBrown),
                //     ),
                //   ),
                // )
              ],
            ),
          ),
          cupAnimated
              ? const BottomPart()
              : const Align(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    "Austin Godwin",
                    style: TextStyle(
                      color: cafeBrown,
                      fontSize: 30.0,
                      // fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
          // Visibility(
          //   visible: cupAnimated,
          //   child: const BottomPart(),
          // )
        ],
      ),
    );
  }
}
