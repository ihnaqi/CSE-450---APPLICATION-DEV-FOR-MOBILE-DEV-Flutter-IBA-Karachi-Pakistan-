import 'package:flutter/material.dart';

class AssignmentII extends StatefulWidget {
  const AssignmentII({Key? key}) : super(key: key);

  @override
  State<AssignmentII> createState() => _AssignmentIIState();
}

class _AssignmentIIState extends State<AssignmentII> {
  List<User> users = [
    User(
        name: "Facebook",
        email: "facebook@facebook.com",
        imageURL:
            "https://farm3.staticflickr.com/2936/14765026726_b8a02d3989.jpg",
        isFav: true,
        views: 15200),
    User(
        name: "Google",
        email: "google@google.com",
        imageURL:
            "https://assets.thehansindia.com/h-upload/feeds/2019/04/19/166102-bliss.jpg",
        isFav: false,
        views: 2000),
    User(
        name: "Apple",
        email: "apple@apple.com",
        imageURL:
            "https://cdn.pixabay.com/photo/2013/08/09/05/54/layer-170971__480.jpg",
        isFav: true,
        views: 3500),
    User(
        name: "Meta",
        email: "meta@meta.com",
        imageURL:
            "https://cdn.pixabay.com/photo/2012/08/27/14/19/mountains-55067__340.png",
        isFav: false,
        views: 1400),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("Assiment II"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: users
              .map(
                (user) => MyCard(
                  title: user.name,
                  subtitle: user.email,
                  imageURL: user.imageURL,
                  views: user.views,
                  isFav: user.isFav,
                  onTap: () {
                    setState(
                      () {
                        user.isFav = !user.isFav;
                      },
                    );
                  },
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
  final String imageURL;
  bool isFav;
  final int views;

  User(
      {required this.name,
      required this.email,
      required this.imageURL,
      required this.isFav,
      required this.views});
}

class MyCard extends StatefulWidget {
  const MyCard(
      {Key? key,
      required this.title,
      required this.subtitle,
      required this.imageURL,
      required this.views,
      required this.isFav,
      required this.onTap})
      : super(key: key);

  final String title;
  final String subtitle;
  final String imageURL;
  final VoidCallback onTap;
  final int views;
  final bool isFav;

  @override
  State<MyCard> createState() => _MyCardState();
}

class _MyCardState extends State<MyCard> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        elevation: 4,
        child: Column(
          children: [
            Image(
              image: NetworkImage(widget.imageURL),
            ),
            ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.grey,
                child: Text(
                  widget.title[0].toUpperCase(),
                ),
              ),
              title: Text(widget.title),
              subtitle: Text(widget.subtitle),
              trailing: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: widget.onTap,
                    child: Icon(
                      Icons.favorite,
                      color: widget.isFav ? Colors.red : Colors.grey,
                    ),
                  ),
                  SizedBox(
                    width: 80,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const Icon(Icons.visibility),
                        Text(widget.views.toString()),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
