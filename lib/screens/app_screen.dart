import 'package:flutter/material.dart';
import 'package:s19miniapp/screens/colors.dart';
import 'package:intl/intl.dart';
import 'package:s19miniapp/screens/material/app_screen_material.dart';
import 'package:s19miniapp/services/appServices.dart';

class AppScreen extends StatelessWidget {
  const AppScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: CustomColors.themeColor),
          useMaterial3: true),
      home: const AppScreenPage(),
    );
  }
}

class AppScreenPage extends StatefulWidget {
  const AppScreenPage({super.key});

  @override
  State<AppScreenPage> createState() => _AppScreenPageState();
}

class _AppScreenPageState extends State<AppScreenPage> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    String now =
        '${DateFormat('EEEE').format(DateTime.now())}, ${DateFormat('dd-MM-yyyy').format(DateTime.now())}';
    return Scaffold(
      backgroundColor: CustomColors.themeColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: screenHeight * 0.05),
            Column(
              children: [
                Row(
                  children: [
                    Column(
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          margin: const EdgeInsets.only(
                              left: 20, top: 20, right: 20, bottom: 20),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              image: const DecorationImage(
                                image: AssetImage("assets/images/avatar.png"),
                                fit: BoxFit.cover,
                              )),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Row(
                          children: [
                            Text("Admin", style: TextStyle(fontSize: 25)),
                          ],
                        ),
                        Row(
                          children: [Text(now)],
                        )
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(children: [CustomAppInkWell('QR_CODE')]),
                    SizedBox(width: 10),
                    Column(
                      children: [CustomAppInkWell('')],
                    ),
                    SizedBox(width: 10),
                    CustomAppInkWell('')
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(children: [CustomAppInkWell('')]),
                    SizedBox(width: 10),
                    Column(
                      children: [CustomAppInkWell('')],
                    ),
                    SizedBox(width: 10),
                    CustomAppInkWell('')
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(children: [
                      CustomAppInkWell('')
                    ]),
                    SizedBox(width: 10),
                    Column(
                      children: [
                        CustomAppInkWell('')
                      ],
                    ),
                    SizedBox(width: 10),
                    CustomAppInkWell('')
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(children: [
                      CustomAppInkWell('')
                    ]),
                    SizedBox(width: 10),
                    Column(
                      children: [
                        CustomAppInkWell('')
                      ],
                    ),
                    SizedBox(width: 10),
                    CustomAppInkWell('')
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(children: [
                      CustomAppInkWell('')
                    ]),
                    SizedBox(width: 10),
                    Column(
                      children: [
                        CustomAppInkWell('')
                      ],
                    ),
                    SizedBox(width: 10),
                    CustomAppInkWell('')
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(children: [
                      CustomAppInkWell('')
                    ]),
                    SizedBox(width: 10),
                    Column(
                      children: [
                        CustomAppInkWell('')
                      ],
                    ),
                    SizedBox(width: 10),
                    CustomAppInkWell('')
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
