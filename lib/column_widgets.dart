import 'package:cred/widgets/widgets.dart';
import 'package:flutter/material.dart';

const headerTextStyle = TextStyle(
  fontSize: 20,
  letterSpacing: 0.8,
);
final subheaderTextStyle = TextStyle(fontSize: 14, color: Colors.grey.shade600);

const subheaderPadding = EdgeInsets.symmetric(horizontal: 20, vertical: 6);
final columnWidgetsList = [
  [
    const Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Text(
        'nikunj, how much do you need?',
        style: headerTextStyle,
      ),
    ),
    Padding(
      padding: subheaderPadding,
      child: Text(
        'move the dial and set any amount you need upto ₹5,00,000',
        style: subheaderTextStyle,
      ),
    ),
    Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        child: SizedBox(
          height: 400,
          width: 350,
          child: DecoratedBox(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(24),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: const [
                  AmountSlider(),
                  Text(
                    'stash is instant. money will be credited within seconds.',
                    style: TextStyle(
                      color: Colors.blueGrey,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    ),
  ],
  [
    const Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Text('how do you wish to repay?', style: headerTextStyle),
    ),
    Padding(
      padding: subheaderPadding,
      child: Text(
        'choose one of our recommended plans to make your own',
        style: subheaderTextStyle,
      ),
    ),
    const EmiPlanSelector(),
    const CredOutlineButton(
      title: 'Create your own plan',
    ),
  ],
  <Widget>[
    const Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Text('where should we send the money?', style: headerTextStyle),
    ),
    Padding(
      padding: subheaderPadding,
      child: Text(
        'amount will be credited to this bank account, EMI will also be debited from the bank account',
        style: subheaderTextStyle,
      ),
    ),
    Padding(
      padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
      child: Row(
        children: [
          Image.asset(
            'assets/hdfc.jpeg',
            width: 50,
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text('HDFC Bank'),
                Text('50100117009192'),
              ],
            ),
          ),
          const Spacer(),
          const DecoratedBox(
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: Color(0xFF3C4050)),
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Icon(
                Icons.check_rounded,
                color: Color(0xFFBAA9B1),
              ),
            ),
          ),
        ],
      ),
    ),
    const CredOutlineButton(title: 'Change account')
  ],
  <Widget>[],
].cast<List<Widget>>();
