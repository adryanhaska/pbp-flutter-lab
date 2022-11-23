import 'package:flutter/material.dart';
import 'package:counter_7/page/drawer.dart';
import 'package:counter_7/page/my_watchlist_details.dart';
import 'package:counter_7/page/fetch_my_watchlist.dart';

class MyWatchListPage extends StatefulWidget {
  const MyWatchListPage({Key? key}) : super(key: key);

  final String title = 'My Watch List';

  @override
  _MyWatchListState createState() => _MyWatchListState();
}

class _MyWatchListState extends State<MyWatchListPage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        drawer: MyDrawer(),
        body: FutureBuilder(
            future: fetchMyWatchList(),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return const Center(child: CircularProgressIndicator());
              } else {
                if (!snapshot.hasData) {
                  return Column(
                    children: const [
                      Text(
                        "Tidak ada My Watch List :(",
                        style:
                            TextStyle(color: Color(0xff59A5D8), fontSize: 20),
                      ),
                      SizedBox(height: 8),
                    ],
                  );
                } else {
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (_, index) => GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MyWatchListDetails(
                                  watchList: snapshot.data![index])),
                        );
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 12),
                        padding: const EdgeInsets.all(20.0),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15.0),
                            boxShadow: [
                              BoxShadow(
                                  color: snapshot.data![index].fields.watched == true? Colors.green: Colors.red,
                                  blurRadius: 2.0
                              )
                            ]),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${snapshot.data![index].fields.title}",
                              style: const TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Checkbox(
                              value: snapshot.data![index].fields.watched ==
                                  true,
                              onChanged: (bool? value) {
                                setState(() {
                                  if (snapshot.data![index].fields.watched ==
                                      true) {
                                    snapshot.data![index].fields.watched =
                                    false;
                                  } else {
                                    snapshot.data![index].fields.watched =
                                    true;
                                  }
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }
              }
            }));
  }
}
