import 'package:cloud_firestore/cloud_firestore.dart';

class Barber {
  String? barberID;
  String? barberInfo;
  String? barberName;
  Timestamp? publisheDate;
  String? barberUID;
  String? status;
  String? thumbnailUrl;

  Barber({
    this.barberID,
    this.barberInfo,
    this.barberName,
    this.publisheDate,
    this.barberUID,
    this.status,
    this.thumbnailUrl,
  });
  Barber.fromJson(Map<String, dynamic> json) {
    barberID = json["barberID"];
    barberInfo = json["barberInfo"];
    barberName = json["barberName"];
    publisheDate = json["publisheDate"];
    barberUID = json["barberUID"];
    status = json["status"];
    thumbnailUrl = json["thumbnailUrl"];
  }
}
