import 'package:flutter/material.dart';
import 'package:rayanik_panel/core/constants/colors.dart';
import 'package:rayanik_panel/core/constants/urls.dart';

class CourseWidget extends StatelessWidget {
  const CourseWidget({
    Key? key,
    required this.title,
    required this.weeks,
    required this.imageUrl, this.onTap,
  }) : super(key: key);
  final String title;
  final int weeks;
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
          width: MediaQuery.of(context).size.width,
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
                child: Image.network(
                  '$baseUrl/uploads/$imageUrl',
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  fit: BoxFit.fill,
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
                          // second text
                          Row(
                            children: [
                              const Icon(
                                Icons.access_time,
                                color: cyan,
                              ),
                              Text(
                                "\t$weeks هفته",
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize:
                                      15 * MediaQuery.of(context).textScaleFactor,
                                ),
                              ),
                            ],
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
