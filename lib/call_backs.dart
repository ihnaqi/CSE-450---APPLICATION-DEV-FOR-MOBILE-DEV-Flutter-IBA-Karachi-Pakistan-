import 'package:flutter/material.dart';

class CallBacks extends StatefulWidget {
  const CallBacks({Key? key}) : super(key: key);

  @override
  State<CallBacks> createState() => _CallBacksState();
}

class _CallBacksState extends State<CallBacks> {
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Widget Comunication"),
      ),
      body: Center(
        child: Count(
          count: count,
          onCountChange: (int val) => setState(() => {count += val}),
          onCountSelected: () => print("Value of count is"),
        ),
      ),
    );
  }
}

class Count extends StatelessWidget {
  const Count(
      {Key? key,
      required this.count,
      required this.onCountChange,
      this.onCountSelected})
      : super(key: key);

  final int count;
  final VoidCallback? onCountSelected;
  final Function(int) onCountChange;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        IconButton(
          onPressed: () => onCountChange(1),
          icon: const Icon(
            Icons.add_circle_rounded,
            color: Colors.blueAccent,
          ),
        ),
        TextButton(
          onPressed: () => onCountSelected,
          child: Text('$count'),
        ),
        count > 0
            ? IconButton(
                onPressed: () => onCountChange(-1),
                icon: const Icon(Icons.remove_circle_rounded,
                    color: Colors.blueAccent),
              )
            : const SizedBox(),
      ],
    );
  }
}
