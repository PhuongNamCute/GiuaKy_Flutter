import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class DatabaseMethods {
  Future addProductDetails(
      Map<String, dynamic> productInfoMap, String id) async {
    return await FirebaseFirestore.instance
        .collection("Product")
        .doc(id)
        .set(productInfoMap);
  }

  Future<Stream<QuerySnapshot>> getProductDetails() async {
    return await FirebaseFirestore.instance.collection("Product").snapshots();
  }

  Future updateProductDetail(String id, Map<String, dynamic> updateInfo) async {
    return await FirebaseFirestore.instance
        .collection("Product")
        .doc(id)
        .update(updateInfo);
  }

  Future deleteProductDetail(String id) async {
    return await FirebaseFirestore.instance
        .collection("Product")
        .doc(id)
        .delete();
  }
}
