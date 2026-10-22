import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  final List<Map<String, dynamic>> menus = const [
    {
      'titre': 'Petit déjeuner',
      'description': 'Lait, céréales et fruits',
      'icone': '🥣',
    },
    {
      'titre': 'Déjeuner',
      'description': 'Poulet, riz et légumes',
      'icone': '🍲',
    },
    {
      'titre': 'Goûter',
      'description': 'Biscuit et compote de pomme',
      'icone': '🍪',
    },
    {
      'titre': 'Jus de fruits',
      'description': 'Jus d’orange naturel',
      'icone': '🍊',
    },
    {
      'titre': 'Fruits frais',
      'description': 'Une sélection de fruits de saison',
      'icone': '🍎',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ma Garderie'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Rechercher un menu'),
                ),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Aucune notification'),
                ),
              );
            },
          ),
        ],
      ),

      // Drawer
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              child: Text(
                'Ma Garderie',
                style: TextStyle(fontSize: 24),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Accueil'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.restaurant_menu),
              title: const Text('Menus'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text('À propos'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),

      // Contenu
     body: Padding(
  padding: const EdgeInsets.all(16),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Text(
        'Menus du jour',
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),

      const SizedBox(height: 16),

      Expanded(
        child: ListView.builder(
          itemCount: menus.length,
          itemBuilder: (context, index) {
            final menu = menus[index];

            return Card(
              margin: const EdgeInsets.only(bottom: 12),
              child: ListTile(
                leading: Text(
                  menu['icone'],
                  style: const TextStyle(fontSize: 35),
                ),
                title: Text(
                  menu['titre'],
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  menu['description'],
                ),
              ),
            );
          },
        ),
      ),
    ],
  ),
),

      // Bouton Ajouter
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Ajouter un menu'),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
