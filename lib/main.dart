  import 'package:flutter/material.dart';

  void main() {
    runApp(const MyApp());
  }

  class MyApp extends StatelessWidget {
    const MyApp({super.key});

    @override
    Widget build(BuildContext context) {
      return MaterialApp(
        title: 'Facebook Profile',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const FacebookProfilePage(),
      );
    }
  }

  class FacebookProfilePage extends StatelessWidget {
    const FacebookProfilePage({super.key});

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 1, 104, 189),
          title: const Text('Facebook Profile',
          style: TextStyle(color: Colors.white,fontSize: 24,fontWeight: FontWeight.bold),),
        ),
        body: SingleChildScrollView(  
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Cover Photo
              Container(
                width: double.infinity,
                height: 200,
                
                  child: Center(
                  child: Image.asset("assets/images/facebook_2504903.png",
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,),
                  ),
                
              ),
              // Profile Photo and Name
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: const AssetImage('assets/images/Shin-chan.png'),
                    ),
                    const SizedBox(width: 10),
                    const Text(
                      'Shin-chan',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              // About Info
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'About Info: Member of the Kasukabe Defence Force\nOne of the captains',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              const Divider(),
              // Friends List
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Friends',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    FriendsList(),
                  ],
                ),
              ),
              const Divider(),
              // Posts
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Posts',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Post(
                      author: 'Shin-Chan',
                      content: 'Had a great time at the beach today!',
                    ),
                    Post(
                      author: 'Shin-Chan',
                      content: 'Just finished a new Flutter project. Check it out!',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    }
  }

  class FriendsList extends StatelessWidget {
    const FriendsList({super.key});

    @override
    Widget build(BuildContext context) {
      return SizedBox(
        height: 100,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: const [
            Friend(name: 'Kazama', imagePath: 'assets/images/Kazama.webp'),
            Friend(name: 'Bo', imagePath: 'assets/images/Bo.webp'),
            Friend(name: 'Masao', imagePath: 'assets/images/masao.jpg'),
            Friend(name: 'Nene', imagePath: 'assets/images/Nene.jpg'),
          ],
        ),
      );
    }
  }

  class Friend extends StatelessWidget {
    final String name;
    final String imagePath;

    const Friend({super.key, required this.name, required this.imagePath});

    @override
    Widget build(BuildContext context) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4.0),
        child: Column(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage(imagePath),
            ),
            const SizedBox(height: 5),
            Text(name),
          ],
        ),
      );
    }
  }

  class Post extends StatelessWidget {
    final String author;
    final String content;

    const Post({super.key, required this.author, required this.content});

    @override
    Widget build(BuildContext context) {
      return Card(
        margin: const EdgeInsets.symmetric(vertical: 8),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                author,
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 5),
              Text(content),
            ],
          ),
        ),
      );
    }
  }