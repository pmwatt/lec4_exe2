import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  int _selectedIndex = 0;
  static const TextStyle textStyleH2 = TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.bold,
      color: Color.fromARGB(255, 170, 89, 89));

  static const TextStyle textStyleH1 = TextStyle(
      fontSize: 50,
      fontWeight: FontWeight.normal,
      color: Color.fromARGB(255, 100, 50, 50));

  static const List<Widget> _widgetOptions = <Widget>[
    HomePage(textStyleH1: textStyleH1, textStyleH2: textStyleH2),
    ChatbotPage(optionStyle: textStyleH2),
    AboutUsPage(optionStyle: textStyleH2),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UWU', style: textStyleH2),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_rounded),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school_rounded),
            label: 'Chatbot Trainer',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.question_mark_rounded),
            label: 'About Us',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
    required this.textStyleH1,
    required this.textStyleH2,
  });

  final TextStyle textStyleH1;
  final TextStyle textStyleH2;

  @override
  State<HomePage> createState() => _SearchPageState();
}

class _SearchPageState extends State<HomePage> {
  var showcasePetList = ['images/hibernatingcat.jpg', 'images/drunkcat.jpg'];
  static const TextStyle textStyleH1 = TextStyle(
      fontSize: 25,
      fontWeight: FontWeight.normal,
      color: Color.fromARGB(255, 100, 50, 50));
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Text(
                'Search Results',
                style: textStyleH1,
              ),
              SizedBox(
                height: 20,
              ),
              Column(
                children: [
                  PetSearchItem(
                    assetUrl: 'images/hibernatingcat.jpg',
                    name: 'John',
                    org: 'The Very Pet Adoption Centre CO.',
                  ),
                  PetSearchItem(
                    assetUrl: 'images/drunkcat.jpg',
                    name: 'John',
                    org: 'The New Adoption Centre CO.',
                  ),
                  PetSearchItem(
                    assetUrl: 'images/hibernatingcat.jpg',
                    name: 'Puss in Boots',
                    org: 'The Very Pet Adoption Centre CO.',
                  ),
                  PetSearchItem(
                    assetUrl: 'images/drunkcat.jpg',
                    name: 'Johnny',
                    org: 'The Good Adoption Centre CO.',
                  ),
                  PetSearchItem(
                    assetUrl: 'images/drunkcat.jpg',
                    name: 'John',
                    org: 'The Very Pet Adoption Centre CO.',
                  ),
                  PetSearchItem(
                    assetUrl: 'images/drunkcat.jpg',
                    name: 'Leon',
                    org: 'The OK Pet Adoption Centre CO.',
                  ),
                ],
              ),
              SizedBox(
                height: 200,
              ),
              Text('Copyright 2024 @ UWU Co. Ltd. All Rights Reserved')
            ],
          ),
        ),
      ),
    );
  }
}

class PetSearchItem extends StatelessWidget {
  final String assetUrl;
  final String name;
  final String org;
  const PetSearchItem({
    super.key,
    required this.assetUrl,
    required this.name,
    required this.org,
  });

  static const TextStyle textStyleH1 = TextStyle(
      fontSize: 25,
      fontWeight: FontWeight.normal,
      color: Color.fromARGB(255, 100, 50, 50));
  static const TextStyle textStyleH2 = TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.bold,
      color: Color.fromARGB(255, 170, 89, 89));

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage(assetUrl),
                  radius: 40,
                ),
                SizedBox(
                  width: 10,
                ),
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(
                    "Pet Name: ${name}",
                    style: textStyleH1,
                  ),
                  Text(
                    "Organization: ${org}",
                    style: textStyleH2,
                  )
                ]),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({
    super.key,
    required this.optionStyle,
  });

  final TextStyle optionStyle;

  @override
  Widget build(BuildContext context) {
    return Text(
      'About Us Page: under construction',
      style: optionStyle,
    );
  }
}

class ChatbotPage extends StatelessWidget {
  const ChatbotPage({
    super.key,
    required this.optionStyle,
  });

  final TextStyle optionStyle;

  @override
  Widget build(BuildContext context) {
    return Text(
      'Chatbot Page: under construction',
      style: optionStyle,
    );
  }
}
