import 'package:flutter/material.dart';
import 'package:counter_7/page/drawer.dart';
import 'package:counter_7/model/my_watchlist.dart';

class MyWatchListDetails extends StatefulWidget {
  const MyWatchListDetails({super.key, required this.watchList});

  final MyWatchList watchList;

  @override
  State<MyWatchListDetails> createState() => _MyWatchListDetailsState();
}

class _MyWatchListDetailsState extends State<MyWatchListDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Detail'),
        ),
        drawer: MyDrawer(),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 20),
          child: Column(
            children: [
              Center(
                child: Text(
                  widget.watchList.fields.title,
                  style: const TextStyle(
                    fontSize: 27,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        children: [
                          const TextSpan(
                              text: "Release Date:",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold)),
                          TextSpan(
                            text: " ${widget.watchList.fields.releaseDate}",
                            style: const TextStyle(color: Colors.black87),
                          ),
                        ],
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        children: [
                          const TextSpan(
                              text: "Rating:",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold)),
                          TextSpan(
                            text: " ${widget.watchList.fields.rating}/10",
                            style: const TextStyle(color: Colors.black87),
                          ),
                        ],
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        children: [
                          const TextSpan(
                              text: "Status:",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold)),
                          TextSpan(
                            text: " ${widget.watchList.fields.watched == true? 'watched' :'not yet watched'}",
                            style: const TextStyle(color: Colors.black87),
                          ),
                        ],
                      ),
                    ),
                    const Text(
                      'Review: ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      widget.watchList.fields.review,
                      textAlign: TextAlign.justify,
                      style: const TextStyle(color: Colors.black87),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Center(
                child: SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.blue),
                    ),
                    child: const Text(
                      'Back',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
