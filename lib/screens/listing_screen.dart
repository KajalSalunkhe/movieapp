//
import 'package:flutter/material.dart';
import 'package:movieapp/model/listing.dart';
import 'package:movieapp/repo/listing_repo.dart';
import 'package:url_launcher/url_launcher.dart';

class ListingScreen extends StatefulWidget {
  const ListingScreen({Key? key}) : super(key: key);

  @override
  State<ListingScreen> createState() => _ListingScreenState();
}

class _ListingScreenState extends State<ListingScreen> {
  final ListingRepo _listingRepo = ListingRepo();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<ListingResponse>(
        future: _listingRepo.fetchListingData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final listing = snapshot.data!;
            return Container(
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: listing.data!.length,
                itemBuilder: (BuildContext context, int index) {
                  final contentList = listing.data![index].contentList;

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Card Name
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "${listing.data![index].cardName ?? 'Unknown Card'}",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                      // Images
                      SizedBox(
                        height: 250,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: contentList?.length ?? 0,
                          itemBuilder: (BuildContext context, int subIndex) {
                            final content = contentList?[subIndex];
                            return InkWell(
                              onTap: () {
                                _launchVideoUrl(
                                    "https://www.youtube.com/watch?v=5oH9Nr3bKfw");
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    if (content?.imageUrl != null)
                                      Image.network(
                                        content!.imageUrl!,
                                        height: 200,
                                        width: 120,
                                        fit: BoxFit.cover,
                                      ),
                                    if (content?.name != null)
                                      Container(
                                        alignment: Alignment.centerRight,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            "${content!.name}",
                                            style: TextStyle(fontSize: 14),
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  );
                },
              ),
            );
          }
        },
      ),
    );
  }
}

void _launchVideoUrl(String videoUrl) async {
  if (await canLaunch(videoUrl)) {
    await launch(videoUrl);
  } else {
    throw 'Could not launch $videoUrl';
  }
}
