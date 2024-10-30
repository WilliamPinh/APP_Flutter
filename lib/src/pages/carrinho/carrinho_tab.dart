import 'package:flutter/material.dart';
import 'package:flutter_app/src/configuracao/cores_customizadas.dart';
import 'package:flutter_app/src/modelo/modelo_item_carrinho.dart';
import 'package:flutter_app/src/pages/carrinho/components/titulo_carrinho.dart';
import 'package:flutter_app/src/services/servicos_uteis.dart';
import 'package:flutter_app/src/configuracao/dados_app.dart' as dadosApp;

class CarrinhoTab extends StatefulWidget {
  const CarrinhoTab({super.key});

  @override
  State<CarrinhoTab> createState() => _CarrinhoTabState();
}

class _CarrinhoTabState extends State<CarrinhoTab> {
  final ServicosUteis services = ServicosUteis();

  void removerItemCarrinho(ModeloItemCarrinho itemCarrinho) {
    setState((){
      dadosApp.itemsCarrinho.remove(itemCarrinho);
    });
  }

  double precoTotalCarrinho() {
    double total = 0;
    for (var item in dadosApp.itemsCarrinho) {
      total += item.precoTotal();
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CoresCustomizadas.corAppCustomizada,
        title: const Text(
          'Carrinho', 
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          //Lista de compras
          Expanded(
            child: ListView.builder(
            itemCount: dadosApp.itemsCarrinho.length,
            itemBuilder: (_, index) {
              return TituloCarrinho(
                itemCarrinho: dadosApp.itemsCarrinho[index],
                remover: removerItemCarrinho,
              );
            }
            ),
          ),
          Container(
            padding: const EdgeInsets.all(18),
            decoration: const BoxDecoration(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(30)
            ),
              boxShadow: [
                BoxShadow(
                  color: Colors.white,
                  blurRadius: 3,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  'Total geral', 
                  style: TextStyle(
                    fontSize: 12, 
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  services.precoParaMoeda(precoTotalCarrinho()), 
                  style: TextStyle(
                    fontSize: 24, 
                    color: CoresCustomizadas.corAppCustomizada,
                  ),
                ),
                SizedBox(
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {}, 
                    child: const Text(
                      'Concluir pedido', 
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}