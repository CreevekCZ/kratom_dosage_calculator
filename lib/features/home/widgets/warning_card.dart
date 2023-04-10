import 'package:flutter/material.dart';

class WarningCard extends StatelessWidget {
  const WarningCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      surfaceTintColor: Colors.red,
      // color: Colors.red.shade400,
      elevation: 5,
      child: Container(
        color: Colors.transparent,
        constraints: const BoxConstraints(maxWidth: 600),
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(width: double.infinity, height: 20),
            Text(
              'WARNING!',
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .copyWith(color: Colors.redAccent),
            ),
            const SizedBox(height: 10),
            Text(
              'This calculator is not intended to be used as a medical advice. It is only a tool to help you find the right dosage for you. Please consult your doctor before using kratom. Data provided by this calculator may not be accurate for you.',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
