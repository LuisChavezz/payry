import 'package:collection/collection.dart';

enum PaymentStatus {
  PENDIENTE,
  PAGADO,
  DEVUELTO,
  CANCELADO,
}

enum PaymentType {
  QR,
  SMS,
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
    case (PaymentStatus):
      return PaymentStatus.values.deserialize(value) as T?;
    case (PaymentType):
      return PaymentType.values.deserialize(value) as T?;
    default:
      return null;
  }
}
