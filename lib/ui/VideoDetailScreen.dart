import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:posiblesoftwareinterntest/model/serialization.dart';
import 'package:posiblesoftwareinterntest/ui/playVideosScreen.dart';

class VideoDetailsPage extends StatelessWidget {
  final Result item;
  const VideoDetailsPage({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            pinned: true,
            backgroundColor: Colors.grey.shade200.withOpacity(0.5),
            backwardsCompatibility: true,
            expandedHeight: 350,
            collapsedHeight: 220,
            shadowColor: Colors.grey[200],
            elevation: 2,
            foregroundColor: Colors.pink,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                "https://image.tmdb.org/t/p/original/${item.backdropPath}",
                fit: BoxFit.cover,
              ),
              collapseMode: CollapseMode.parallax,
              title: Container(
                height: 200,
                padding: EdgeInsets.only(top: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                ),
                child: Image.network(
                  "https://image.tmdb.org/t/p/original/${item.posterPath}",
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(<Widget>[
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(12),
                child: Text(
                  item.title,
                  style: TextStyle(fontSize: 30),
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12, right: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
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
                            Text("${item.voteCount.toString()}")
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text("Rating : ${item.voteAverage.toString()}"),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 12, right: 12),
                      child: TextButton.icon(
                          onPressed: () {
                            SystemChrome.setEnabledSystemUIOverlays([]);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    PlayVideoPage(id: item.id),
                              ),
                            );
                          },
                          icon: Icon(Icons.play_arrow),
                          label: Text(
                            "Watch Trailer",
                            style: TextStyle(fontSize: 20),
                          )),
                    ),
                  ],
                ),
              ),
              // SizedBox(
              //   height: 10,
              // ),
              // Padding(
              //   padding: const EdgeInsets.only(left: 12, right: 12),
              //   child: Text("Rating : ${item.voteAverage.toString()}"),
              // ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Text(
                  "OverView",
                  style: TextStyle(fontSize: 25),
                ),
              ),
              SizedBox(
                height: 7,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Text(
                  "${item.overview.toString()}",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      fontSize: 18, color: Colors.grey[800], height: 1.6),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 40, right: 40),
                child: Container(
                  padding: EdgeInsets.only(left: 13, right: 13),
                  decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(30)),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 15,
                      ),
                      Text("Additional Information"),
                      Divider(),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Release Date",
                            style: TextStyle(fontSize: 18),
                          ),
                          Text(
                            "${item.releaseDate.day.toString()}/${item.releaseDate.month.toString()}/${item.releaseDate.year.toString()}",
                            style: TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 13,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "TMBD ID",
                            style: TextStyle(fontSize: 18),
                          ),
                          Text(
                            "${item.id.toString()}",
                            style: TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 13,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Language",
                            style: TextStyle(fontSize: 18),
                          ),
                          Text(
                            "${item.originalLanguage.toString()}",
                            style: TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 13,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ]),
          )
        ],
      ),
    );
  }
}
