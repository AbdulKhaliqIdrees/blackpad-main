import 'package:blackpad/global/colors.dart';
import 'package:blackpad/global/global.dart';
import 'package:blackpad/views/master/master.dart';
import 'package:blackpad/widgets/icon.dart';
import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    Future.delayed(
      const Duration(milliseconds: 400),
      () {
        navigate(context, const Master());
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: MyColors.prime,
        body: Row(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  SvgIcon(
                    'icon',
                    color: MyColors.white,
                    size: 72,
                  ),
                  // SizedBox(height: 16),
                  // Text(
                  //   'BlackPad',
                  //   style: TextStyle(
                  //     fontSize: 28,
                  //     color: MyColors.white,
                  //   ),
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
