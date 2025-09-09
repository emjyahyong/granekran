import 'package:flutter/material.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      actions: [
        TextButton(
          child: const Text("TOUS"),
          onPressed: () {
            print('TOUS cliqué');
          },
        ),
        TextButton(
          child: const Text("WESTERN"),
          onPressed: () {
            print('WESTERN cliqué');
          },
        ),
        TextButton(
          child: const Text("HORREUR"),
          onPressed: () {
            print('HORREUR cliqué');
          },
        ),
        TextButton(
          child: const Text("COMÉDIE"),
          onPressed: () {
            print('COMÉDIE cliqué');
          },
        ),
      ],
    ),
    body: Center(
      child: ListView(
        children: [
          ListTile(
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                'assets/images/téléchargement.webp',
                width: 150,
                height: 150,
                fit: BoxFit.cover,
              ),
            ),
            title: const Text('Description du film 1'),
          ),
          ListTile(
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                'assets/images/téléchargement.webp',
                width: 150,
                height: 150,
                fit: BoxFit.cover,
              ),
            ),
            title: const Text('Description du film 2'),
          ),
          ListTile(
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                'assets/images/téléchargement.webp',
                width: 150,
                height: 150,
                fit: BoxFit.cover,
              ),
            ),
            title: const Text('Description du film 3'),
          ),
        ],
      ),
    ),
    bottomNavigationBar: BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Accueil"),
        BottomNavigationBarItem(icon: Icon(Icons.search), label: "Recherche"),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profil"),
      ],
    ),
  );
}


  // Exemple simple d'une page d'accueil
  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       title: const Text("GranEkran"),
  //       leading: IconButton(
  //         icon: const Icon(Icons.menu),
  //         onPressed: () {
  //           print('Menu cliqué');
  //         },
  //       ),
  //       actions: [
  //         IconButton(
  //           icon: const Icon(Icons.search),
  //           onPressed: () {
  //             print('Recherche');
  //           },
  //         ),
  //       ],
  //     ),
  //     body: Center(
  //       child: Container(
  //         width: 200,
  //         height: 200,
  //         decoration: const BoxDecoration(
  //           borderRadius: BorderRadius.all(Radius.circular(12)),
  //           color: Color.fromARGB(255, 220, 0, 0), // ajouté pour visualiser le container
  //           boxShadow: [
  //             BoxShadow(
  //               color: Colors.black26,
  //               blurRadius: 8,
  //               offset: Offset(0, 4),
  //             ),
  //           ],
  //         ),
  //         child: Image.asset(
  //           'assets/images/téléchargement.webp',
  //           width: 200,
  //           height: 200,
  //           fit: BoxFit.cover,
  //         ),
  //       ),
  //     ),
  //   );
  // }

  // Exemple simple d'une page d'accueil avec Stack
  // @override
  // Widget build(BuildContext context) {
  //   return Stack(
  //     children: [
  //       Container(
  //         decoration: const BoxDecoration(
  //           image: DecorationImage(
  //             image: AssetImage('assets/images/téléchargement.webp'),
  //             fit: BoxFit.cover,
  //           ),
  //         ),
  //       ),
  //       Scaffold(
  //         backgroundColor: Colors.transparent,
  //         appBar: AppBar(
  //           title: const Text("GranEkran"),
  //           backgroundColor: Colors.black54,
  //           leading: IconButton(
  //             icon: const Icon(Icons.menu),
  //             onPressed: () {
  //               print('Menu cliqué');
  //             },
  //           ),
  //           actions: [
  //             IconButton(
  //               icon: const Icon(Icons.search),
  //               onPressed: () {
  //                 print('Recherche');
  //               },
  //             ),
  //           ],
  //         ),
  //         body: Center(
  //           child: Container(
  //             padding: const EdgeInsets.all(16.0),
  //             decoration: BoxDecoration(
  //               color: Colors.black54,
  //               borderRadius: BorderRadius.circular(12),
  //             ),
  //             child: const Text(
  //               'Bienvenue sur GranEkran',
  //               style: TextStyle(
  //                 color: Colors.white,
  //                 fontSize: 24,
  //                 fontWeight: FontWeight.bold,
  //               ),
  //             ),
  //           ),
  //         ),
  //       ),
  //     ],
  //   );
  // }

  // Exemple simple d'une page d'accueil avec Expanded
  // @override
  // Widget build(BuildContext context) {
  //   return Row(
  //     children: [
  //       Expanded(
  //         child: Container(
  //           color: Colors.red,
  //           child: const Center(
  //             child: Text(
  //               'Gauche',
  //               style: TextStyle(color: Colors.white, fontSize: 24),
  //             ),
  //           ),
  //         ),
  //       ),
  //       Expanded(
  //         child: Container(
  //           color: Colors.blue,
  //           child: const Center(
  //             child: Text(
  //               'Droite',
  //               style: TextStyle(color: Colors.white, fontSize: 24),
  //             ),
  //           ),
  //         ),
  //       ),
  //     ],
  //   );
  // }

  // Exemple simple d'une page d'accueil avec ListView
  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       title: Text('Liste des films'),
  //     ),
  //     body: ListView(
  //       children: [
  //         ListTile(
  //           title: Text('Film 1'),
  //         )
  //       ],
  //     ),
  //   );
  // }

}
