import 'package:flutter/material.dart';

class SingleJobCard extends StatefulWidget {
  const new({super.key});

  @override
  State<SingleJobCard> createState() => _SingleJobCardState();
}

class _SingleJobCardState extends State<SingleJobCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
      ),
      child: Row(
        children: [
          CircleAvatar(radius: 30),
          SizedBox(width: 10),
          SizedBox(
            width: 250,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  overflow: TextOverflow.ellipsis,
                  "AWCC",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black54,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                Text(
                  overflow: TextOverflow.ellipsis,
                  "Sr. IT Application Manageme ...",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(
                  overflow: TextOverflow.ellipsis,
                  "Kabul . May 9, 2022",
                  style: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
          ),
          Spacer(),
          IconButton(
            style: IconButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 227, 226, 226),
            ),
            onPressed: () {},
            icon: Icon(Icons.bookmark),
          ),
        ],
      ),
    );
  }
}
