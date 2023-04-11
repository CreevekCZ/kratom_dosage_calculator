import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kratom_dosage_calculator/features/home/widgets/calc_info_card.dart';
import 'package:kratom_dosage_calculator/features/home/widgets/dosage_calc_card.dart';
import 'package:kratom_dosage_calculator/features/home/widgets/warning_card.dart';
import 'package:unfocus_widget/unfocus_widget.dart';

class HomeScreen extends HookConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return UnFocusWidget(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Kratom dosage calculator'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 30),
            child: Column(
              children: const [
                SizedBox(width: double.infinity),
                WarningCard(),
                SizedBox(height: 20),
                DosageCalcCard(),
                SizedBox(height: 20),
                CalcInfoCard(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
