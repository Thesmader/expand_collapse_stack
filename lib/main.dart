import 'package:cred/column_widgets.dart';
import 'package:cred/widgets/widgets.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const CredAssignmentApp());
}

const curve = Curves.easeIn;

final selectedPlanIndexNotifier = ValueNotifier(0);
final progressValueNotifier = ValueNotifier<double>(30);

const buttonTitleData = [
  'Proceed to EMI selection',
  'Select your bank account',
  'Tap for 1-click KYC',
  'Fourth'
];

class CredAssignmentApp extends StatelessWidget {
  const CredAssignmentApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cred Assignment',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: const Color(0xFF11141A),
        brightness: Brightness.dark,
      ),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Scaffold(
        body: ExpandCollapseChildStack(
          children: List.generate(
            4,
            (index) => Padding(
              padding: const EdgeInsets.only(top: 60),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: columnWidgetsList[index],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
