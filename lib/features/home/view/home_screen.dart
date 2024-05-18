import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kratom_dosage_calculator/core/widgets/unfocuser.dart';
import 'package:kratom_dosage_calculator/features/home/widgets/calc_info_card.dart';
import 'package:kratom_dosage_calculator/features/home/widgets/dosage_calc_card.dart';
import 'package:kratom_dosage_calculator/features/home/widgets/warning_card.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Unfocuser(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Kratom dosage calculator'),
        ),
        body: const SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(left: 20, right: 20, bottom: 30),
            child: Column(
              children: [
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
