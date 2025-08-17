import 'package:chat_app/components/my_drawer.dart';
import 'package:chat_app/services/auth/auth_service.dart';
import 'package:chat_app/services/chat/chat_service.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  //chat & auth services
  final ChatService _chatService = ChatService();
  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home'), centerTitle: true, elevation: 2),
      drawer: MyDrawer(),
      body: _builderUserList(),
    );
  }

  Widget _builderUserList() {
    return StreamBuilder(
      stream: _chatService.getUsersStream(),
      builder: (context, snapshot) {
        //error
        if (snapshot.hasError) {
          return const Text("Error");
        }

        //loading
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text('Loading..');
        }

        //return list view
        return ListView(
          children: snapshot.data!
              .map<Widget>((userData) => _builderUserListItem)
              .toList(),
        );
      },
    );
  }

  Widget _builderUserListItem(
    Map<String, dynamic> userData,
    BuildContext context,
  ) {
    //display all users except current user
    return UserTile();
  }
}
