import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:projekt_pum/config/models/user.dart';
import 'package:projekt_pum/core/verify-code/verify-code.dart';
import 'package:projekt_pum/core/verify-code/verify-code.view.dart';
import 'package:projekt_pum/utils/repositories/data_repository.dart';

//603410623

enum Status { Waiting, Error }

class VerifyCodePageController extends State<VerifyCodePage> {
  VerifyCodePageController(this.phoneNumber);

  String verificationCode = "";
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
      verificationCompleted: (PhoneAuthCredential credential) async {
        print(credential);
      },
      verificationFailed: (FirebaseAuthException e) {
        print("  ");
        print("  ");
        print("  ");
        print("  ");
        print("  ");
        print("  ");
        print("  ");
        print(e.message);

      },
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
          .then((value) async {
            DataRepository repository = DataRepository();
            var uid = await repository.getData(FirebaseAuth.instance.currentUser!.uid);
            if(uid == null){
              await repository.addUser(UserResult(referenceId: FirebaseAuth.instance.currentUser!.uid, categories
              : []));
            }
            Navigator.of(context)
                .pushNamedAndRemoveUntil('/home', (Route<dynamic> route) => false);
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
