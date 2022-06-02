import 'package:cloud_firestore/cloud_firestore.dart';

class Items {
  String? barberID;
  String? itemsID;
  String? longDescription;
  Timestamp? publisheDate;
  String? barberUID;
  String? status;
  String? thumbnailUrl;

  Items({
    this.barberID,
    this.itemsID,
    this.longDescription,
    this.publisheDate,
    this.barberUID,
    this.status,
    this.thumbnailUrl,
  });
  Items.fromJson(Map<String, dynamic> json) {
    barberID = json["barberID"];
    itemsID = json[" itemsID "];
    longDescription = json["longDescription"];
    publisheDate = json["publisheDate"];
    barberUID = json["barberUID"];
    status = json["status"];
    thumbnailUrl = json["thumbnailUrl"];
  }

  get itemsName => null;

  get itemsInfo => null;
}
