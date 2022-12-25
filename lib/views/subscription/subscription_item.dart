import 'package:blackpad/global/colors.dart';
import 'package:flutter/material.dart';

class SubscriptionItem extends StatelessWidget {
  const SubscriptionItem(this.text, {Key? key}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: MyColors.grey,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.check),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                color: MyColors.prime,
                fontSize: 18,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
