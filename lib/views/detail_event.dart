import 'package:flutter/material.dart';

class DetailEvent extends StatelessWidget {
  final Map<String, dynamic> eventData;
  const DetailEvent({super.key, required this.eventData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Image.network(
            "${eventData['photurl']}",
            errorBuilder: (context, error, stackTrace) {
              return const Icon(Icons.error);
            },
          ),
          const SizedBox(height: 8),
          Text("Event name: ${eventData['name']}",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 4),
          Text("Event location: ${eventData['location']}"),
          const SizedBox(height: 4),
          Text("Event price: ${eventData['price']}"),
        ],
      ),
    );
  }
}
