import 'package:blackpad/ads/banner_ad_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class BannerAdWidget extends StatefulWidget {
  const BannerAdWidget({Key? key}) : super(key: key);

  @override
  State<BannerAdWidget> createState() => _BannerAdWidgetState();
}

class _BannerAdWidgetState extends State<BannerAdWidget> {
  final adController = Get.find<BannerAdController>();

  @override
  void dispose() {
    adController.bannerAd!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Visibility(
        visible: adController.isLoaded.value,
        child: Container(
          child: AdWidget(ad: adController.bannerAd!),
          width: adController.bannerAd!.size.width.toDouble(),
          height: 72,
          alignment: Alignment.center,
        ),
      ),
    );
  }
}
