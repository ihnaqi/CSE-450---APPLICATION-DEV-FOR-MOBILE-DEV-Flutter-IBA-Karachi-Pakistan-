import 'package:flutter/material.dart';

class AssignmentI extends StatefulWidget {
  const AssignmentI({Key? key}) : super(key: key);

  @override
  State<AssignmentI> createState() => _AssignmentIState();
}

class _AssignmentIState extends State<AssignmentI> {
  List<User> users = [
    User(name: "Apple.com", email: "apple@apple.com", isActive: false),
    User(name: "Facebook", email: "facebook@facebook.com", isActive: true),
    User(name: "Meta", email: "meta@meta.com", isActive: false),
    User(name: "Google", email: "google@gmail.com", isActive: true),
    User(name: "Oracle", email: "oracle@oracle.com", isActive: false)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Users List "),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: users
                    .map(
                      (user) => Ribbon(
                          title: user.name,
                          subtitle: user.email,
                          isActive: user.isActive,
                          onTap: () {
                            setState(() {
                              user.isActive = !user.isActive;
                            });
                          }),
                    )
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class User {
  final String name;
  final String email;
  bool isActive;

  User({required this.name, required this.email, required this.isActive});
}

class Ribbon extends StatefulWidget {
  const Ribbon(
      {Key? key,
      required this.title,
      required this.subtitle,
      required this.isActive,
      required this.onTap})
      : super(key: key);

  final String title;
  final String subtitle;
  final bool isActive;
  final VoidCallback onTap;
  @override
  State<Ribbon> createState() => _RibbonState();
}

class _RibbonState extends State<Ribbon> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: widget.isActive ? Colors.green : Colors.red,
      leading: CircleAvatar(
        backgroundColor: widget.isActive ? Colors.blue : Colors.orange,
        child: Text(
          widget.title[0].toUpperCase(),
        ),
      ),
      title: Text(widget.title),
      subtitle: Text(widget.subtitle),
      trailing: InkWell(
        onTap: widget.onTap,
        child: Icon(
          Icons.favorite,
          color: widget.isActive ? Colors.red : Colors.grey,
        ),
      ),
    );
  }
}
