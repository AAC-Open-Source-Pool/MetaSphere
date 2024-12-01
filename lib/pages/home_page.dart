import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smetasphere/auth/main_page.dart';
//import 'package:smetasphere/pages/login_page.dart';


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MainPage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentImageIndex = 0;
  int _currentNavIndex = 0;

  final TextEditingController _searchController = TextEditingController();

  final List<String> carouselImages = [
    'assets/carousel 1.png',
    'assets/giva [ accessory ].jpeg.jpg',
    'assets/quickerhomes[ real estate].png',
    'assets/the summere house[ clothing].png',
    'assets/tvf [entertaiment].png',
    'assets/spring [food,healthcare].png',
  ];

  final List<Map<String, dynamic>> postImages = [
    {'url': 'assets/tvf [entertaiment].png', 'title': 'Post 1', 'liked': false, 'bookmarked': false},
    {'url': 'assets/upstox[financial services].png', 'title': 'Post 2', 'liked': false, 'bookmarked': false
    },
    {'url': 'assets/palmonas [accessory ].jpg', 'title': 'Post 3', 'liked': false, 'bookmarked': false},
  ];

  void _onBottomNavTap(int index) {
    setState(() {
      _currentNavIndex = index;
    });
  }

  void _toggleLike(int index) {
    setState(() {
      postImages[index]['liked'] = !(postImages[index]['liked'] ?? false);
    });
  }

  void _toggleBookmark(int index) {
    setState(() {
      postImages[index]['bookmarked'] = !(postImages[index]['bookmarked'] ?? false);
    });
  }

  void _onFilterPressed(String filter) {
    // Implement the filter logic here
    print('$filter pressed');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(
      //   title: const Text('Home Page'),
      //   backgroundColor: Colors.deepPurple,
      // ),
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              'assets/Untitled.png',
              fit: BoxFit.cover,
            ),
          ),
          // Content
          SingleChildScrollView(
            child: Column(
              children: [
                // Row for Back Button, Notification Icon, and Search Bar
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Back Button and Notification Button
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.arrow_back, color: Colors.deepPurple),
                            onPressed: () {
                              // Handle back navigation
                              Navigator.pop(context);
                            },
                          ),
                          IconButton(
                            icon: const Icon(Icons.notifications, color: Colors.deepPurple),
                            onPressed: () {
                              // Handle notification button press
                            },
                          ),
                        ],
                      ),
                      // Search Bar
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: TextField(
                          controller: _searchController,
                          decoration: InputDecoration(
                            hintText: 'Search...',
                            filled: true,
                            fillColor: Colors.white.withOpacity(0.7),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              borderSide: BorderSide.none,
                            ),
                            prefixIcon: const Icon(Icons.search, color: Colors.deepPurple),
                          ),
                        ),
                      ),
                      // Filter Buttons below the search bar
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal, // Enable horizontal scrolling
                          child: Row(
                            children: [
                              ElevatedButton(
                                onPressed: () => _onFilterPressed('Filter 1'),
                                child: const Text(
                                  'Filter 1',
                                  style: TextStyle(color: Colors.white),
                                ),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.deepPurple,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10), // Add spacing between buttons
                              ElevatedButton(
                                onPressed: () => _onFilterPressed('Filter 2'),
                                child: const Text(
                                  'Filter 2',
                                  style: TextStyle(color: Colors.white),
                                ),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.deepPurple,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              ElevatedButton(
                                onPressed: () => _onFilterPressed('Filter 3'),
                                child: const Text(
                                  'Filter 3',
                                  style: TextStyle(color: Colors.white),
                                ),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.deepPurple,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              ElevatedButton(
                                onPressed: () => _onFilterPressed('Filter 4'),
                                child: const Text(
                                  'Filter 4',
                                  style: TextStyle(color: Colors.white),
                                ),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.deepPurple,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              ElevatedButton(
                                onPressed: () => _onFilterPressed('Filter 5'),
                                child: const Text(
                                  'Filter 5',
                                  style: TextStyle(color: Colors.white),
                                ),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.deepPurple,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // Carousel Section
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16.0),
                    child: CarouselSlider.builder(
                      itemCount: carouselImages.length,
                      itemBuilder: (BuildContext context, int index, int realIndex) {
                        String image = carouselImages[index];
                        return Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: image.startsWith('http')
                                  ? NetworkImage(image)
                                  : AssetImage(image) as ImageProvider,
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      },
                      options: CarouselOptions(
                        height: 250.0,
                        enlargeCenterPage: true,
                        autoPlay: true,
                        autoPlayInterval: const Duration(seconds: 2),
                        onPageChanged: (index, reason) {
                          setState(() {
                            _currentImageIndex = index;
                          });
                        },
                      ),
                    ),
                  ),
                ),
                // Posts Section (only one post displayed)
                Card(
                  margin: const EdgeInsets.all(8.0),
                  elevation: 3.0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        'assets/1mg post1.jpg', 
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: 250,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          postImages[0]['title'],
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          IconButton(
                            icon: Icon(
                              Icons.favorite,
                              color: postImages[0]['liked'] == true ? Colors.pink : Colors.grey,
                            ),
                            onPressed: () => _toggleLike(0),
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.bookmark,
                              color: postImages[0]['bookmarked'] == true ? Colors.yellow : Colors.grey,
                            ),
                            onPressed: () => _toggleBookmark(0),
                          ),
                          IconButton(
                            icon: const Icon(Icons.info, color: Colors.purple),
                            onPressed: () {},
                          ),
                          IconButton(
                            icon: const Icon(Icons.chat, color: Color.fromRGBO(67, 160, 71, 1)),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      // Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentNavIndex,
        onTap: _onBottomNavTap,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Create',
          ),
        ],
      ),
    );
  }
}
