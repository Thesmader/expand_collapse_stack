import 'package:flutter/material.dart';

class CredOutlineButton extends StatelessWidget {
  const CredOutlineButton({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, top: 20),
      child: OutlinedButton(
        onPressed: () {},
        style: OutlinedButton.styleFrom(
          backgroundColor: Colors.transparent,
          foregroundColor: const Color(0xFF56656d),
          shape: const StadiumBorder(),
          side: const BorderSide(color: Color(0xFF56656d)),
        ),
        child: Text(title),
      ),
    );
  }
}
