import 'package:flutter/material.dart';

class BookWidget extends StatelessWidget {
  const BookWidget(
      {super.key,
      required this.imageUrl,
      required this.title,
      required this.author});
  final String imageUrl, title, author;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      elevation: 3,
      child: SizedBox(
        width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.network(
              imageUrl,
              width: MediaQuery.sizeOf(context).width,
              height: MediaQuery.sizeOf(context).height / 7,
              fit: BoxFit.fitHeight,
            ),
            SizedBox(
                width: MediaQuery.sizeOf(context).width,
                child: Text(
                  "\t$title",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontSize: 20 * MediaQuery.of(context).textScaleFactor),
                )),
            SizedBox(
                width: MediaQuery.sizeOf(context).width,
                child: Text(
                  "\t$author",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontSize: 17 * MediaQuery.of(context).textScaleFactor,
                      color: const Color(0xff5f5f5f)),
                )),
          ],
        ),
      ),
    );
  }
}
