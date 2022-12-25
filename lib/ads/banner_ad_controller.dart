import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class BannerAdController extends GetxController {
  BannerAd? bannerAd;

  // String bannerId = 'ca-app-pub-3940256099942544/6300978111';
  String bannerId = 'ca-app-pub-5607603323445866/2602406555';
  final isLoaded = false.obs;

  void initBannerAd() {
    bannerAd = BannerAd(
      adUnitId: bannerId,
      size: AdSize.banner,
      request: const AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: (Ad ad) async {
          isLoaded.value = true;
        },
        onAdFailedToLoad: (Ad ad, LoadAdError error) {
          ad.dispose();
        },
      ),
    )..load();
  }
}
