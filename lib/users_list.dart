import 'package:flutter/material.dart';
import 'package:mid_practice/user_details.dart';

class UserList extends StatefulWidget {
  const UserList({Key? key}) : super(key: key);

  @override
  State<UserList> createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  List<User> users = [
    User(
        name: "Apple",
        email: "apple@apple.com",
        bio: "Apple is a good company",
        isFav: true),
    User(
        name: "Airbnb",
        email: "airbnb@airbnb.com",
        bio: "Airbnb if my Fav",
        isFav: true),
    User(
        name: "Facebook",
        email: "facebook@facebook.com",
        bio: "Facebook is on of the widely use social network",
        isFav: false),
    User(
        name: "Google",
        email: "google@gmail.com",
        bio: "Google is world's famous search engine",
        isFav: true),
    User(
        name: "Amazon",
        email: "amazon@amazon.com",
        bio: "World's leading ecommerece website",
        isFav: true),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("List of Users"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: users
              .map(
                (user) => Ribbon(
                  user: user,
                  onChange: (bool val) => setState(() => {user.isFav = val}),
                  onBioChange: (String val) => setState(() => {user.bio = val}),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}

class User {
  final String name;
  final String email;
  String bio;
  bool isFav;

  User({
    required this.name,
    required this.email,
    required this.bio,
    required this.isFav,
  });
}

class Ribbon extends StatelessWidget {
  const Ribbon({
    Key? key,
    required this.user,
    required this.onChange,
    required this.onBioChange,
  }) : super(key: key);

  final User user;
  final Function(bool) onChange;
  final Function(String) onBioChange;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: GestureDetector(
        onTap: () async {
          final res = await Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => UserDetails(
                user: user,
                onChange: (bool val) => {
                  onChange(val),
                },
                onBioChange: (String val) => {
                  onBioChange(val),
                },
              ),
            ),
          );
        },
        child: CircleAvatar(
          backgroundColor: Colors.grey,
          child: Text(user.name[0].toUpperCase()),
        ),
      ),
      title: Text(user.name),
      subtitle: Text(user.email),
      trailing: InkWell(
        onTap: () => onChange(!user.isFav),
        child: Icon(
          Icons.favorite,
          color: user.isFav ? Colors.red : Colors.grey,
        ),
      ),
    );
  }
}
