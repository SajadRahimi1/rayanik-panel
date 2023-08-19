import 'package:flutter/material.dart';
import 'package:rayanik_panel/core/constants/colors.dart';

class BookWidget extends StatelessWidget {
  const BookWidget(
      {super.key,
      required this.imageUrl,
      required this.title,
      this.onEditTap,
      required this.author});
  final String imageUrl, title, author;
  final void Function()? onEditTap;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Card(
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
                          fontSize:
                              20 * MediaQuery.of(context).textScaleFactor),
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
        ),
        Align(
          alignment: Alignment.topLeft,
          child: InkWell(
            onTap: onEditTap,
            child: Container(
              margin: const EdgeInsets.all(6),
              width: MediaQuery.sizeOf(context).width / 45,
              height: MediaQuery.sizeOf(context).height / 25,
              color: cyan,
              alignment: Alignment.center,
              child: const Icon(
                Icons.edit,
                color: Colors.white,
              ),
            ),
          ),
        )
      ],
    );
  }
}
