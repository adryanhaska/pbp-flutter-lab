import 'package:counter_7/model/my_watchlist.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<List<MyWatchList>> fetchMyWatchList() async {
  var url = Uri.parse('https://api.npoint.io/b8482897d5ee52b94ea3');
  var response = await http.get(
    url,
    headers: {
      "Access-Control-Allow-Origin": "*",
      "Content-Type": "application/json",
    },
  );

  // melakukan decode response menjadi bentuk json
  var data = jsonDecode(utf8.decode(response.bodyBytes));

  // melakukan konversi data json menjadi object MyWatchList
  List<MyWatchList> listMyWatchList = [];
  for (var d in data) {
    if (d != null) {
      listMyWatchList.add(MyWatchList.fromJson(d));
    }
  }
  return listMyWatchList;
}