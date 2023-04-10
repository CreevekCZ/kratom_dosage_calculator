import 'package:kratom_dosage_calculator/features/home/enums/kratom_state_enum.dart';
import 'package:kratom_dosage_calculator/features/home/enums/kratom_user_status_enum.dart';
import 'package:kratom_dosage_calculator/features/home/services/kratom_calculator_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'kratom_calculator_provider.g.dart';

@Riverpod(keepAlive: false)
KratomCalculatorService kratomCalculator(
  KratomCalculatorRef ref, {
  required double weight,
  required KratomUserStatusEnum userStatus,
  required KratomStateEnum state,
}) {
  return KratomCalculatorService(
    userWeight: weight.toDouble(),
    userStatus: userStatus,
    state: state,
  );
}
