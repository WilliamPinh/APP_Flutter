import 'package:flutter/material.dart';
import 'package:flutter_app/src/configuracao/cores_customizadas.dart';
import 'package:flutter_app/src/modelo/modelo_item.dart';
import 'package:flutter_app/src/pages/commom_widgets/quantidade_widgets.dart';
import 'package:flutter_app/src/services/servicos_uteis.dart';

class ProdutoScreen extends StatefulWidget {
  const ProdutoScreen({super.key, required this.item});

  final ModeloItem item;

  @override
  State<ProdutoScreen> createState() => _ProdutoScreenState();
}

class _ProdutoScreenState extends State<ProdutoScreen> {
  final ServicosUteis services = ServicosUteis();

  int totalQuantidadeCarrinho = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white.withAlpha(130),
        body: Stack(
          children: [
            Column(
              children: [
                Expanded(
                  child: Hero(
                    tag: widget.item.urlImagem, 
                  child: Image.asset(widget.item.urlImagem),
                  ),
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
                                widget.item.nomeItem,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                              ),
                            ),
                            QuantidadeWidget(
                              valor: totalQuantidadeCarrinho,
                              tipo: widget.item.tipoUnidade,
                              resultadoTotal: (quantidade) {
                                setState(() {
                                  totalQuantidadeCarrinho = quantidade;
                                });
                              },
                            ),
                          ],
                        ),   
                      //preço
                      Text(
                        services.precoParaMoeda(widget.item.preco),
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
                              widget.item.descricao,
                              style: const TextStyle(
                                height: 1.5,
                              ),
                            ),
                          ),
                        ),
                      ),

                      // Botão
                      SizedBox(
                        height: 50,
                        child: ElevatedButton.icon(
                          onPressed: () {},
                          icon: Icon(Icons.shopping_cart_checkout_outlined),
                          label: const Text('Add no carrinho'),
                        ),
                      ),
                    ],
                  ),


                  ),
                ),
              ],
            ),
            Positioned(
              left: 10,
              top: 10,
              child: SafeArea(
                child: IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: const Icon(Icons.arrow_back_ios),
                ),
              ),
            ),
          ],
        ),
    );
  }
}