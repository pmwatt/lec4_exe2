import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() => runApp(UWUApp());

class UWUApp extends StatelessWidget {
  const UWUApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: Color.fromARGB(30, 170, 100, 100),
        colorScheme:
            ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 255, 94, 73)),
      ),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var showcasePetList = ['images/hibernatingcat.jpg', 'images/drunkcat.jpg'];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              SizedBox(
                height: 200,
              ),
              Text(
                'Adopt your dream pet online',
                style: widget.textStyleH1,
              ),
              SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(onPressed: () {}, child: Text('Cats')),
                  SizedBox(
                    width: 10,
                  ),
                  ElevatedButton(onPressed: () {}, child: Text('Dogs')),
                  SizedBox(
                    width: 10,
                  ),
                  ElevatedButton(onPressed: () {}, child: Text('Others'))
                ],
              ),
              SizedBox(
                height: 50,
              ),

              // reference:
              // https://pub.dev/packages/carousel_slider
              CarouselSlider(
                options: CarouselOptions(height: 400.0),
                items: showcasePetList.map((assetUrl) {
                  return Builder(
                    builder: (BuildContext context) {
                      return ClipRRect(
                          // width: MediaQuery.of(context).size.width,
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          // margin: EdgeInsets.symmetric(horizontal: 5.0),
                          child: Image(
                            image: AssetImage(assetUrl),
                          ));
                    },
                  );
                }).toList(),
              ),

              SizedBox(
                height: 200,
              ),
              Column(
                children: [
                  Text(
                    'Looking for something more specific?',
                    style: widget.textStyleH2,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SearchAnchor(builder:
                        (BuildContext context, SearchController controller) {
                      return SearchBar(
                        controller: controller,
                        padding: const MaterialStatePropertyAll<EdgeInsets>(
                            EdgeInsets.symmetric(horizontal: 16.0)),
                        onTap: () {
                          controller.openView();
                        },
                        onChanged: (_) {
                          controller.openView();
                        },
                        leading: const Icon(Icons.search),
                      );
                    }, suggestionsBuilder:
                        (BuildContext context, SearchController controller) {
                      return List<ListTile>.generate(5, (int index) {
                        final String item = 'item $index';
                        return ListTile(
                          title: Text(item),
                          onTap: () {
                            setState(() {
                              controller.closeView(item);
                            });
                          },
                        );
                      });
                    }),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(onPressed: () {}, child: Text('Search')),
                ],
              ),
              SizedBox(
                height: 200,
              ),
              Column(
                children: [
                  Text(
                    'Pets you\'ve browsed before',
                    style: widget.textStyleH2,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          BookmarkedPet(
                              name: 'john',
                              assetUrl: 'images/hibernatingcat.jpg'),
                          BookmarkedPet(
                              name: 'john', assetUrl: 'images/drunkcat.jpg'),
                          BookmarkedPet(
                              name: 'john',
                              assetUrl: 'images/hibernatingcat.jpg'),
                          BookmarkedPet(
                              name: 'john', assetUrl: 'images/drunkcat.jpg'),
                          BookmarkedPet(
                              name: 'john',
                              assetUrl: 'images/hibernatingcat.jpg'),
                          BookmarkedPet(
                              name: 'john', assetUrl: 'images/drunkcat.jpg'),
                        ],
                      ),
                    ),
                  )
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

class BookmarkedPet extends StatelessWidget {
  final String assetUrl;
  final String name;
  const BookmarkedPet({
    super.key,
    required this.assetUrl,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          CircleAvatar(
            backgroundImage: AssetImage(assetUrl),
            radius: 60,
          ),
          Text(name)
        ],
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
