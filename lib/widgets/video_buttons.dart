import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:master_app/config/config.dart';

class VideoButtons extends StatelessWidget {
  final VideoPost video;

  const VideoButtons({
    super.key,
    required this.video
  });

@override
Widget build(BuildContext context) {
  return Column(
    children: [
      _PropriumButton(valorem: video.likes, iconData:Icons.favorite, iconColor: Colors.red,),
      const SizedBox(height: 20),
      _PropriumButton(valorem: video.views, iconData:Icons.remove_red_eye_outlined),
      const SizedBox(height: 20),

      SpinPerfect(
        infinite: true,

        duration: const Duration(seconds: 5),
        child: _PropriumButton(valorem: 0, iconData: Icons.play_circle_outline))
      
    ]
   
  );
}
}

class _PropriumButton extends StatelessWidget {
  final int valorem;
  final IconData iconData;
  final Color? color;


  const _PropriumButton({
    required this.valorem,
    required this.iconData,

    iconColor
   
  }):color = iconColor ?? Colors.white;

  @override
  Widget build(BuildContext context) {
    return Column(
    children: [
    IconButton(
      onPressed: () {}, 
      icon: Icon(iconData, color: color, size: 30,)),
      if(valorem >0)
      Text
      (IntelligibilisForma.novaFormaNumeri(valorem.toDouble()), 
      style: TextStyle(color: Colors.white),)
    ]
   
  );
  }
}