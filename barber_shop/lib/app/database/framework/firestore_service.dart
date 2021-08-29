import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService<T> {
  FirebaseFirestore _db = FirebaseFirestore.instance;

  // FindAll //

  Stream<List<T>> findAll(String str, fromJson) {
    return _db.collection(str).snapshots().map((snapshot) =>
        snapshot.docs.map((doc) => fromJson(doc.data())).toList());
  }

  // FindById //

  Stream<List<Map<String, dynamic>>> findById(String id, String str) {
    return _db
        .collection(str)
        .where('id', isEqualTo: id)
        .snapshots()
        .map((snapshot) => snapshot.docs.map((doc) => doc.data()).toList());
  }

  // Upsert //

  Future<void> addOrUpdate(String str, dynamic) {
    var options = SetOptions(merge: true);
    return _db.collection(str).doc(dynamic.id).set(dynamic.toMap(), options);
  }

  // Delete //

  Future<void> delete(String str, String id) {
    return _db.collection(str).doc(id).delete();
  }
}
