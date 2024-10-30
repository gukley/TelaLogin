import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:meu_app/services/authentication_service.dart';

class HomePage extends StatefulWidget {
  final User user;
  const HomePage({super.key, required this.user});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tela inicial'),
      ),
      drawer: Drawer(
          child: Column(children: [
        UserAccountsDrawerHeader(
            accountName: Text(widget.user.displayName != null
                ? widget.user.displayName!
                : "Não informado"),
            accountEmail: Text(widget.user.email != null
                ? widget.user.email!
                : "Não informado")),
        ListTile(
            title: Text('Deslogar'),
            leading: Icon(Icons.logout),
            onTap: () {
              AuthenticationService().logoutUser();
            })
      ])),
       floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
      
    );
  }
}
