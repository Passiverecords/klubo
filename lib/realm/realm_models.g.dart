// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'realm_models.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

// ignore_for_file: type=lint
class Members extends _Members with RealmEntity, RealmObjectBase, RealmObject {
  Members(
    ObjectId id,
    bool acceptedCGU,
    ObjectId invitedBy,
    String phone, {
    String? name,
    Iterable<String> addresses = const [],
  }) {
    RealmObjectBase.set(this, '_id', id);
    RealmObjectBase.set(this, 'acceptedCGU', acceptedCGU);
    RealmObjectBase.set(this, 'invitedBy', invitedBy);
    RealmObjectBase.set(this, 'name', name);
    RealmObjectBase.set(this, 'phone', phone);
    RealmObjectBase.set<RealmList<String>>(
        this, 'addresses', RealmList<String>(addresses));
  }

  Members._();

  @override
  ObjectId get id => RealmObjectBase.get<ObjectId>(this, '_id') as ObjectId;
  @override
  set id(ObjectId value) => RealmObjectBase.set(this, '_id', value);

  @override
  bool get acceptedCGU =>
      RealmObjectBase.get<bool>(this, 'acceptedCGU') as bool;
  @override
  set acceptedCGU(bool value) =>
      RealmObjectBase.set(this, 'acceptedCGU', value);

  @override
  RealmList<String> get addresses =>
      RealmObjectBase.get<String>(this, 'addresses') as RealmList<String>;
  @override
  set addresses(covariant RealmList<String> value) =>
      throw RealmUnsupportedSetError();

  @override
  ObjectId get invitedBy =>
      RealmObjectBase.get<ObjectId>(this, 'invitedBy') as ObjectId;
  @override
  set invitedBy(ObjectId value) =>
      RealmObjectBase.set(this, 'invitedBy', value);

  @override
  String? get name => RealmObjectBase.get<String>(this, 'name') as String?;
  @override
  set name(String? value) => RealmObjectBase.set(this, 'name', value);

  @override
  String get phone => RealmObjectBase.get<String>(this, 'phone') as String;
  @override
  set phone(String value) => RealmObjectBase.set(this, 'phone', value);

  @override
  Stream<RealmObjectChanges<Members>> get changes =>
      RealmObjectBase.getChanges<Members>(this);

  @override
  Members freeze() => RealmObjectBase.freezeObject<Members>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(Members._);
    return const SchemaObject(ObjectType.realmObject, Members, 'members', [
      SchemaProperty('id', RealmPropertyType.objectid,
          mapTo: '_id', primaryKey: true),
      SchemaProperty('acceptedCGU', RealmPropertyType.bool),
      SchemaProperty('addresses', RealmPropertyType.string,
          collectionType: RealmCollectionType.list),
      SchemaProperty('invitedBy', RealmPropertyType.objectid),
      SchemaProperty('name', RealmPropertyType.string, optional: true),
      SchemaProperty('phone', RealmPropertyType.string),
    ]);
  }
}

// ignore_for_file: type=lint
class Invitation extends _Invitation
    with RealmEntity, RealmObjectBase, RealmObject {
  Invitation(
    ObjectId id,
    String guessMember,
    ObjectId producerId,
  ) {
    RealmObjectBase.set(this, '_id', id);
    RealmObjectBase.set(this, 'guessMember', guessMember);
    RealmObjectBase.set(this, 'producerId', producerId);
  }

  Invitation._();

  @override
  ObjectId get id => RealmObjectBase.get<ObjectId>(this, '_id') as ObjectId;
  @override
  set id(ObjectId value) => RealmObjectBase.set(this, '_id', value);

  @override
  String get guessMember =>
      RealmObjectBase.get<String>(this, 'guessMember') as String;
  @override
  set guessMember(String value) =>
      RealmObjectBase.set(this, 'guessMember', value);

  @override
  ObjectId get producerId =>
      RealmObjectBase.get<ObjectId>(this, 'producerId') as ObjectId;
  @override
  set producerId(ObjectId value) =>
      RealmObjectBase.set(this, 'producerId', value);

  @override
  Stream<RealmObjectChanges<Invitation>> get changes =>
      RealmObjectBase.getChanges<Invitation>(this);

  @override
  Invitation freeze() => RealmObjectBase.freezeObject<Invitation>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(Invitation._);
    return const SchemaObject(
        ObjectType.realmObject, Invitation, 'invitation', [
      SchemaProperty('id', RealmPropertyType.objectid,
          mapTo: '_id', primaryKey: true),
      SchemaProperty('guessMember', RealmPropertyType.string),
      SchemaProperty('producerId', RealmPropertyType.objectid),
    ]);
  }
}

// ignore_for_file: type=lint
class Producer extends _Producer
    with RealmEntity, RealmObjectBase, RealmObject {
  Producer(
    ObjectId id, {
    ProducerImages? images,
    ProducerMinimumOrder? minimumOrder,
    String? name,
    Iterable<String> admins = const [],
    Iterable<ProducerLocations> locations = const [],
  }) {
    RealmObjectBase.set(this, '_id', id);
    RealmObjectBase.set(this, 'images', images);
    RealmObjectBase.set(this, 'minimumOrder', minimumOrder);
    RealmObjectBase.set(this, 'name', name);
    RealmObjectBase.set<RealmList<String>>(
        this, 'admins', RealmList<String>(admins));
    RealmObjectBase.set<RealmList<ProducerLocations>>(
        this, 'locations', RealmList<ProducerLocations>(locations));
  }

  Producer._();

  @override
  ObjectId get id => RealmObjectBase.get<ObjectId>(this, '_id') as ObjectId;
  @override
  set id(ObjectId value) => RealmObjectBase.set(this, '_id', value);

  @override
  RealmList<String> get admins =>
      RealmObjectBase.get<String>(this, 'admins') as RealmList<String>;
  @override
  set admins(covariant RealmList<String> value) =>
      throw RealmUnsupportedSetError();

  @override
  ProducerImages? get images =>
      RealmObjectBase.get<ProducerImages>(this, 'images') as ProducerImages?;
  @override
  set images(covariant ProducerImages? value) =>
      RealmObjectBase.set(this, 'images', value);

  @override
  RealmList<ProducerLocations> get locations =>
      RealmObjectBase.get<ProducerLocations>(this, 'locations')
          as RealmList<ProducerLocations>;
  @override
  set locations(covariant RealmList<ProducerLocations> value) =>
      throw RealmUnsupportedSetError();

  @override
  ProducerMinimumOrder? get minimumOrder =>
      RealmObjectBase.get<ProducerMinimumOrder>(this, 'minimumOrder')
          as ProducerMinimumOrder?;
  @override
  set minimumOrder(covariant ProducerMinimumOrder? value) =>
      RealmObjectBase.set(this, 'minimumOrder', value);

  @override
  String? get name => RealmObjectBase.get<String>(this, 'name') as String?;
  @override
  set name(String? value) => RealmObjectBase.set(this, 'name', value);

  @override
  Stream<RealmObjectChanges<Producer>> get changes =>
      RealmObjectBase.getChanges<Producer>(this);

  @override
  Producer freeze() => RealmObjectBase.freezeObject<Producer>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(Producer._);
    return const SchemaObject(ObjectType.realmObject, Producer, 'producer', [
      SchemaProperty('id', RealmPropertyType.objectid,
          mapTo: '_id', primaryKey: true),
      SchemaProperty('admins', RealmPropertyType.string,
          collectionType: RealmCollectionType.list),
      SchemaProperty('images', RealmPropertyType.object,
          optional: true, linkTarget: 'producer_images'),
      SchemaProperty('locations', RealmPropertyType.object,
          linkTarget: 'producer_locations',
          collectionType: RealmCollectionType.list),
      SchemaProperty('minimumOrder', RealmPropertyType.object,
          optional: true, linkTarget: 'producer_minimumOrder'),
      SchemaProperty('name', RealmPropertyType.string, optional: true),
    ]);
  }
}

// ignore_for_file: type=lint
class ProducerImages extends _ProducerImages
    with RealmEntity, RealmObjectBase, EmbeddedObject {
  ProducerImages({
    String? cover,
    String? mini,
  }) {
    RealmObjectBase.set(this, 'cover', cover);
    RealmObjectBase.set(this, 'mini', mini);
  }

  ProducerImages._();

  @override
  String? get cover => RealmObjectBase.get<String>(this, 'cover') as String?;
  @override
  set cover(String? value) => RealmObjectBase.set(this, 'cover', value);

  @override
  String? get mini => RealmObjectBase.get<String>(this, 'mini') as String?;
  @override
  set mini(String? value) => RealmObjectBase.set(this, 'mini', value);

  @override
  Stream<RealmObjectChanges<ProducerImages>> get changes =>
      RealmObjectBase.getChanges<ProducerImages>(this);

  @override
  ProducerImages freeze() => RealmObjectBase.freezeObject<ProducerImages>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(ProducerImages._);
    return const SchemaObject(
        ObjectType.embeddedObject, ProducerImages, 'producer_images', [
      SchemaProperty('cover', RealmPropertyType.string, optional: true),
      SchemaProperty('mini', RealmPropertyType.string, optional: true),
    ]);
  }
}

// ignore_for_file: type=lint
class ProducerLocations extends _ProducerLocations
    with RealmEntity, RealmObjectBase, EmbeddedObject {
  ProducerLocations({
    String? address,
    String? city,
    ProducerLocationsGeo? geo,
    String? name,
  }) {
    RealmObjectBase.set(this, 'address', address);
    RealmObjectBase.set(this, 'city', city);
    RealmObjectBase.set(this, 'geo', geo);
    RealmObjectBase.set(this, 'name', name);
  }

  ProducerLocations._();

  @override
  String? get address =>
      RealmObjectBase.get<String>(this, 'address') as String?;
  @override
  set address(String? value) => RealmObjectBase.set(this, 'address', value);

  @override
  String? get city => RealmObjectBase.get<String>(this, 'city') as String?;
  @override
  set city(String? value) => RealmObjectBase.set(this, 'city', value);

  @override
  ProducerLocationsGeo? get geo =>
      RealmObjectBase.get<ProducerLocationsGeo>(this, 'geo')
          as ProducerLocationsGeo?;
  @override
  set geo(covariant ProducerLocationsGeo? value) =>
      RealmObjectBase.set(this, 'geo', value);

  @override
  String? get name => RealmObjectBase.get<String>(this, 'name') as String?;
  @override
  set name(String? value) => RealmObjectBase.set(this, 'name', value);

  @override
  Stream<RealmObjectChanges<ProducerLocations>> get changes =>
      RealmObjectBase.getChanges<ProducerLocations>(this);

  @override
  ProducerLocations freeze() =>
      RealmObjectBase.freezeObject<ProducerLocations>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(ProducerLocations._);
    return const SchemaObject(
        ObjectType.embeddedObject, ProducerLocations, 'producer_locations', [
      SchemaProperty('address', RealmPropertyType.string, optional: true),
      SchemaProperty('city', RealmPropertyType.string, optional: true),
      SchemaProperty('geo', RealmPropertyType.object,
          optional: true, linkTarget: 'producer_locations_geo'),
      SchemaProperty('name', RealmPropertyType.string, optional: true),
    ]);
  }
}

// ignore_for_file: type=lint
class ProducerLocationsGeo extends _ProducerLocationsGeo
    with RealmEntity, RealmObjectBase, EmbeddedObject {
  ProducerLocationsGeo({
    String? lat,
    String? long,
  }) {
    RealmObjectBase.set(this, 'lat', lat);
    RealmObjectBase.set(this, 'long', long);
  }

  ProducerLocationsGeo._();

  @override
  String? get lat => RealmObjectBase.get<String>(this, 'lat') as String?;
  @override
  set lat(String? value) => RealmObjectBase.set(this, 'lat', value);

  @override
  String? get long => RealmObjectBase.get<String>(this, 'long') as String?;
  @override
  set long(String? value) => RealmObjectBase.set(this, 'long', value);

  @override
  Stream<RealmObjectChanges<ProducerLocationsGeo>> get changes =>
      RealmObjectBase.getChanges<ProducerLocationsGeo>(this);

  @override
  ProducerLocationsGeo freeze() =>
      RealmObjectBase.freezeObject<ProducerLocationsGeo>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(ProducerLocationsGeo._);
    return const SchemaObject(ObjectType.embeddedObject, ProducerLocationsGeo,
        'producer_locations_geo', [
      SchemaProperty('lat', RealmPropertyType.string, optional: true),
      SchemaProperty('long', RealmPropertyType.string, optional: true),
    ]);
  }
}

// ignore_for_file: type=lint
class ProducerMinimumOrder extends _ProducerMinimumOrder
    with RealmEntity, RealmObjectBase, EmbeddedObject {
  ProducerMinimumOrder({
    int? pickUp,
    int? shipping,
  }) {
    RealmObjectBase.set(this, 'pick-up', pickUp);
    RealmObjectBase.set(this, 'shipping', shipping);
  }

  ProducerMinimumOrder._();

  @override
  int? get pickUp => RealmObjectBase.get<int>(this, 'pick-up') as int?;
  @override
  set pickUp(int? value) => RealmObjectBase.set(this, 'pick-up', value);

  @override
  int? get shipping => RealmObjectBase.get<int>(this, 'shipping') as int?;
  @override
  set shipping(int? value) => RealmObjectBase.set(this, 'shipping', value);

  @override
  Stream<RealmObjectChanges<ProducerMinimumOrder>> get changes =>
      RealmObjectBase.getChanges<ProducerMinimumOrder>(this);

  @override
  ProducerMinimumOrder freeze() =>
      RealmObjectBase.freezeObject<ProducerMinimumOrder>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(ProducerMinimumOrder._);
    return const SchemaObject(ObjectType.embeddedObject, ProducerMinimumOrder,
        'producer_minimumOrder', [
      SchemaProperty('pickUp', RealmPropertyType.int,
          mapTo: 'pick-up', optional: true),
      SchemaProperty('shipping', RealmPropertyType.int, optional: true),
    ]);
  }
}
