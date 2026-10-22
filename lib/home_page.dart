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
      // ==================== APP BAR ====================
      appBar: AppBar(
        title: const Text('Ma Garderie'),
        actions: [
          // Recherche
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

          // Notifications
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

      // ==================== DRAWER ====================
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              child: Text(
                'Ma Garderie',
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
            ),

            // Accueil
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Accueil'),
              onTap: () {
                Navigator.pop(context);

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Accueil sélectionné'),
                  ),
                );
              },
            ),

            // Menus
            ListTile(
              leading: const Icon(Icons.restaurant_menu),
              title: const Text('Menus'),
              onTap: () {
                Navigator.pop(context);

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Menus sélectionné'),
                  ),
                );
              },
            ),

            // À propos
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text('À propos'),
              onTap: () {
                Navigator.pop(context);

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('À propos sélectionné'),
                  ),
                );
              },
            ),
          ],
        ),
      ),

      // ==================== BODY ====================
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

            // Liste des menus
            Expanded(
              child: ListView.builder(
                itemCount: menus.length,
                itemBuilder: (context, index) {
                  final menu = menus[index];

                  return Card(
                    margin: const EdgeInsets.only(
                      bottom: 12,
                    ),
                    child: ListTile(
                      leading: Text(
                        menu['icone'],
                        style: const TextStyle(
                          fontSize: 35,
                        ),
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

                      // Click sur un menu
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'Menu sélectionné : ${menu['titre']}',
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),

      // ==================== FAB ====================
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