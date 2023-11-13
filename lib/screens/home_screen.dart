import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movieapp/model/movie.dart';
import 'package:movieapp/repo/movie_repo.dart';
import 'package:movieapp/screens/listing_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  final MovieRepo _movieRepo = MovieRepo();

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GEMPLEX'),
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.add_shopping_cart_sharp),
            onPressed: () {},
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: 'Home'),
            Tab(text: 'Originals'),
            Tab(text: 'Movies'),
            Tab(text: 'Videos'),
          ],
          indicatorColor: Colors.blue,
          indicatorWeight: 3,
        ),
      ),
      body: Column(
        children: [
          FutureBuilder<MovieModel>(
            future: _movieRepo.fetchData(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                final contentResponse = snapshot.data!;
                return Column(
                  children: [
                    CarouselSlider(
                      items: contentResponse.data?[0].contentList
                              ?.map((contentItem) {
                            return Image.network(contentItem.imageUrl ?? "",
                                fit: BoxFit.cover);
                          }).toList() ??
                          [],
                      options: CarouselOptions(
                        height: 200.0,
                        enlargeCenterPage: true,
                        autoPlay: true,
                        aspectRatio: 16 / 9,
                        enableInfiniteScroll: true,
                        viewportFraction: 1.0,
                        onPageChanged: (index, reason) {
                          setState(() {
                          });
                        },
                        scrollDirection: Axis.horizontal,
                      ),
                    ),
                  ],
                );
              }
            },
          ),
          SizedBox(height: 20),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                ListingScreen(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
