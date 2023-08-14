import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:rayanik_panel/core/constants/colors.dart';
import 'package:rayanik_panel/views/screens/main_screen.dart';
import 'package:rayanik_panel/views/screens/users/users_screen.dart';
import 'package:rayanik_panel/views/screens/video/video_screen.dart';

class Menu extends StatelessWidget {
  const Menu({super.key, required this.selectedItem, this.home});
  final int selectedItem;
  final Widget? home;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(
              child: Container(
            color: darkBlue,
            child: Column(
              children: [
                Container(
                  width: Get.width,
                  height: Get.height / 10.4,
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                      border: BorderDirectional(
                          bottom: BorderSide(color: Colors.white))),
                  padding: EdgeInsets.symmetric(vertical: Get.height / 45),
                  child: InkWell(
                    onTap: () => selectedItem == -1
                        ? {}
                        : Navigator.pushNamedAndRemoveUntil(
                            context,
                            '/',
                            (route) => false),
                    child: Text(
                      "پنل ادمین رایانیک",
                      style: TextStyle(
                          fontSize: 25 * MediaQuery.of(context).textScaleFactor,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 15),
                    child: Column(
                      children: [
                        ListTile(
                            onTap: () => selectedItem == 0
                                ? {}
                                : Navigator.pushNamedAndRemoveUntil(
                                    context,
                                    '/courses',
                                    (route) => false),
                            title: Text("آموزش ویدیویی",
                                style: TextStyle(
                                    fontSize: 20 *
                                        MediaQuery.of(context).textScaleFactor,
                                    color: selectedItem == 0
                                        ? cyan
                                        : Colors.white))),
                        SizedBox(
                          height: Get.height / 35,
                        ),
                        ListTile(
                            onTap: () => selectedItem == 1
                                ? {}
                                : Navigator.pushNamedAndRemoveUntil(
                                    context, '/users', (route) => false),
                            title: Text("مدیریت کاربران",
                                style: TextStyle(
                                    fontSize: 20 *
                                        MediaQuery.of(context).textScaleFactor,
                                    color: selectedItem == 1
                                        ? cyan
                                        : Colors.white))),
                        SizedBox(
                          height: Get.height / 35,
                        ),
                        ListTile(
                            title: Text("مدیریت ادمین ها",
                                style: TextStyle(
                                    fontSize: 20 *
                                        MediaQuery.of(context).textScaleFactor,
                                    color: Colors.white))),
                        SizedBox(
                          height: Get.height / 35,
                        ),
                        ListTile(
                            title: Text("مدیریت تعرفه ها",
                                style: TextStyle(
                                    fontSize: 20 *
                                        MediaQuery.of(context).textScaleFactor,
                                    color: Colors.white))),
                        SizedBox(
                          height: Get.height / 35,
                        ),
                        ListTile(
                            title: Text("مدیریت کتاب ها",
                                style: TextStyle(
                                    fontSize: 20 *
                                        MediaQuery.of(context).textScaleFactor,
                                    color: Colors.white))),
                        SizedBox(
                          height: Get.height / 35,
                        ),
                        ListTile(
                            title: Text("مدیریت پادکست ها",
                                style: TextStyle(
                                    fontSize: 20 *
                                        MediaQuery.of(context).textScaleFactor,
                                    color: Colors.white))),
                      ],
                    ),
                  ),
                )
              ],
            ),
          )),
          Expanded(
              flex: 5,
              child: SizedBox(
                child: home,
              ))
        ],
      ),
    );
  }
}
