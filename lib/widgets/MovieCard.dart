import 'package:flutter/material.dart';

class MovieCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String description;

  const MovieCard({Key? key, required this.imageUrl, required this.title, required this.description}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.black,
      
      child: ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset(
            imageUrl,
            width: 150,
            height: 150,
            fit: BoxFit.cover,
          ),
        ),
        title: Text(
          title,
          style: const TextStyle(color: Colors.white),
        ),
        subtitle: Text(
            description,
            style: const TextStyle(color: Colors.white70),
          ),
      ),
      
    );
  }
}
