import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:projekt_pum/config/models/user.dart';

class DataRepository {
  final CollectionReference collection =
      FirebaseFirestore.instance.collection('userResults');

  Future<DocumentSnapshot?> getData(id) async {
    var docSnapshot = await collection.doc(id).get();
    if (docSnapshot.exists) {
      return docSnapshot;
    }
  }

  DocumentReference addUser(UserResult user) {
    DocumentReference docsref = collection.doc(user.referenceId);
    docsref.set(user.toJson());
    return docsref;
  }

  void updateUser(UserResult user) async {
    await collection.doc(user.referenceId).update(user.toJson());
  }

  void deleteUser(UserResult user) async {
    await collection.doc(user.referenceId).delete();
  }
}
