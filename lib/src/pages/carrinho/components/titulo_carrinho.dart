import 'package:flutter/material.dart';
import 'package:flutter_app/src/configuracao/cores_customizadas.dart';
import 'package:flutter_app/src/modelo/modelo_item_carrinho.dart';
import 'package:flutter_app/src/pages/commom_widgets/quantidade_widgets.dart';
import 'package:flutter_app/src/services/servicos_uteis.dart';

class TituloCarrinho extends StatefulWidget {
  final ModeloItemCarrinho itemCarrinho;
  final Function(ModeloItemCarrinho itemCarrinho) remover;
  const TituloCarrinho({
    super.key, 
    required this.itemCarrinho,
    required this.remover,
  });

  @override
  State<TituloCarrinho> createState() => _TituloCarrinhoState();
}

class _TituloCarrinhoState extends State<TituloCarrinho> {
  final ServicosUteis services = ServicosUteis();

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: ListTile(
        // Imagem
        leading: Image.asset(
          widget.itemCarrinho.item.urlImagem, 
          height: 55, 
          width: 55,
        ),

        // TituloCarrinho
        title: Text(
          widget.itemCarrinho.item.nomeItem,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),

        // Total
        subtitle: Text(
          services.precoParaMoeda(widget.itemCarrinho.precoTotal()),
          style: TextStyle(
            color: CoresCustomizadas.corAppCustomizada,
            fontWeight: FontWeight.bold,
          ),
        ),

        // Quantidade
        trailing: QuantidadeWidget(
          valor: widget.itemCarrinho.quantidade,
          tipo: widget.itemCarrinho.item.tipoUnidade,
          podeRemover: true,
          resultadoTotal: (quantidade) {
            setState((){
              widget.itemCarrinho.quantidade = quantidade;
              if (quantidade == 0) {
                // Remover o item do carrinho
                widget.remover(widget.itemCarrinho);
              }
            });
          },
        ),
      ),
    );
  }
}