import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseDb {
  var db = FirebaseFirestore.instance;

  Future setEmailList(emailMap) async {
    final DocumentReference emailList = FirebaseFirestore.instance
        .collection('Email_Lists')
        .doc(DateTime.now().toString());
        return await emailList.set(emailMap);

        
  }
  Future setContactList(contactMap) async {
    final DocumentReference contactList = FirebaseFirestore.instance
        .collection('Contact_Lists')
        .doc(DateTime.now().toString());
        return await contactList.set(contactMap);
  }

//?READING THEM FROM THE FIREBASE
  Future<DocumentSnapshot> getSocialUrls() async => await db
      .collection('AZfESRQDwiN1DahUFVKzE2feAQO2')
      .doc('Social Media Urls')
      .get();

  Future<DocumentSnapshot> getContact() async => await db
      .collection('AZfESRQDwiN1DahUFVKzE2feAQO2')
      .doc('Contact Us Details')
      .get();

  Future<DocumentSnapshot> getAds() async => await db
      .collection('AZfESRQDwiN1DahUFVKzE2feAQO2')
      .doc('Ads Details')
      .get();
      Future<DocumentSnapshot> getLeftAbout() async => await db
      .collection('AZfESRQDwiN1DahUFVKzE2feAQO2')
      .doc('Left About Details')
      .get();
       Future<DocumentSnapshot> getRightAbout() async => await db
      .collection('AZfESRQDwiN1DahUFVKzE2feAQO2')
      .doc('Right About Details')
      .get();
}
