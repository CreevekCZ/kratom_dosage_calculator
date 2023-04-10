import 'package:flutter/material.dart';
import 'package:kratom_dosage_calculator/features/home/enums/kratom_state_enum.dart';
import 'package:kratom_dosage_calculator/features/home/enums/kratom_user_status_enum.dart';

class CalcInfoCard extends StatelessWidget {
  const CalcInfoCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      surfaceTintColor: Colors.white,
      color: Colors.white,
      elevation: 5,
      child: Container(
        color: Colors.transparent,
        constraints: const BoxConstraints(maxWidth: 600),
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 20, width: double.infinity),
            Text(
              'This calculator is based on the following formula:',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 20),
            Text(
              'Dose = ((Weight in kg) * (State multiplier)) * (User status multiplier)',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 10),
            Text(
              'State multiplier:',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            Text(
              '- energetic: ${KratomStateEnum.energetic.value}\n- sedative: ${KratomStateEnum.sedative.value}',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 10),
            Text(
              'Kind of multiplier:',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            Text(
              '- newcomer: ${KratomUserStatusEnum.newcomer.value}\n- regular: ${KratomUserStatusEnum.regular.value}\n- heavy: ${KratomUserStatusEnum.heavy.value}',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 10),
            Text(
              'If you think that some of the constants are wrong, please let me know to e-mail xryx1111@gmail.com I am open to any suggestions and improvements.',
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(color: Colors.green, fontWeight: FontWeight.w900),
            ),
            const SizedBox(height: 10),
            SelectableText(
              'The result is in grams',
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
