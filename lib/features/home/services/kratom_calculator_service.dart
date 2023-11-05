import 'package:kratom_dosage_calculator/features/home/enums/kratom_state_enum.dart';
import 'package:kratom_dosage_calculator/features/home/enums/kratom_user_status_enum.dart';

class KratomCalculatorService {
  const KratomCalculatorService({
    required this.state,
    required this.userWeight,
    required this.userStatus,
  });

  final KratomStateEnum state;
  final double userWeight;
  final KratomUserStatusEnum userStatus;

  double calculateDosage() {
    return (userWeight * state.value) * userStatus.value;
  }

  String printDosageInfo() {
    final dosage = calculateDosage();

    return 'For a user weighing $userWeight kg the recommended dosage for ${state.name.toLowerCase()} use is ${dosage.roundToDouble()} g.';
  }

  String printDosageInfoCapsules(double capsulesWeight) {
    final dosage = calculateDosage();

    return 'For a user weighing $userWeight kg the recommended dosage for ${state.name.toLowerCase()} use is ${dosage.roundToDouble()} g, which is equivalent to ${(dosage / capsulesWeight).roundToDouble()} capsules.';
  }
}
