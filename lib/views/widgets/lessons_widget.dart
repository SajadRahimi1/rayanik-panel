import 'package:flutter/material.dart';
import 'package:rayanik_panel/core/constants/colors.dart';
import 'package:rayanik_panel/core/constants/urls.dart';

class LessonsWidget extends StatelessWidget {
  const LessonsWidget(
      {super.key, required this.title, required this.imageUrl, this.onTap});

  final String title;
  final String imageUrl;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        elevation: 5,
        child: Container(
          margin: const EdgeInsets.only(left: 5),
          width: MediaQuery.of(context).size.width / 10,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
              // color: Color(0xffefefef),
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: Column(
            children: [
              // image
              Expanded(
                  child: ClipRRect(
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10)),
                child: Stack(
                  children: [
                    Image.network(
                      '$baseUrl/uploads/$imageUrl',
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      fit: BoxFit.fill,
                    ),
                    Center(
                      child: CircleAvatar(
                        radius: MediaQuery.sizeOf(context).width / 65,
                        backgroundColor: const Color.fromRGBO(255, 255, 255, 0.9),
                        child: const Icon(
                          Icons.play_arrow,
                          // color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
              )),
              // titles
              Expanded(
                  child: Padding(
                      padding: const EdgeInsets.only(left: 4, right: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // title text
                          Text(
                            title,
                            style: TextStyle(
                              fontSize:
                                  17 * MediaQuery.of(context).textScaleFactor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          // edit button
                          Container(
                            width: MediaQuery.sizeOf(context).width,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: darkBlue,
                                borderRadius: BorderRadius.circular(6)),
                            padding: const EdgeInsets.all(5),
                            child: const Text(
                              "ویرایش",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ))),
            ],
          ),
        ),
      ),
    );
  }
}
