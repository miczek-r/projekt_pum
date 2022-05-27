import 'package:flutter/material.dart';
import 'package:projekt_pum/core/verify-code/verify-code.controller.dart';

class VerifyCodePage extends StatefulWidget {
  final phoneNumber;

  const VerifyCodePage({super.key, required this.phoneNumber});
  @override
  VerifyCodePageController createState() =>
      VerifyCodePageController(this.phoneNumber);
}
