import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled/controller/api.dart';

import '../widget/listtile.dart';

class Screen extends StatefulWidget {
  const Screen({
    super.key,
  });

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  State<Screen> createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ApiController());
    return Scaffold(
        body: Container(
          color: Colors.white,
          width: Get.width,
          height: Get.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 60,
              ),
              Text(
                "LEADERBOARD",
                style: TextStyle(fontFamily: 'gothambold', fontSize: 130, fontWeight: FontWeight.bold),
              ),

              const SizedBox(
                height: 58,
              ),
              Row(
                children: [listtileHeading(context), listtileHeading(context)],
              ),
              Expanded(
                child: Container(
                  color: Colors.white,
                  child: GetBuilder<ApiController>(builder: (context) {
                    return controller.results!.isNotEmpty
                        ? Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: Get.width * 0.5,
                          child: ListView.builder(
                              shrinkWrap: false,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: 5,
                              itemBuilder: (context, index) {
                                return Padding(
                                    padding: const EdgeInsets.all(18.0),
                                    child: listtile(
                                        context,
                                        controller.results?[index].id ?? 'NA',
                                        controller.results?[index].name ??
                                            'NA',
                                        controller.results?[index].time ??
                                            'NA',
                                        controller.results?[index].guesses ??
                                            'NA',
                                        controller.results?[index].points ??
                                            'NA'));
                              }),
                        ),
                        Container(
                            width: Get.width * 0.5,
                            child: ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: 5,
                              itemBuilder: (context, index) {
                                return Padding(
                                    padding: const EdgeInsets.all(18.0),
                                    child: listtile(
                                        context,
                                        controller.results?[index + 5].id ??
                                            'NA',
                                        controller.results?[index + 5].name ??
                                            'NA',
                                        controller.results?[index + 5].time ??
                                            'NA',
                                        controller.results?[index + 5]
                                            .guesses ??
                                            'NA',
                                        controller
                                            .results?[index + 5].points ??
                                            'NA'));
                              },
                            )),
                      ],
                    )
                        : const Center(child: CircularProgressIndicator());
                  }),
                ),
              ),
              Image.asset(
                "footer.png",
                height: 95,
              )
              // Expanded(
              //   child: Row(
              //     mainAxisSize: MainAxisSize.max,
              //     children: [
              //       Padding(
              //           padding: const EdgeInsets.all(8.0),
              //           child: Expanded(
              //             child: ListView.builder(
              //                 itemCount: 5,
              //                 shrinkWrap: true,
              //                 physics: const NeverScrollableScrollPhysics(),
              //                 itemBuilder: (context, index) {
              //                   return listtile(
              //                       context,
              //                       controller.listdata[index]["id"],
              //                       controller.listdata[index]["id"],
              //                       controller.listdata[index]["id"],
              //                       controller.listdata[index]["id"],
              //                       controller.listdata[index]["id"]);
              //                 }),
              //           )),
              //       Padding(
              //         padding: const EdgeInsets.all(8.0),
              //         child: Column(
              //           children: [listtile(context, 1, "dsfsf", "00.32", 1, 200),"time":"00.32"],
              //         ),
              //       )
              //     ],
              //   ),
              // )
            ],
          ),
        ));
  }
}
