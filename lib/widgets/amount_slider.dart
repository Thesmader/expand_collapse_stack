import 'package:cred/main.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class AmountSlider extends StatefulWidget {
  const AmountSlider({
    Key? key,
  }) : super(key: key);

  @override
  State<AmountSlider> createState() => _AmountSliderState();
}

class _AmountSliderState extends State<AmountSlider> {
  double max = 100;
  double multiplier = 5000;
  // double value = 30;

  @override
  Widget build(BuildContext context) {
    final amount = (progressValueNotifier.value.round() * multiplier).toInt();
    return SfRadialGauge(
      axes: [
        RadialAxis(
          radiusFactor: 0.9,
          axisLineStyle: const AxisLineStyle(thickness: 8),
          startAngle: 270,
          endAngle: 270,
          minimum: 0,
          maximum: max.toDouble(),
          showLabels: false,
          showTicks: false,
          annotations: [
            GaugeAnnotation(
              widget: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'credit amount',
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.copyWith(color: Colors.grey.shade600),
                  ),
                  Text(
                    NumberFormat.simpleCurrency(
                      locale: 'en_IN',
                      decimalDigits: 0,
                    ).format(amount),
                    style: Theme.of(context).textTheme.headline5?.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                  Text(
                    '@1.04% monthly',
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.copyWith(color: Colors.green.shade300),
                  ),
                ],
              ),
            )
          ],
          pointers: [
            MarkerPointer(
              value: progressValueNotifier.value.toDouble(),
              enableDragging: true,
              markerType: MarkerType.image,
              imageUrl: 'assets/slider_knob.png',
              markerHeight: 40,
              markerWidth: 40,
              color: Colors.brown.shade700,
              onValueChanged: (value) => setState(() {
                progressValueNotifier.value = value;
              }),
              onValueChangeEnd: (value) => setState(() {
                progressValueNotifier.value = value;
              }),
              onValueChanging: (args) {
                if ((args.value - progressValueNotifier.value).abs() > 10) {
                  args.cancel = true;
                }
              },
            )
          ],
          ranges: [
            GaugeRange(
              startValue: 0,
              endValue: max.toDouble(),
              color: const Color(0xFFFCEADF),
            ),
            GaugeRange(
              startValue: 0,
              endValue: progressValueNotifier.value,
              color: const Color(0xFFD28A72),
            )
          ],
        ),
      ],
    );
  }
}
