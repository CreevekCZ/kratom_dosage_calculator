import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kratom_dosage_calculator/features/home/enums/kratom_state_enum.dart';
import 'package:kratom_dosage_calculator/features/home/enums/kratom_user_status_enum.dart';
import 'package:kratom_dosage_calculator/features/home/services/kratom_calculator_service.dart';

part 'kratom_calculator_provider.freezed.dart';

final kratomCalculatorProvider =
    Provider.family<KratomCalculatorService, KratomCalculatorParams>(
        (ref, params) {
  return KratomCalculatorService(
    userWeight: params.weight.toDouble(),
    userStatus: params.userStatus,
    state: params.state,
  );
});

@freezed
class KratomCalculatorParams with _$KratomCalculatorParams {
  const factory KratomCalculatorParams({
    required double weight,
    required KratomUserStatusEnum userStatus,
    required KratomStateEnum state,
  }) = _KratomCalculatorParams;
}
