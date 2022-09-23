import 'package:cred/main.dart';
import 'package:cred/models/models.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

const _kDuration = Duration(milliseconds: 200);

class ExpandCollapseChildStack extends StatefulWidget {
  const ExpandCollapseChildStack({super.key, required this.children});

  final List<Widget> children;

  @override
  State<ExpandCollapseChildStack> createState() =>
      _ExpandCollapseChildStackState();
}

class _ExpandCollapseChildStackState extends State<ExpandCollapseChildStack> {
  int step = 0;

  incrementStep() => setState(() {
        if (step < widget.children.length - 2) step++;
      });
  decrementStep() => setState(() {
        if (step > 0) step--;
      });

  @override
  void dispose() {
    progressValueNotifier.dispose();
    selectedPlanIndexNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final amount = (progressValueNotifier.value.round() * 5000).toInt();
    return WillPopScope(
      onWillPop: () {
        decrementStep();
        return Future.value(false);
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 100),
        child: LayoutBuilder(builder: (context, constraints) {
          return Stack(
            children: List.generate(
              widget.children.length,
              (index) => AnimatedPositioned(
                duration: _kDuration,
                curve: curve,
                top: index > step
                    ? constraints.maxHeight * 0.9
                    : constraints.maxHeight * (index + 1) * 0.1,
                left: 0,
                right: 0,
                bottom: 0,
                child: GestureDetector(
                  onTap: index > step ? incrementStep : null,
                  child: index < step + 1
                      ? Container(
                          decoration: BoxDecoration(
                            color: const Color(0xFF161922),
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(24),
                              topRight: Radius.circular(24),
                            ),
                            boxShadow: [
                              if (index > 0 && index <= step)
                                const BoxShadow(
                                  offset: Offset(0, -10),
                                  spreadRadius: 10,
                                  color: Colors.black12,
                                  blurRadius: 20,
                                ),
                              if (index == step)
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.3),
                                  spreadRadius: 800,
                                )
                            ],
                          ),
                          child: Column(
                            children: [
                              if (index <= step - 1)
                                ListTile(
                                  onTap: () => setState(() {
                                    step = index;
                                  }),
                                  title: index == 0
                                      ? const Text('credit amount')
                                      : Row(
                                          children: [
                                            Expanded(
                                              child: Text(
                                                'EMI',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodySmall,
                                              ),
                                            ),
                                            Expanded(
                                              child: Text(
                                                'duration',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodySmall,
                                              ),
                                            )
                                          ],
                                        ),
                                  subtitle: index == 0
                                      ? Text(NumberFormat.simpleCurrency(
                                          locale: 'en_IN',
                                          decimalDigits: 0,
                                        ).format(amount))
                                      : Padding(
                                          padding:
                                              const EdgeInsets.only(top: 15),
                                          child: Row(
                                            children: [
                                              Expanded(
                                                child: Text(
                                                    '${NumberFormat.simpleCurrency(locale: 'en_IN', decimalDigits: 0).format(plans[selectedPlanIndexNotifier.value].amount)} /mo'),
                                              ),
                                              Expanded(
                                                child: Text(
                                                  '${plans[selectedPlanIndexNotifier.value].months} months',
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                  trailing:
                                      const Icon(Icons.keyboard_arrow_down),
                                ),
                              Expanded(
                                flex: 1,
                                child: AnimatedSwitcher(
                                  duration: _kDuration,
                                  switchInCurve: curve,
                                  switchOutCurve: curve,
                                  child: index == step
                                      ? widget.children[index]
                                      : const SizedBox(),
                                ),
                              ),
                            ],
                          ),
                        )
                      : CollapsedUI(step: step),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}

class CollapsedUI extends StatelessWidget {
  const CollapsedUI({
    Key? key,
    required this.step,
  }) : super(key: key);

  final int step;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        color: Color(0xFF3C479B),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      child: Center(
        child: Text(
          buttonTitleData[step],
        ),
      ),
    );
  }
}
