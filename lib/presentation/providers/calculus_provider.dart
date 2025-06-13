import 'package:flutter_riverpod/flutter_riverpod.dart';

final calceusProvider = StateNotifierProvider<CalceusNotifier, CalceusState>((ref) => CalceusNotifier());


class CalceusState{
  final String assetImage;
  final double mensura;

  CalceusState({
    this.assetImage = 'assets/imagines/azul.png',
    this.mensura = 9
  });

  CalceusState copyWith({
    String? assetImage,
    double? mensura
  }) {
    return CalceusState(
      assetImage: assetImage ?? this.assetImage,
      mensura: mensura ?? this.mensura);
  }
}

class CalceusNotifier extends StateNotifier<CalceusState> {
  CalceusNotifier(): super(CalceusState());

  void ponereAssetImago(String valorem) {
    state = state.copyWith(assetImage:valorem);
  }
  
  
  void ponereAssetMensura(double valorem) {
    state = state.copyWith(mensura:valorem);
  }
  
}