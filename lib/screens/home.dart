import 'dart:convert' as convert;

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Home extends StatelessWidget {
  const Home({super.key});

  Future<dynamic> getData() async {
    var url = Uri.https('www.thecocktaildb.com', '/api/json/v1/1/search.php',
        {'s': 'margarita'});

    var response = await http.get(url);

    if (response.statusCode == 200) {
      var data = convert.jsonDecode(response.body);
      return data["drinks"];
    } else {
      throw Future.error("Error ayo");
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return Center(
                child: Text(
                  "data aayana",
                  style: TextStyle(fontSize: 30, color: Colors.white),
                ),
              );
            }
            var data = snapshot.data;

            return ListView.builder(
                itemCount: data.length,
                itemBuilder: (ctx, index) {
                  return Row(
                    children: [
                      Container(
                        height: 200,
                        width: 200,
                        alignment: Alignment.centerLeft,
                        child: Card(
                          child: Image.network(
                            data[index]['strDrinkThumb'],
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              data[index]['strDrink'],
                              style: TextStyle(
                                color: Colors.blueGrey,
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Container(
                              height: 150,
                              width: 180,
                              child: Text(
                                data[index]['strInstructions'],
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  );
                });
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}
