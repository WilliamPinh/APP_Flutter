import 'package:flutter_app/src/modelo/modelo_item.dart';

class ModeloItemCarrinho{
  ModeloItem item;
  int quantidade;

  ModeloItemCarrinho({
    required this.item,
    required this.quantidade,
  });

  double precoTotal() => item.preco * quantidade;
}