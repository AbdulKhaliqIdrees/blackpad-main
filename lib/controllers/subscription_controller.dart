import 'package:get/get.dart';
import 'package:in_app_purchase/in_app_purchase.dart';

class SubscriptionController extends GetxController {
  final InAppPurchase iap = InAppPurchase.instance;

  final subscriptionList = [
    'Store all of your notes in Cloud and get '
        'access on all linked devices',
    'Collaborate with your friends and make'
        'changes to the note in realtime',
    'Enjoy an ad-free experience',
    'Enhance your notes using images, lists, '
        'voice notes and custom drawings',
  ];

  void subscribe() async {
    final bool available = await iap.isAvailable();

    if (available) {
      const Set<String> ids = <String>{'bp_ot_001'};
      final ProductDetailsResponse response =
          await iap.queryProductDetails(ids);
      if (response.error != null) return;

      ProductDetails product = response.productDetails[0];

      final PurchaseParam purchaseParam =
          PurchaseParam(productDetails: product);

      await iap.buyNonConsumable(purchaseParam: purchaseParam);
    }
  }
}
