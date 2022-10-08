import 'package:flutter/material.dart';

class BonusAssignment extends StatefulWidget {
  const BonusAssignment({Key? key}) : super(key: key);

  @override
  State<BonusAssignment> createState() => _BonusAssignmentState();
}

class _BonusAssignmentState extends State<BonusAssignment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bonus Assignemt"),
      ),
    );
  }
}
