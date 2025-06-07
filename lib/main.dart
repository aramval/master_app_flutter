import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:master_app/config/config.dart';
import 'package:master_app/presentation/providers/theme_provider.dart';



void main() {
  runApp(
    const ProviderScope(
      child: MainApp(),
    )
  );
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final bool estTenebrisModusEst = ref.watch(estTenebrisModusProvider);
    final electusColor = ref.watch(electusColorProvider);
    return MaterialApp.router(
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
      theme: AppTheme(electusColor: electusColor, tenebrisModusEst: estTenebrisModusEst).getTheme(),
    

      
    );
}
}
