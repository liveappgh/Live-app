import 'package:flutter/material.dart';
import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:firebase_core/firebase_core.dart';

const String agoraAppId = "f768d5d1391544daa85e8358b697c4cb";

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LiveScreen(),
    );
  }
}

class LiveScreen extends StatefulWidget {
  @override
  State<LiveScreen> createState() => _LiveScreenState();
}

class _LiveScreenState extends State<LiveScreen> {
  RtcEngine? _engine;
  bool _isJoined = false;

  @override
  void initState() {
    super.initState();
    initAgora();
  }

  Future<void> initAgora() async {
    await [Permission.camera, Permission.microphone].request();
    _engine = createAgoraRtcEngine();
    await _engine!.initialize(RtcEngineContext(appId: agoraAppId));
    await _engine!.enableVideo();
    await _engine!.joinChannel(token: null, channelId: "test", uid: 0, options: ChannelMediaOptions());
    setState(() => _isJoined = true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Live App")),
      body: Center(child: Text(_isJoined ? "Live Started! Channel: test" : "Joining...")),
    );
  }
}
