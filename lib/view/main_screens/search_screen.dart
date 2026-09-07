import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Search",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        actions: [
          Icon(Icons.more_vert, size: 25, fontWeight: FontWeight.bold),
          SizedBox(width: 10),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: BorderSide(color: Colors.black12),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  hintText: "Search Jobs",
                  prefixIcon: Icon(Icons.search),
                  suffixIcon: Icon(
                    Icons.close,
                    size: 20,
                    color: Colors.redAccent,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Recent search",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 22),
                  ),
                  Text(
                    "Delete",
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 16,
                      color: Colors.deepOrangeAccent,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              recentSearchWidget(),
              recentSearchWidget(),
              recentSearchWidget(),
              recentSearchWidget(),
              recentSearchWidget(),
              recentSearchWidget(),
              recentSearchWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

Widget recentSearchWidget() {
  return Container(
    margin: EdgeInsets.only(bottom: 15),
    child: Row(
      children: [
        Icon(Icons.access_time, color: Colors.black54),
        SizedBox(width: 10),
        Text(
          "Search past 1 ",
          style: TextStyle(
            fontWeight: FontWeight.normal,
            fontSize: 16,
            color: Colors.black54,
          ),
        ),
        Spacer(),
        Icon(Icons.close, size: 20, color: Colors.black54),
      ],
    ),
  );
}
