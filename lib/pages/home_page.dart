import 'package:chatsy/components/user_tile.dart';
import 'package:chatsy/pages/chat_page.dart';
import 'package:chatsy/providers/get_user_provider.dart';
import 'package:chatsy/services/auth_services.dart';
import 'package:chatsy/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timestamp) {
      Provider.of<GetUserProvider>(context, listen: false).prepareAllUsers();
    });
  }

  void onTap(uid, email) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ChatPage(uid: uid, email:email ),
      ),
    );
  }

  final Auth _auth = Auth();

  @override
  Widget build(BuildContext context) {

    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        leading: Icon(Icons.menu),
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Icon(Icons.chat),
            SizedBox(
              width: 12,
            ),
            Text("Chatsy")
          ],
        ),
        actions: [
          IconButton(
              onPressed: () async {
                await _auth.logOut();
              },
              icon: Icon(Icons.logout)),
          IconButton(
              onPressed: () async {
                Provider.of<GetUserProvider>(context, listen: false)
                    .prepareAllUsers();
              },
              icon: Icon(Icons.download))
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          children: [
            buildWelcomeText(context, _auth),
            SizedBox(
              height: 8,
            ),
            Consumer<GetUserProvider>(
              builder: (context, userProvider, child) {
                return Expanded(
                  child: ListView.builder(
                    itemCount: userProvider.allUsers.length,
                    itemBuilder: (context, index) {
                      return UserTile(
                        userEmail: userProvider.allUsers[index]!['email'],
                        onTap: () {
                          onTap(userProvider.allUsers[index]!['uid'], userProvider.allUsers[index]!['email']);
                        },
                      );
                    },
                  ),
                );
              },
            )
          ],
        ),
      ),
    ));
  }
}
