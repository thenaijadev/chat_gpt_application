import 'package:flutter/material.dart';
import "../constants/constants.dart";

class DropDownWidget extends StatefulWidget {
  const DropDownWidget({super.key});

  @override
  State<DropDownWidget> createState() => _DropDownWidgetState();
}

class _DropDownWidgetState extends State<DropDownWidget> {
  String currentModel = "Model 1";
  @override
  Widget build(BuildContext context) {
    return DropdownButton(
        items: getModelsItem,
        value: currentModel,
        onChanged: (value) {
          currentModel = value.toString();
        });
  }
}
