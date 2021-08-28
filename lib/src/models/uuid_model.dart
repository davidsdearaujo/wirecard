class UuidModel {
  final String value;
  const UuidModel(this.value);

  factory UuidModel.fromMap(String value) {
    final parts = <String>[];
    parts.add(value.substring(0, 8));
    parts.add(value.substring(8, 12));
    parts.add(value.substring(12, 16));
    parts.add(value.substring(16, 20));
    parts.add(value.substring(20));
    return UuidModel(parts.join('-'));
  }

  String toMap() {
    return value.replaceAll('-', '');
  }
}
