import 'package:realm/realm.dart';
part 'realm_models.g.dart';

@RealmModel()
@MapTo('members')
class _Members {
  @PrimaryKey()
  @MapTo('_id')
  late ObjectId id;
  late bool acceptedCGU;
  late List<String> addresses;
  late ObjectId invitedBy;
  String? name;
  late String phone;
}

@RealmModel()
@MapTo('invitation')
class _Invitation {
  @PrimaryKey()
  @MapTo('_id')
  late ObjectId id;
  late String guessMember;
  late ObjectId producerId;
}

@RealmModel()
@MapTo('producer')
class _Producer {
  @PrimaryKey()
  @MapTo('_id')
  late ObjectId id;
  late List<String> admins;
  _ProducerImages? images;
  late List<_ProducerLocations> locations;
  _ProducerMinimumOrder? minimumOrder;
  String? name;
}

@RealmModel(ObjectType.embeddedObject)
@MapTo('producer_images')
class _ProducerImages {
  String? cover;
  String? mini;
}

@RealmModel(ObjectType.embeddedObject)
@MapTo('producer_locations')
class _ProducerLocations {
  String? address;
  String? city;
  _ProducerLocationsGeo? geo;
  String? name;
}

@RealmModel(ObjectType.embeddedObject)
@MapTo('producer_locations_geo')
class _ProducerLocationsGeo {
  String? lat;
  String? long;
}

@RealmModel(ObjectType.embeddedObject)
@MapTo('producer_minimumOrder')
class _ProducerMinimumOrder {
  @MapTo('pick-up')
  int? pickUp;
  int? shipping;
}
