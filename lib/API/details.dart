import 'package:flutter/material.dart';
import 'package:mid_practice/API/modules.dart';

class Details extends StatefulWidget {
  const Details({Key? key, required this.person, required this.posts})
      : super(key: key);
  final Person person;
  final List<Post> posts;
  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.person.name),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: widget.posts
              .map(
                (post) => PostRibbon(post: post),
              )
              .toList(),
        ),
      ),
    );
  }
}

class PostRibbon extends StatefulWidget {
  const PostRibbon({
    Key? key,
    required this.post,
  }) : super(key: key);
  final Post post;
  @override
  State<PostRibbon> createState() => _PostRibbonState();
}

class _PostRibbonState extends State<PostRibbon> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(widget.post.title),
      subtitle: Text(widget.post.body),
      trailing: InkWell(
        child: Text('${widget.post.id}'),
      ),
    );
  }
}
