import 'package:collection/collection.dart';

enum Habitat {
  PL,
  ZPM,
  POM,
  WMA,
  PDL,
  LBE,
  WIE,
  KUJ,
  LOD,
  MAZ,
  LBU,
  DOL,
  OPO,
  SLA,
  MAL,
  SWI,
  PDK,
}

extension FFEnumExtensions<T extends Enum> on T {
  String serialize() => name;
}

extension FFEnumListExtensions<T extends Enum> on Iterable<T> {
  T? deserialize(String? value) =>
      firstWhereOrNull((e) => e.serialize() == value);
}

T? deserializeEnum<T>(String? value) {
  switch (T) {
    case (Habitat):
      return Habitat.values.deserialize(value) as T?;
    default:
      return null;
  }
}
