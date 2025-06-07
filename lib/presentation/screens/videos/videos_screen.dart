import 'package:flutter/material.dart';
import 'package:master_app/config/config.dart';
import 'package:master_app/widgets/widgets.dart';

class VideosScreen extends StatefulWidget{
  const VideosScreen({super.key});

  @override
  State<VideosScreen> createState() => _VideosScreenState();

}

class _VideosScreenState extends State<VideosScreen> {

bool statusPortantes = true;

List<VideoPost> videos = [];

Future<void> portamProximamPaginam() async {
  await Future.delayed(const Duration(seconds: 2));
  videos.addAll(videoPosts);
  statusPortantes = false;
  setState(() {
    
  });
}

@override
  void initState() {
    portamProximamPaginam();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text('Videos Screen'),
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: statusPortantes
        ? const Center(child: CircularProgressIndicator(strokeWidth: 2,),)
        : VideoScrollableView(videos: videos)    );
  }
}