import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kratom_dosage_calculator/features/home/enums/kratom_state_enum.dart';
import 'package:kratom_dosage_calculator/features/home/enums/kratom_user_status_enum.dart';
import 'package:kratom_dosage_calculator/features/home/provider/kratom_calculator_provider/kratom_calculator_provider.dart';

class DosageCalcCard extends HookConsumerWidget {
  const DosageCalcCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = useState(GlobalKey<FormState>());

    final weight = useState<double>(0);
    final state = useState(KratomStateEnum.energetic);
    final userStatus = useState(KratomUserStatusEnum.newcomer);

    return Card(
      elevation: 5,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20),
        constraints: const BoxConstraints(maxWidth: 600),
        child: Form(
          key: formKey.value,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                DropdownButtonFormField<KratomUserStatusEnum>(
                  isExpanded: true,
                  value: userStatus.value,
                  decoration: const InputDecoration(
                    labelText: 'Kind of user',
                  ),
                  onChanged: (KratomUserStatusEnum? newValue) {
                    userStatus.value = newValue!;
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
                        height: 100,
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
                              weight.value = 0;
                              return;
                            }

                            weight.value = double.parse(value);
                          },
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    SizedBox(
                      height: 100,
                      width: 150,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          DropdownButtonFormField<KratomStateEnum>(
                            isExpanded: true,
                            value: state.value,
                            decoration: const InputDecoration(
                              labelText: 'State',
                            ),
                            onChanged: (KratomStateEnum? newValue) {
                              state.value = newValue!;
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
                FilledButton.tonal(
                  onPressed: () {
                    if (formKey.value.currentState!.validate()) {
                      final kratomCalculator = ref.read(
                        kratomCalculatorProvider(
                          weight: weight.value.toDouble(),
                          userStatus: userStatus.value,
                          state: state.value,
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
                                kratomCalculator.printDosageInfo(),
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
                  },
                  child: Text(
                    'Calculate',
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
