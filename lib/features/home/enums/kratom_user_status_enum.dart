enum KratomUserStatusEnum {
  newcomer(0.85),
  regular(1),
  heavy(1.2);

  const KratomUserStatusEnum(this.value);
  final double value;

  String get name {
    switch (this) {
      case KratomUserStatusEnum.newcomer:
        return 'Newcomer';
      case KratomUserStatusEnum.regular:
        return 'Regular';
      case KratomUserStatusEnum.heavy:
        return 'Heavy';
    }
  }
}
