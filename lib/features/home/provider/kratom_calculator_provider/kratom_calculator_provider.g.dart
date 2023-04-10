// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kratom_calculator_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$kratomCalculatorHash() => r'eeb4b26b3305da35d244502918b59697745b0958';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

typedef KratomCalculatorRef = AutoDisposeProviderRef<KratomCalculatorService>;

/// See also [kratomCalculator].
@ProviderFor(kratomCalculator)
const kratomCalculatorProvider = KratomCalculatorFamily();

/// See also [kratomCalculator].
class KratomCalculatorFamily extends Family<KratomCalculatorService> {
  /// See also [kratomCalculator].
  const KratomCalculatorFamily();

  /// See also [kratomCalculator].
  KratomCalculatorProvider call({
    required double weight,
    required KratomUserStatusEnum userStatus,
    required KratomStateEnum state,
  }) {
    return KratomCalculatorProvider(
      weight: weight,
      userStatus: userStatus,
      state: state,
    );
  }

  @override
  KratomCalculatorProvider getProviderOverride(
    covariant KratomCalculatorProvider provider,
  ) {
    return call(
      weight: provider.weight,
      userStatus: provider.userStatus,
      state: provider.state,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'kratomCalculatorProvider';
}

/// See also [kratomCalculator].
class KratomCalculatorProvider
    extends AutoDisposeProvider<KratomCalculatorService> {
  /// See also [kratomCalculator].
  KratomCalculatorProvider({
    required this.weight,
    required this.userStatus,
    required this.state,
  }) : super.internal(
          (ref) => kratomCalculator(
            ref,
            weight: weight,
            userStatus: userStatus,
            state: state,
          ),
          from: kratomCalculatorProvider,
          name: r'kratomCalculatorProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$kratomCalculatorHash,
          dependencies: KratomCalculatorFamily._dependencies,
          allTransitiveDependencies:
              KratomCalculatorFamily._allTransitiveDependencies,
        );

  final double weight;
  final KratomUserStatusEnum userStatus;
  final KratomStateEnum state;

  @override
  bool operator ==(Object other) {
    return other is KratomCalculatorProvider &&
        other.weight == weight &&
        other.userStatus == userStatus &&
        other.state == state;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, weight.hashCode);
    hash = _SystemHash.combine(hash, userStatus.hashCode);
    hash = _SystemHash.combine(hash, state.hashCode);

    return _SystemHash.finish(hash);
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
