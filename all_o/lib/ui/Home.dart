import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All\'O'),
        backgroundColor: Colors.deepPurple, // Couleur de la barre d'appBar
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.purple[100]!, Colors.purple[200]!], // Dégradé de couleurs pastel violet
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.shopping_cart,
              size: 80.0,
              color: Colors.purple[700], // Couleur de l'icône
            ),
            SizedBox(height: 20.0),
            Text(
              'Bienvenue sur All\'O',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Colors.purple[800], // Couleur du texte
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                // Action à exécuter lorsque le bouton est pressé
              },
              child: Text(
                'Commencer',
                style: TextStyle(color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.purple[700], // Couleur de fond du bouton
              ),
            ),
          ],
        ),
      ),
    );
  }
}
