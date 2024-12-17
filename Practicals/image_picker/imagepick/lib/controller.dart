import 'package:cloud_firestore/cloud_firestore.dart';

class Controller {
  FirebaseFirestore reference = FirebaseFirestore.instance;

  void addData(String docName, Map<String, dynamic> data) {
    reference
        .collection("Stud")
        .doc("YashodipRaju")
        .collection("Yash")
        .doc("Raju")
        .collection("Collection")
        .doc(docName)
        .set(data);
  }

  Future<List<Map<String, dynamic>>> readData() async {
    List<Map<String, dynamic>> data = [];
    CollectionReference reference = this
        .reference
        .collection("Stud")
        .doc("YashodipRaju")
        .collection("Yash")
        .doc("Raju")
        .collection("Collection");

    QuerySnapshot list = await reference.get();
    List docs = list.docs;
    for (var doc in docs) {
      data.add(doc.data());
    }
    print(data);
    return data;
  }
}
