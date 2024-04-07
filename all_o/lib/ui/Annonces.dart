import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../userHelper.dart';

final supabase = Supabase.instance.client;

class Annonces extends StatelessWidget {
  const Annonces({Key? key}) : super(key: key);

  Future <List<Map<String, dynamic>>> _getAnnonces() async {
    final annonces = await supabase.from("Annonce").select();
    return annonces;
  }

  Future <Map<String, dynamic>> _getProduitById(int idProduit) async {
    final produit = await supabase.from("Produit").select().eq('idP', idProduit);
    return produit[0];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Annonces',
          style: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: _getAnnonces(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          }
          final annonces = snapshot.data!;
          return ListView.builder(
            itemCount: annonces.length,
            itemBuilder: (context, index) {
              final annonce = annonces[index];
              return Container(
                margin: const EdgeInsets.all(10.0),
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('ID: ${annonce['idA']}'),
                    Text('ID Produit: ${annonce['idP']}'),
                    Text('Date début: ${annonce['date_debut']}'),
                    Text('Date fin: ${annonce['date_fin']}'),
                    Text('État: ${annonce['statut']}'),
                    Text('ID Utilisateur: ${annonce['idU']}'),
                    ],

                ),
              );
            },
          );
        },
      ),
    );
  }
}
