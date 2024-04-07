import 'package:flutter/material.dart';
import '../userHelper.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (loggedInUser != null) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Profil'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('ID: ${loggedInUser!.id}'),
              Text('Email: ${loggedInUser!.email}'),
            ],
          ),
        ),
      );
    } else {
      // Si l'utilisateur n'est pas connecté, vous pouvez rediriger vers une autre page ou afficher un message d'erreur
      return Scaffold(
        body: Center(
          child: Text('Utilisateur non connecté'),
        ),
      );
    }
  }
}