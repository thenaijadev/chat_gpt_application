import 'package:flutter/material.dart';
import '../constants/constants.dart';
import '../widgets/text_widget.dart';

class Services {
  static Future<void> showModalSheet(BuildContext context) async {
    showModalBottomSheet(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20),
          ),
        ),
        context: context,
        builder: (context) {
          return Material(
            color: scaffoldBackgroundColor,
            child: const Padding(
              padding: EdgeInsets.all(18.0),
              child: Row(
                children: [
                  Flexible(
                      child: TextWidget(
                    label: "Chosen Model",
                    fontSize: 16,
                  ))
                ],
              ),
            ),
          );
        });
  }
}
