enum KratomStateEnum {
  energetic(0.055),
  sedative(0.088);

  const KratomStateEnum(this.value);
  final double value;

  String get name {
    switch (this) {
      case KratomStateEnum.energetic:
        return 'Energetic';
      case KratomStateEnum.sedative:
        return 'Sedative';
    }
  }
}
