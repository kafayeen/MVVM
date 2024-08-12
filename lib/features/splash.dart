import 'package:book_views/core/utlis/assets.dart';
import 'package:book_views/core/utlis/styes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slide;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    slide = Tween<Offset>(begin: const Offset(0, 2), end: Offset.zero)
        .animate(animationController);

    animationController.forward();
    // animationController = AnimationController(
    //   vsync: this,
    //   duration: const Duration(seconds: 3),
    // );
    // slide = Tween<Offset>(begin: const Offset(0, 5), end: const Offset(0, 0))
    //     .animate(animationController);
    // slide.addListener(() {
    //   setState(() {});
    // });
    // animationController.forward();
    // super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              width: 150,
              height: 100,
              child: Image.asset(
                CustomAssets.kLogo,
                fit: BoxFit.fill,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            AnimatedBuilder(
                animation: slide,
                builder: (context, wid) => SlideTransition(
                      position: slide,
                      child: Text(
                        "Welcome to ur App",
                        textAlign: TextAlign.center,
                        style: CustomTextStyle.style12,
                      ),
                    )),
            const SizedBox(
              height: 50,
            ),
            MaterialButton(
              onPressed: () {
                GoRouter.of(context).push("/home");
              },
              child: Text(
                "Next",
                style: CustomTextStyle.style14,
              ),
            )
          ],
        ),
      ),
    );
  }
}
