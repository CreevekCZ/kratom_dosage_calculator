import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kratom_dosage_calculator/core/widgets/animated_visibility.dart';
import 'package:kratom_dosage_calculator/features/home/enums/kratom_state_enum.dart';
import 'package:kratom_dosage_calculator/features/home/enums/kratom_user_status_enum.dart';
import 'package:kratom_dosage_calculator/features/home/provider/kratom_calculator_provider/kratom_calculator_provider.dart';

class DosageCalcCard extends ConsumerStatefulWidget {
  const DosageCalcCard({super.key});

  @override
  ConsumerState<DosageCalcCard> createState() => _DosageCalcCardState();
}

class _DosageCalcCardState extends ConsumerState<DosageCalcCard> {
  final formKey = GlobalKey<FormState>();

  KratomStateEnum state = KratomStateEnum.energetic;
  KratomUserStatusEnum userStatus = KratomUserStatusEnum.newcomer;
  double weight = 65;

  bool shouldCalculateNumberOfCapsules = false;

  double capsulesWeight = 0.5;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20),
        constraints: const BoxConstraints(maxWidth: 600),
        child: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                DropdownButtonFormField<KratomUserStatusEnum>(
                  isExpanded: true,
                  value: userStatus,
                  decoration: const InputDecoration(
                    labelText: 'Kind of user',
                  ),
                  onChanged: (KratomUserStatusEnum? newValue) {
                    userStatus = newValue!;
                  },
                  items: KratomUserStatusEnum.values
                      .map<DropdownMenuItem<KratomUserStatusEnum>>(
                          (KratomUserStatusEnum value) {
                    return DropdownMenuItem<KratomUserStatusEnum>(
                      value: value,
                      child: Text(value.name),
                    );
                  }).toList(),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 85,
                        child: TextFormField(
                          decoration: const InputDecoration(
                            labelText: 'Weight',
                          ),
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            // allow only numbers and one decimal point
                            FilteringTextInputFormatter.allow(
                              RegExp(r'^\d*\.?\d*'),
                            ),
                          ],
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your weight';
                            }
                            return null;
                          },
                          onChanged: (value) {
                            if (value.isEmpty) {
                              weight = 0;
                              return;
                            }

                            weight = double.parse(value);
                          },
                          onFieldSubmitted: (_) =>
                              calculateDosage(context, ref),
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    SizedBox(
                      height: 85,
                      width: 150,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          DropdownButtonFormField<KratomStateEnum>(
                            isExpanded: true,
                            value: state,
                            decoration: const InputDecoration(
                              labelText: 'State',
                            ),
                            onChanged: (KratomStateEnum? newValue) {
                              state = newValue!;
                            },
                            items: <KratomStateEnum>[
                              KratomStateEnum.energetic,
                              KratomStateEnum.sedative
                            ].map<DropdownMenuItem<KratomStateEnum>>(
                                (KratomStateEnum value) {
                              return DropdownMenuItem<KratomStateEnum>(
                                value: value,
                                child: Text(value.name),
                              );
                            }).toList(),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Switch(
                      value: shouldCalculateNumberOfCapsules,
                      onChanged: (value) {
                        setState(() {
                          shouldCalculateNumberOfCapsules = value;
                        });
                      },
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'Calculate number of capsules',
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                  ],
                ),
                AnimatedVisibility(
                  visible: shouldCalculateNumberOfCapsules,
                  child: SizedBox(
                    height: 100,
                    child: TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Capsule weight in grams',
                      ),
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(
                          RegExp(r'^\d*\.?\d*'),
                        ),
                      ],
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your weight of one capsule';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        if (value.isEmpty) {
                          capsulesWeight = 0;
                          return;
                        }

                        capsulesWeight = double.parse(value);
                      },
                      onFieldSubmitted: (_) => calculateDosage(context, ref),
                    ),
                  ),
                ),
                FilledButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 40,
                      vertical: 20,
                    ),
                  ),
                  onPressed: () => calculateDosage(context, ref),
                  child: Text(
                    'Calculate',
                    style: Theme.of(context).textTheme.labelLarge!.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void calculateDosage(BuildContext context, WidgetRef ref) {
    if (formKey.currentState!.validate()) {
      final kratomCalculator = ref.read(
        kratomCalculatorProvider(
          weight: weight.toDouble(),
          userStatus: userStatus,
          state: state,
        ),
      );
      showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            padding: const EdgeInsets.all(20),
            height: 200,
            child: Center(
              child: Text(
                shouldCalculateNumberOfCapsules
                    ? kratomCalculator.printDosageInfoCapsules(capsulesWeight)
                    : kratomCalculator.printDosageInfo(),
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          );
        },
      );
    }
  }
}
