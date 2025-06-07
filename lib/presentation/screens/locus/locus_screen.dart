import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:master_app/presentation/providers/providers.dart';

class LocusScreen extends ConsumerWidget {
  const LocusScreen({super.key});



  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final userLocusAsync = ref.watch(userLocusProvider);
    final vigiliaLocusAsync = ref.watch(vigiliaLocusProvider);

    return Scaffold(
appBar: AppBar(
  title: Text('Localización'),
),
body: Center(
  child: Column(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      Column(
        spacing: 15,
        children: [
          Text('Ubicación,', style: TextStyle(fontSize: 35, color: Colors.grey)),
          userLocusAsync.when(
            data:(data) => Text('$data', style: TextStyle(fontSize: 25),),
            error: (error, stackTrace) => Text('$error'),
            loading: () => CircularProgressIndicator(),
            
            ),
          Text('39.245367, -0.34560987', style: TextStyle(fontSize: 25),)
        ],
      ),
      Column(
        children: [
          Text('Seguimiento,', style: TextStyle(fontSize: 35, color: Colors.grey)),
            vigiliaLocusAsync.when(
            data:(data) => Text('$data', style: TextStyle(fontSize: 25),),
            error: (error, stackTrace) => Text('$error'),
            loading: () => CircularProgressIndicator(),
            
            )
        ],
      ),


    ],),
),

    );
  }
}

