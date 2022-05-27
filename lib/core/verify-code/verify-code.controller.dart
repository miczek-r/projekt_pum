import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:projekt_pum/core/verify-code/verify-code.dart';
import 'package:projekt_pum/core/verify-code/verify-code.view.dart';

enum Status { Waiting, Error }

class VerifyCodePageController extends State<VerifyCodePage> {
  VerifyCodePageController(this.phoneNumber);

  String verificationCode = "000000";
  final String phoneNumber;
  String? verificationId;
  var status = Status.Waiting;
  var textEditingController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
    verifyPhoneNumber();
  }

  Future verifyPhoneNumber() async {
    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) async {},
      verificationFailed: (FirebaseAuthException e) {},
      codeSent: (String verificationId, int? resendToken) async {
        setState(() => this.verificationId = verificationId);
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  Future sendCodeToFirebase() async {
    if (verificationId != null) {
      var credential = PhoneAuthProvider.credential(
          verificationId: verificationId!, smsCode: verificationCode);

      await _auth
          .signInWithCredential(credential)
          .then((value) {
            Navigator.of(context)
                .pushNamedAndRemoveUntil('/r', (Route<dynamic> route) => false);
          })
          .whenComplete(() {})
          .onError((error, stackTrace) {
            setState(() {
              textEditingController.text = "";
              status = Status.Error;
            });
          });
    }
  }

  @override
  Widget build(BuildContext context) => VerifyCodePageView(this);
}
