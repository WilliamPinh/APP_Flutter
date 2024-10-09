import 'package:flutter/material.dart';
import 'package:flutter_app/src/configuracao/cores_customizadas.dart';
import 'package:flutter_app/src/modelo/modelo_item.dart';
import 'package:flutter_app/src/services/servicos_uteis.dart';

class ProdutoScreen extends StatelessWidget {
  ProdutoScreen({super.key, required this.item});

  final ModeloItem item;

  final ServicosUteis services = ServicosUteis();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white.withAlpha(130),
        body: Column(
          children: [
            Expanded(
              child: Image.asset(item.urlImagem),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(32),
                decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(50),
               ),
               boxShadow: [
                BoxShadow(color: Colors.grey.shade600,
                offset: const Offset(0, 3)),
               ]
              ),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Nome - Quantidade
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            item.nomeItem,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          height: 30, 
                          width: 70, 
                          color: Colors.blue,
                        ),
                      ],
                    ),   
                  //preço
                  Text(
                    services.precoParaMoeda(item.preco),
                    style: TextStyle(
                      fontSize: 24, 
                      fontWeight: FontWeight.bold,
                      color: CoresCustomizadas.corAppCustomizada,
                    ),
                  ),
                  // Descrição
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: SingleChildScrollView(
                        child: Text(
                          item.descricao,
                          style: const TextStyle(
                            height: 1.5,
                          ),
                        ),
                      ),
                    ),
                  ),
                  // Botão
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('Add no carrinho'),
                  ),
                ],
              ),


            ),
          ),
        ],
      ),
    );
  }
}