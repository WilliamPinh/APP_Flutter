import 'package:intl/intl.dart';

class ServicosUteis {

  // Converte o preço para a moeda corrente
  
  String precoParaMoeda(double preco) {
    NumberFormat numberFormat = NumberFormat.simpleCurrency(locale: 'pt_BR');
    return numberFormat.format(preco);
  }
}