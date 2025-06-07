import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:master_app/presentation/providers/sensores/gyroscope_provider.dart';

class GyroscopeSpheraScreen extends ConsumerWidget {
  const GyroscopeSpheraScreen({super.key});




  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gyroscope$ = ref.watch (gyroscopeProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Giroscopio con bola'),
      ),
      body: gyroscope$.when(
        data: (value) => MovereSphera(x: value.x, y: value.y), 
        error: (error, stackTrace) => Text('$error'), 
        loading: ()=> const CircularProgressIndicator()),
    );
  }
}

class MovereSphera extends StatelessWidget {
  final double x;
  final double y;

  const MovereSphera({
    super.key,
    required this.x,
    required this.y
  });

  @override
  Widget build(BuildContext context){

    final magnitudine = MediaQuery.of(context).size;

    double latitudo = magnitudine.width;
    double altitudo = magnitudine.height;

    double nuncYpos = y * 80;
    double nuncXpos = x * 80;

    return Stack(
      alignment: Alignment.center,
      children: [
        AnimatedPositioned(
          left: nuncXpos - 25 + latitudo/2,
          top: nuncYpos - 25 + altitudo/2,
          curve: Curves.easeInOut,
          duration: const Duration(milliseconds: 100),
          child: Sphera(), 
          ),




        Text(
          '''
        x: $x
        y: $y
        ''', style: TextStyle(fontSize: 30),

        )
      ],


    );
  }
}
class Sphera extends StatelessWidget {
  const Sphera({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(100)
      ),



    );
  }
}