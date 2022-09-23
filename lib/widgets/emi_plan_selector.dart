import 'package:cred/main.dart';
import 'package:cred/models/models.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

const _cardColors = [
  Color(0xFF45343e),
  Color(0xFF847b97),
  Color(0xFF58698d),
  Color(0xFF3c479a),
];

class EmiPlanSelector extends StatefulWidget {
  const EmiPlanSelector({super.key});

  @override
  State<EmiPlanSelector> createState() => _EmiPlanSelectorState();
}

class _EmiPlanSelectorState extends State<EmiPlanSelector> {
  late final ScrollController _controller;

  @override
  void initState() {
    _controller = ScrollController(keepScrollOffset: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40),
      child: SizedBox(
        height: 250,
        child: ListView(
          clipBehavior: Clip.none,
          physics: const BouncingScrollPhysics(),
          controller: _controller,
          scrollDirection: Axis.horizontal,
          children: List.generate(
            4,
            (index) => Padding(
              padding: const EdgeInsets.only(left: 20, right: 10),
              child: Stack(
                children: [
                  GestureDetector(
                    onTap: () => selectedPlanIndexNotifier.value = index,
                    child: Center(
                      child: SizedBox(
                        width: 200,
                        height: 200,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            color: _cardColors[index].withOpacity(0.7),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(20),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 4),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Flexible(
                                  flex: 2,
                                  child: ValueListenableBuilder(
                                    valueListenable: selectedPlanIndexNotifier,
                                    builder: (context, value, child) =>
                                        Container(
                                      height: 40,
                                      width: 40,
                                      margin: const EdgeInsets.only(
                                        bottom: 10,
                                        top: 50,
                                      ),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: index !=
                                                  selectedPlanIndexNotifier
                                                      .value
                                              ? Colors.white.withOpacity(0.5)
                                              : Colors.transparent,
                                          width: 2,
                                        ),
                                        color: _cardColors[index],
                                      ),
                                      child: index ==
                                              selectedPlanIndexNotifier.value
                                          ? const Icon(
                                              Icons.check_rounded,
                                              color: Colors.white,
                                            )
                                          : null,
                                    ),
                                  ),
                                ),
                                Flexible(
                                  fit: FlexFit.tight,
                                  child: RichText(
                                    text: TextSpan(
                                        text: NumberFormat.simpleCurrency(
                                          locale: 'en_IN',
                                          decimalDigits: 0,
                                        ).format(plans[index].amount),
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle1
                                            ?.copyWith(
                                                fontWeight: FontWeight.bold),
                                        children: [
                                          TextSpan(
                                            text: ' /mo\n',
                                            style: Theme.of(context)
                                                .textTheme
                                                .subtitle1,
                                          ),
                                          TextSpan(
                                            text:
                                                'for ${plans[index].months} months',
                                            style: Theme.of(context)
                                                .textTheme
                                                .caption,
                                          ),
                                        ]),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 20),
                                  child: Text(
                                    'See calculations',
                                    style: Theme.of(context).textTheme.caption,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  if (index == 1)
                    const Positioned(
                      top: 10,
                      left: 0,
                      right: 0,
                      child: FractionallySizedBox(
                        widthFactor: 0.6,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(
                              Radius.circular(40),
                            ),
                            boxShadow: [
                              BoxShadow(
                                  offset: Offset(0, 8),
                                  spreadRadius: 6,
                                  blurRadius: 6,
                                  color: Colors.black12)
                            ],
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'recommended',
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
