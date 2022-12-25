import 'dart:async';

import 'package:blackpad/ads/app_open_ad_manager.dart';
import 'package:flutter/foundation.dart';
import 'package:in_app_purchase/in_app_purchase.dart';

class AppController {
  // app open ad

  late AppLifecycleReactor _appLifecycleReactor;

  void initAppOpenAd() {
    AppOpenAdManager appOpenAdManager = AppOpenAdManager()..appOpenCount();
    _appLifecycleReactor =
        AppLifecycleReactor(appOpenAdManager: appOpenAdManager);
    _appLifecycleReactor.listenToAppStateChanges();
  }

  // in app purchases
  late StreamSubscription<List<PurchaseDetails>> subscription;
  InAppPurchase iap = InAppPurchase.instance;

  void initIap() {
    final Stream purchaseUpdated = iap.purchaseStream;
    subscription = purchaseUpdated.listen(
      (purchaseDetailsList) {
        listenToPurchase(purchaseDetailsList);
      },
      onDone: () {
        subscription.cancel();
      },
      onError: (error) {},
    ) as StreamSubscription<List<PurchaseDetails>>;
  }

  void listenToPurchase(List<PurchaseDetails> purchaseDetailsList) async {
    for (var purchaseDetails in purchaseDetailsList) {
      if (purchaseDetails.status == PurchaseStatus.pending) {
        debugPrint('PENDING');
      } else {
        if (purchaseDetails.status == PurchaseStatus.error) {
          debugPrint('ERROR');
        } else if (purchaseDetails.status == PurchaseStatus.purchased ||
            purchaseDetails.status == PurchaseStatus.restored) {
          debugPrint('PURCHASED');
        }
        if (purchaseDetails.pendingCompletePurchase) {
          await iap.completePurchase(purchaseDetails);
        }
      }
    }
  }

  void dispose() {
    subscription.cancel();
  }
}
