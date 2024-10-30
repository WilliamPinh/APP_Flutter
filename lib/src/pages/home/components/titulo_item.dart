import 'package:flutter/material.dart';
import 'package:flutter_app/src/configuracao/cores_customizadas.dart';
import 'package:flutter_app/src/modelo/modelo_item.dart';
import 'package:flutter_app/src/pages/produto/produto_screen.dart';
import 'package:flutter_app/src/services/servicos_uteis.dart';

class TituloItem extends StatelessWidget {
  TituloItem({super.key, required this.item});

  final ModeloItem item;
  final ServicosUteis servicos = ServicosUteis();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (c) {
              return ProdutoScreen(item: item);
            }));
          },
          child: Card(
            elevation: 1,
            shadowColor: Colors.grey.shade300,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  //image
                  Expanded(child: Hero(
                    tag: item.urlImagem, 
                    child: Image.asset(item.urlImagem),
                    ),
                  ),
                  //nome
                  Text(item.nomeItem, 
                    style: const TextStyle(
                      fontSize: 16, 
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  //preço - unidade
                  Row(
                    children: [
                      Text(
                        servicos.precoParaMoeda(item.preco), 
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: CoresCustomizadas.corAppCustomizada,
                        ),
                      ),
                      Text(
                        '/${item.tipoUnidade}', 
                        style: TextStyle(
                          color: Colors.grey.shade500, 
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),

        Positioned(
          top: 4,
          right: 4,
          child: GestureDetector(
            onTap: () {
              print('Item selecionado: ${item.nomeItem}');
            },
            child: Container(
              height: 40,
              width: 36,
              decoration: BoxDecoration(
                color: CoresCustomizadas.corAppCustomizada,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  topRight: Radius.circular(20),
                ),
              ),
              child: const Icon(
                Icons.add_shopping_cart_outlined, 
                color: Colors.white, 
                size: 20,
              ),
            ),
          )
        )
      ],
    );
  }
}