import 'package:flutter/material.dart';
import 'package:rayanik_panel/core/constants/colors.dart';

class CourseWidget extends StatelessWidget {
  const CourseWidget({
    Key? key,
    required this.title,
    required this.description,
  }) : super(key: key);
  final String title, description;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
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
              borderRadius: BorderRadius.circular(15),
              child: Image.network(
                "https://toplearn.com/img/course/%D8%A2%D9%85%D9%88%D8%B2%D8%B4_%D9%87%D9%88%D8%B4_%D9%85%D8%B5%D9%86%D9%88%D8%B9%DB%8C_%D8%AF%D8%B1_%D8%A7%D9%84%D9%85%D9%86%D8%AA%D9%88%D8%B1.jpg",
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                fit: BoxFit.cover,
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
                              color: const Color(0xff414865)),
                        ),
                        // second text
                        Text(
                          description,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize:
                                  15 * MediaQuery.of(context).textScaleFactor,
                              color: const Color(0xff414865)),
                        ),
                      ],
                    ))),
          ],
        ),
      ),
    );
  }
}
