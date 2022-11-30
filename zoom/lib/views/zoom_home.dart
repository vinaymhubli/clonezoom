import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:zoom/resources/auth.dart';
import 'package:zoom/utils/colors.dart';
import 'package:zoom/views/meeting_history.dart';
import 'package:zoom/views/meeting_screen.dart';
import 'package:zoom/widget/button.dart';
class ZoomHome extends StatefulWidget {
  ZoomHome({Key? key}) : super(key: key);

  @override
  State<ZoomHome> createState() => _ZoomHomeState();
}

class _ZoomHomeState extends State<ZoomHome> {
  int _page=0;
  onpageChanged(int page){
  setState(() {
    _page=page;
  });
  }
   List<Widget> pages = [
    MeetingScreen(),
    HistoryMeetingScreen(),
    Center(child: Column(
      children: [
      Lottie.asset("assets/images/logout.json"),
        Button(text: 'Log Out', onPressed: ()=>AuthMethods().signOut()),

      ],
    )),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.dark),
        backgroundColor: backgroundColor,
        elevation: 0.0,
        centerTitle: true,
        title: Text("zoom",style: GoogleFonts.lato(
    textStyle: TextStyle(color: Colors.blue, letterSpacing: .4,fontSize: 40,fontWeight: FontWeight.bold),
  ),),
      ),
      body: pages[_page],
      bottomNavigationBar:  BottomNavigationBar(
        backgroundColor: backgroundColor,
        selectedItemColor: buttonColor,
        unselectedItemColor: secondaryBackgroundColor,
        onTap: onpageChanged,
        currentIndex: _page,
        unselectedFontSize:8,
        showSelectedLabels: true,
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
        selectedIconTheme: IconThemeData(size: 35,shadows: <Shadow>[Shadow(color: Color.fromARGB(255, 4, 63, 164), blurRadius: 75.0)]),
        items: [
        BottomNavigationBarItem(icon: Icon(Icons.comment_bank_outlined),label: "Meeting"),
        BottomNavigationBarItem(icon: Icon(Icons.history_outlined),label: "History"),
       BottomNavigationBarItem(icon: Icon(Icons.settings_outlined),label: "Settings"),



      ]),
    );
  }
}