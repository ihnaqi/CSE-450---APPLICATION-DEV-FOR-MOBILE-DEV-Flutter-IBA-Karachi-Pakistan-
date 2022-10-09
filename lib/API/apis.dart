import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mid_practice/API/details.dart';
import 'package:mid_practice/API/modules.dart';
import 'package:http/http.dart' as http;

class APIs extends StatefulWidget {
  const APIs({Key? key}) : super(key: key);

  @override
  State<APIs> createState() => _APIsState();
}

class _APIsState extends State<APIs> {
  List<Person> persons = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("APIs in dart"),
      ),
      body: Column(
        children: persons
            .map(
              (person) => Ribbon(
                person: person,
              ),
            )
            .toList(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          var url = Uri.parse("http://jsonplaceholder.typicode.com/users");
          final response = await http.get(url);
          var dt = jsonDecode(response.body) as List;
          setState(() {});
          persons = dt
              .map(
                (e) => Person.fromJson(e),
              )
              .toList();
        },
        tooltip: 'Load Data',
        child: const Icon(Icons.view_agenda),
      ),
    );
  }
}

class Ribbon extends StatefulWidget {
  const Ribbon({
    Key? key,
    required this.person,
  }) : super(key: key);
  final Person person;
  @override
  State<Ribbon> createState() => _RibbonState();
}

class _RibbonState extends State<Ribbon> {
  List<dynamic> posts = [];
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.grey,
        child: Text(
          widget.person.name[0].toUpperCase(),
        ),
      ),
      title: GestureDetector(
        onTap: () async {
          var url = Uri.parse("http://jsonplaceholder.typicode.com/posts");
          var response = await http.get(url);
          var list = jsonDecode(response.body) as List;
          setState(() {});
          posts = list.map((e) => Post.fromJson(e)).toList();
          List<Post> filteredPost = [];
          for (Post p in posts) {
            if (p.userId == widget.person.id) {
              filteredPost.add(p);
            }
          }

          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => Details(
                person: widget.person,
                posts: filteredPost,
              ),
            ),
          );
        },
        child: Text(widget.person.name),
      ),
      subtitle: Text(widget.person.website),
      trailing: InkWell(
        child: Column(
          children: [
            const Icon(
              Icons.location_on,
              color: Colors.blueGrey,
            ),
            Text(
              "lat: ${widget.person.address.geo.lat}, lng: ${widget.person.address.geo.lng}",
              style: const TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
