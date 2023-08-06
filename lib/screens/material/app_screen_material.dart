import 'package:flutter/material.dart';
import '../../services/appServices.dart';

class CustomAppContainer extends StatelessWidget {
  final String _appName;

  const CustomAppContainer(this._appName, {super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final String appDescription;
    String appImagePath = '';
    switch (_appName.trim()) {
      case 'QR_CODE':
        appDescription = 'Scan QR';
        appImagePath = 'assets/images/qr_icon.png';
        break;
      default:
        appDescription = 'Under Construction';
        appImagePath = 'assets/images/under_construction.png';
    }
    return Container(
        alignment: Alignment.center,
        height: screenHeight * 0.15,
        width: screenWidth * 0.25,
        padding: EdgeInsets.only(left: 5, right: 5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            boxShadow: const [
              BoxShadow(
                  color: Color.fromRGBO(196, 135, 198, .3),
                  blurRadius: 20,
                  offset: Offset(0, 10)),
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image(
              image: AssetImage(appImagePath),
              height: screenWidth * 0.1,
              width: screenWidth * 0.1,
            ),
            Text(
              appDescription,
              textAlign: TextAlign.center,
            )
          ],
        ));
  }
}

class CustomAppInkWell extends StatelessWidget {
  final String _appName;

  const CustomAppInkWell(this._appName);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTapEvent();
      },
      child: CustomAppContainer(_appName),
    );
  }
  void onTapEvent() {
    switch (_appName.trim()) {
      case 'QR_CODE':
        AppServices.showToast("Test");
        break;
      default :
        AppServices.showToast("App is under construction. Comeback later!");
    }
  }
}
