import 'package:flutter/material.dart';
import 'package:granekran/widgets/MovieCard.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:granekran/models/Movie.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Movie> movies = [];
  bool isLoading = true;

  static const String _apiKey = '20a699fb69b82aaac4aca9f0179e8594';
  static const String _baseUrl = 'https://api.themoviedb.org/3';

  @override
  void initState() {
    super.initState();
    fetchMovies();
  }

  Future<void> fetchMovies() async {
    final response = await http.get(
      Uri.parse('$_baseUrl/movie/popular?api_key=$_apiKey&language=fr-FR&page=1'),
    );

    if (response.statusCode == 200) {
      final List results = json.decode(response.body)['results'];
      setState(() {
        movies = results.map((json) => Movie.fromJson(json)).toList();
        isLoading = false;
      });
    } else {
      // Gestion simple d'erreur
      setState(() => isLoading = false);
      print('Erreur lors du chargement des films : ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("MOVIES"),
        centerTitle: true,
        backgroundColor: Colors.purple,
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: movies.length,
              itemBuilder: (context, index) {
                final movie = movies[index];
                return Column(
                  children: [
                    MovieCard(
                      title: movie.title,
                      description: movie.overview,
                      imageUrl: 'https://image.tmdb.org/t/p/w500${movie.posterPath}',
                    ),
                    const SizedBox(height: 10),
                    const Divider(height: 20, thickness: 2, color: Colors.white),
                  ],
                );
              },
            ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.purple,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.movie), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ""),
        ],
      ),
    );
  }
}


//   @override
// Widget build(BuildContext context) {
//   return Scaffold(
//     appBar: AppBar(
//       actions: [
//         TextButton(
//           child: const Text("TOUS"),
//           onPressed: () {
//             print('TOUS cliqué');
//           },
//         ),
//         TextButton(
//           child: const Text("WESTERN"),
//           onPressed: () {
//             print('WESTERN cliqué');
//           },
//         ),
//         TextButton(
//           child: const Text("HORREUR"),
//           onPressed: () {
//             print('HORREUR cliqué');
//           },
//         ),
//         TextButton(
//           child: const Text("COMÉDIE"),
//           onPressed: () {
//             print('COMÉDIE cliqué');
//           },
//         ),
//       ],
//     ),
//     body: Center(
//     child: Container(
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Image.asset(
//             'assets/images/téléchargement.webp',
//             width: 300,
//             height: 200,
//             fit: BoxFit.cover,
//           ),
//           SizedBox(height: 10), 
//           // Espacement entre les ListTile
//           Expanded(
//             child: ListView(
//               children: [
//                 ListTile(
//                   leading: ClipRRect(
//                     borderRadius: BorderRadius.circular(8),
//                     child: Image.asset(
//                       'assets/images/téléchargement.webp',
//                       width: 150,
//                       height: 150,
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                   title: const Text('Description du film 1'),
//                 ),
//                 SizedBox(height: 10),
//                 const Divider(height: 20, thickness: 5, indent: 20, endIndent: 20, color: Colors.black), // Espacement entre les ListTile
//                 ListTile(
//                   leading: ClipRRect(
//                     borderRadius: BorderRadius.circular(8),
//                     child: Image.asset(
//                       'assets/images/téléchargement.webp',
//                       width: 150,
//                       height: 150,
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                   title: const Text('Description du film 2'),
//                 ),
//                 SizedBox(height: 10),
//                 const Divider(height: 20, thickness: 5, indent: 20, endIndent: 20, color: Colors.black), // Espacement entre les ListTile
//                 ListTile(
//                   leading: ClipRRect(
//                     borderRadius: BorderRadius.circular(8),
//                     child: Image.asset(
//                       'assets/images/téléchargement.webp',
//                       width: 150,
//                       height: 150,
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                   title: const Text('Description du film 3'),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     ),
//     // bottomNavigationBar: BottomNavigationBar(
//     //   items: const [
//     //     BottomNavigationBarItem(icon: Icon(Icons.home), label: "Accueil"),
//     //     BottomNavigationBarItem(icon: Icon(Icons.search), label: "Recherche"),
//     //     BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profil"),
//     //   ],
//     // ),
//   ),
//   );
// }
// }




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


