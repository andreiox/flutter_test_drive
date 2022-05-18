import 'package:flutter/material.dart';
import 'package:flutter_test_drive/http/users.dart';

class Users extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: fetchUsers(),
      builder: (
        BuildContext context,
        AsyncSnapshot<List<dynamic>> snapshot,
      ) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Getting user list via http'),
          ),
          body: _makeUsersList(snapshot),
        );
      },
    );
  }

  _makeUsersList(AsyncSnapshot<List<dynamic>> snapshot) {
    switch (snapshot.connectionState) {
      case ConnectionState.waiting:
        return Center(child: CircularProgressIndicator());
      case ConnectionState.done:
        return _displayUsers(snapshot.data!);
      default:
        return Text('I dont fuckin know');
    }
  }

  _displayUsers(List<dynamic> users) {
    return ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          final user = users[index];
          return Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(user['name']),
              ),
              Text(user['email']),
            ],
          );
        });
  }
}
