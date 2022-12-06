import 'package:cloud_firestore/cloud_firestore.dart';


class FirestoreService {
  
  FirestoreService._privateConstructor();
  static final FirestoreService _instance = FirestoreService._privateConstructor();
  static FirestoreService get instance => _instance;


  static FirebaseFirestore firestore = FirebaseFirestore.instance;

  static DocumentReference? _getReference(String? documentPath, String? collection, String? documentID) {
    if(documentPath!=null) return firestore.doc(documentPath);
    if(collection!=null && documentID!=null) return firestore.collection(collection).doc(documentID);
    return null;
  }

  static Future<DocumentSnapshot?> get({String? documentPath, String? collection, String? documentID}) async {
    DocumentSnapshot? documentSnapshot;
    
    try {
      DocumentReference? reference = _getReference(documentPath, collection, documentID);
      if(reference!=null) documentSnapshot = await reference.get();
    } catch (exception) {
     // Widgets.showToast("Error $exception");
    }
    return documentSnapshot;
  }

  static Future<DocumentReference?> add(String collectionPath, Map<String, dynamic> dataMap) async {
    CollectionReference reference = firestore.collection(collectionPath);
    DocumentReference? documentReference;
    try {
      documentReference = await reference.add(dataMap);
    } catch (exception) {
    // Widgets.showToast("Error $exception");
    }
    return documentReference;
  }

  static Future<bool> set({required Object? dataMap, String? documentPath, String? collection, String? documentID}) async {
    DocumentReference? reference = _getReference(documentPath, collection, documentID);
    bool created = false;
    try {
      if(reference!=null){
        await reference.set(dataMap, SetOptions(merge: true));
        created = true;
      }
    } catch (exception) {
     //  Widgets.showToast("Error $exception");
    }
    return created;
  }

  static Future<bool> update({ required Map<String, dynamic> dataMap, String? documentPath, String? collection, String? documentID, DocumentReference? reference}) async {
    bool updated = false;
    DocumentReference? _reference =  reference ?? _getReference(documentPath, collection, documentID);
    try {
      await firestore.runTransaction((transaction) async {
        try {
          if(_reference!=null){
            transaction.update(_reference, dataMap);
            updated = true;
          }
        } catch (exception) {
            updated = false;
          // Widgets.showToast("Error $exception");
        }
      });
    } catch (exception) {
      updated = false;
    //  Widgets.showToast("Error $exception");
    }
    return updated;
  }

  static Future<bool> delete(DocumentReference reference) async {
    bool deleted = false;
    try {
      await reference.delete();
      deleted = true;
    } catch (exception) {
     //  Widgets.showToast("Error $exception");
    }
    return deleted;
  }
}