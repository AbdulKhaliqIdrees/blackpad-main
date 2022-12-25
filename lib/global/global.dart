import 'package:flutter/material.dart';

Future navigate(BuildContext context, Widget to) async {
  return await Navigator.of(context).push(
    MaterialPageRoute(
      builder: (_) => to,
    ),
  );
}

void pop(BuildContext context, [bool result = false]) {
  Navigator.of(context).pop(result);
}
