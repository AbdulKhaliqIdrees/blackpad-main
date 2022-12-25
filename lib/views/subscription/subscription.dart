import 'package:blackpad/controllers/subscription_controller.dart';
import 'package:blackpad/views/subscription/subscription_item.dart';
import 'package:blackpad/widgets/button.dart';
import 'package:blackpad/widgets/icon.dart';
import 'package:blackpad/widgets/snack_bar.dart';
import 'package:blackpad/widgets/title_top_bar.dart';
import 'package:flutter/material.dart';

class Subscription extends StatefulWidget {
  const Subscription({Key? key}) : super(key: key);

  @override
  State<Subscription> createState() => _SubscriptionState();
}

class _SubscriptionState extends State<Subscription> {
  final controller = SubscriptionController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          const TitleTopBar('Go Unlimited'),
          const SizedBox(height: 24),
          const SvgIcon(
            'crown_selected',
            size: 120,
            color: Colors.amber,
          ),
          const SizedBox(height: 24),
          Expanded(
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              itemCount: controller.subscriptionList.length,
              shrinkWrap: true,
              separatorBuilder: (_, __) => const SizedBox(height: 12),
              itemBuilder: (_, i) {
                return SubscriptionItem(controller.subscriptionList[i]);
              },
            ),
          ),
          const SizedBox(height: 24),
          Button(
            'Subscribe to Pro 😎',
            onTap: () {
              showSnackBar(context, 'Coming soon!!');
              // controller.subscribe();
            },
          ),
        ],
      ),
    );
  }
}
