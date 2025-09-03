class Databasemateria {
  //Create
  Future addMateria(Map<String, dynamic> materiaInfoMap, String id)async{
    return await FirebaseFirestore.instance.collection("Matéria").doc(id).set(materiaInfoMap);
  }
  //Read
  Future<Stream<QuerySnapshot>> getMateriaInfo() async{
    return await FirebaseFirestore.instance.collection("Matéria").snapshots();
  }
  //Update
  Future updateMateriaInfo(String id, Map<String, dynamic> updateInfo) async {
    return await FirebaseFirestore.instance.collection("Matéria").doc(id).update(updateInfo);
  }
  //Delete
  Future deleteMateria(String id) async{
    return await FirebaseFirestore.instance.collection("Matéria").doc(id).delete();
  }

}