import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ScaffoldWithNavBar extends StatelessWidget {
  final Widget child;

  const ScaffoldWithNavBar({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // Désactiver le bouton de retour
      ),
      body: child,
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Accueil",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.production_quantity_limits),
            label: "Produits",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.announcement),
            label: "Annonces",
          ),
        ],
        currentIndex: _calculatorSelectedIndex(context),
        onTap: (int index) => _onItemTapped(index, context),
      ),

    );
  }

  static int _calculatorSelectedIndex(BuildContext context) {
    final String location = GoRouterState
        .of(context)
        .uri
        .toString();
    if (location.startsWith("/home/Accueil")) {
      return 0;
    }
    if (location.startsWith("/home/Produits"))  {
      return 1;
    }
    if (location.startsWith("/home/Annonces")){
      return 2;
    }
    return 0;
  }

  void _onItemTapped(int index, BuildContext context) {
    switch (index) {
      case 0:
        GoRouter.of(context).go("/home/Accueil");
        break;
      case 1:
        GoRouter.of(context).go("/home/Produits");
        break;
      case 2:
        GoRouter.of(context).go("/home/Annonces");
    }
  }
}