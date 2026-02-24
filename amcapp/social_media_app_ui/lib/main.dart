import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

void main() {
  runApp(const PinterestApp());
}

class PinterestApp extends StatelessWidget {
  const PinterestApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'NBA Wallpapers',
      theme: ThemeData(
        primaryColor: Colors.red[800], // NBA red
        scaffoldBackgroundColor: const Color(0xFF001D4A), // Dark NBA blue
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF002B5C), // NBA blue
          foregroundColor: Colors.white,
        ),
        brightness: Brightness.dark,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Map<String, dynamic>> posts = [
    {
      'title': 'Ja Morant',
      'username': 'NBA Fan',
      'imageUrl':
      'https://tse2.mm.bing.net/th/id/OIP.7mpXTz6MS1tvDLpEzdNbWgHaE7?rs=1&pid=ImgDetMain&o=7&rm=3',
      'likes': '12.4k',
    },
    {
      'title': 'Shai Gilgeous-Alexander',
      'username': 'NBA Fan',
      'imageUrl':
      'https://okcthunderwire.usatoday.com/gcdn/authoring/images/smg/2024/08/20/SOKC/72952403007-USATSI_22761284.jpeg?crop=4555,2562,x0,y0&width=3200&height=1800&format=pjpg&auto=webp',
      'likes': '8.9k',
    },
    {
      'title': 'Luka Dončić',
      'username': 'NBA Fan',
      'imageUrl':
      'https://tse1.mm.bing.net/th/id/OIP.uXmUKf5BMY0gi_gomw3KbQHaEK?rs=1&pid=ImgDetMain&o=7&rm=3',
      'likes': '15.2k',
    },
    {
      'title': 'Victor Wembanyama',
      'username': 'NBA Fan',
      'imageUrl':
      'https://tse1.mm.bing.net/th/id/OIP.YnEPnZznEBpRgM029S5G4wAAAA?rs=1&pid=ImgDetMain&o=7&rm=3',
      'likes': '6.7k',
    },
    {
      'title': 'Stephen Curry',
      'username': 'NBA Fan',
      'imageUrl':
      'https://tse2.mm.bing.net/th/id/OIP.apSJLCyAp5bw0R2UMHxvvAHaFj?rs=1&pid=ImgDetMain&o=7&rm=3',
      'likes': '18.9k',
    },
    {
      'title': 'LeBron James',
      'username': 'NBA Fan',
      'imageUrl':
      'https://www.dailybreeze.com/wp-content/uploads/2021/06/AP20354178165329.jpg?w=1569',
      'likes': '13.2k',
    },
    {
      'title': 'Giannis Antetokounmpo',
      'username': 'NBA Fan',
      'imageUrl':
      'https://tse1.mm.bing.net/th/id/OIP.uV5xWkFt9ts3oJioITVfUQHaEK?rs=1&pid=ImgDetMain&o=7&rm=3',
      'likes': '9.3k',
    },
    {
      'title': 'Kevin Durant',
      'username': 'NBA Fan',
      'imageUrl':
      'https://wp.clutchpoints.com/wp-content/uploads/2025/09/Rockets-Kevin-Durant-photoshoot.jpg?w=1200',
      'likes': '20.5k',
    },
    {
      'title': 'Jayson Tatum',
      'username': 'NBA Fan',
      'imageUrl':
      'https://tse3.mm.bing.net/th/id/OIP.O5kUbALrbtoYx2TFhYUyaAAAAA?w=474&h=315&rs=1&pid=ImgDetMain&o=7&rm=3',
      'likes': '7.8k',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NBA Wallpapers'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      body: MasonryGridView.count(
        crossAxisCount: MediaQuery.of(context).size.width > 900 ? 3 : 2,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        padding: const EdgeInsets.all(12),
        itemCount: posts.length,
        itemBuilder: (context, index) {
          return _buildCard(posts[index]);
        },
      ),
    );
  }

  Widget _buildCard(Map<String, dynamic> post) {
    return Card(
      color: Colors.white, // keeps the card readable on dark background
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
            child: Image.network(
              post['imageUrl'],
              fit: BoxFit.cover,
              loadingBuilder: (context, child, progress) {
                if (progress == null) return child;
                return SizedBox(
                  height: 180,
                  child: Center(child: CircularProgressIndicator(color: Colors.red)),
                );
              },
              errorBuilder: (context, error, stackTrace) {
                return SizedBox(
                  height: 180,
                  child: Center(
                    child: Text(
                      'Image not available',
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  post['title'],
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(Icons.person, size: 16),
                    const SizedBox(width: 4),
                    Text(post['username']),
                    const Spacer(),
                    const Icon(Icons.favorite_border, size: 16, color: Colors.red),
                    const SizedBox(width: 4),
                    Text(post['likes']),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}