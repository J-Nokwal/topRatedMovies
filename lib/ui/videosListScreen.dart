import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:posiblesoftwareinterntest/model/serialization.dart';
import 'package:posiblesoftwareinterntest/ui/VideoDetailScreen.dart';

class VideoListPage extends StatelessWidget {
  final VideosDetails? videosDetails;

  VideoListPage({Key? key, this.videosDetails}) : super(key: key) {
    //  print(object);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Top Rated Movies",
          style: TextStyle(color: Colors.grey[100]),
        ),
        centerTitle: true,
        // shadowColor: Colors.black,
        backgroundColor: Colors.blue[900],
        toolbarHeight: 70,
        leadingWidth: 80,
        leading: Container(
          // height: 50,
          width: 90,
          margin: EdgeInsets.only(left: 10, bottom: 5, top: 5),
          child: Image.asset(
            'assets/aa.png',
            fit: BoxFit.contain,
          ),
        ),
      ),
      body: ListView.builder(
          cacheExtent: 10,
          itemCount: 10,
          physics: BouncingScrollPhysics(),
          padding: const EdgeInsets.all(8.0),
          itemBuilder: (BuildContext context, int index) {
            Result item = videosDetails!.results[index];
            return InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => VideoDetailsPage(item: item),
                  ),
                );
              },
              child: Container(
                color: Colors.grey[100],
                margin: EdgeInsets.only(left: 5, right: 5, bottom: 20),
                child: Row(
                  children: [
                    Container(
                      height: 270,
                      width: 180,
                      child: Image.network(
                        "https://image.tmdb.org/t/p/original/${item.posterPath}",
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Container(
                        height: 270,
                        alignment: Alignment.topLeft,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              item.title,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(fontSize: 20),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                RatingBarIndicator(
                                  rating: item.voteAverage,
                                  itemBuilder: (context, index) => Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                  ),
                                  itemCount: 5,
                                  itemSize: 20.0,
                                  direction: Axis.horizontal,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(item.voteCount.toString())
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text("Rating : ${item.voteAverage.toString()}"),
                            SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text("Popularity : ${item.popularity}"),
                            SizedBox(
                              height: 5,
                            ),
                            Text((item.adult) ? "Adult" : " "),
                            SizedBox(
                              height: 5,
                            ),
                            // item.backdropPath
                            Text(
                              item.overview,
                              maxLines: 4,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
