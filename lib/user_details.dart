import 'package:flutter/material.dart';

import 'users_list.dart';

class UserDetails extends StatelessWidget {
  const UserDetails({
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
    return Scaffold(
      appBar: AppBar(
        title: Text('${user.name} details'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            const Image(
              image: NetworkImage(
                  "https://static.vecteezy.com/system/resources/previews/002/318/271/original/user-profile-icon-free-vector.jpg"),
              height: 200,
              width: 200,
            ),
            // ignore: prefer_const_constructors
            ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.grey,
                child: Text(
                  user.name[0].toUpperCase(),
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
            ),
            Center(
              child: TextButton(
                child: Text(
                  user.bio,
                  style:
                      const TextStyle(color: Color.fromARGB(221, 30, 28, 28)),
                ),
                onPressed: () async {
                  final res = await Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => EditDetails(user: user),
                    ),
                  );
                  Navigator.of(context).pop(res);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class EditDetails extends StatefulWidget {
  EditDetails({
    Key? key,
    required this.user,
  }) : super(key: key);
  final User user;

  @override
  State<EditDetails> createState() => _EditDetailsState();
}

class _EditDetailsState extends State<EditDetails> {
  TextEditingController bioController = TextEditingController();

  @override
  void initState() {
    super.initState();
    bioController.text = widget.user.bio;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: bioController,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(
                  User(
                    name: widget.user.name,
                    email: widget.user.email,
                    bio: bioController.text,
                    isFav: widget.user.isFav,
                  ),
                );
              },
              child: const Icon(Icons.arrow_back),
            )
          ],
        ),
      ),
    );
  }
}
