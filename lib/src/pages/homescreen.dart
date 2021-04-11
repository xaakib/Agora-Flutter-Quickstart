import 'package:agora_rtc_engine/rtc_engine.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

import '../utils/settings.dart';
import 'call.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<void> joinBrodcaster() async {
    // update input validation

    if ("xaakib".isNotEmpty) {
      // await for camera and mic permissions before pushing video page
      await _handleCameraAndMic(Permission.camera);
      await _handleCameraAndMic(Permission.microphone);
      // push video page with given channel name
      await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CallPage(
            channelName: "xaakib",
            role: ClientRole.Broadcaster,
          ),
        ),
      );
    }
  }

  Future<void> joinAudients() async {
    // update input validation

    if ("xaakib".isNotEmpty) {
      // await for camera and mic permissions before pushing video page
      await _handleCameraAndMic(Permission.camera);
      await _handleCameraAndMic(Permission.microphone);
      // push video page with given channel name
      await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CallPage(
            channelName: "xaakib",
            role: ClientRole.Audience,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Container(
            height: 500,
            child: ListView.builder(
                itemCount: 2,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () {
                      print("CLicked");
                      joinAudients();
                    },
                    title: Text("User 1"),
                    subtitle: Text(Token),
                  );
                }),
          ),
          IconButton(
              icon: Icon(
                Icons.video_call_outlined,
                size: 50,
              ),
              onPressed: () {
                print("Video Camera On");
                joinBrodcaster();
              })
        ],
      ),
    );
  }

  Future<void> _handleCameraAndMic(Permission permission) async {
    final status = await permission.request();
    print(status);
  }
}
