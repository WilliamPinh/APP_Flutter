import 'package:flutter/material.dart';
import 'package:flutter_app/src/configuracao/cores_customizadas.dart';

class QuantidadeWidget extends StatelessWidget {
  final int valor;
  final String tipo;
  final Function(int quantidade) resultadoTotal;
  final bool podeRemover;

  const QuantidadeWidget({
    super.key, 
    required this.valor, 
    required this.tipo, 
    required this.resultadoTotal,
    this.podeRemover = false,
  });

  @override
  Widget build(BuildContext context) {
    
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade400,
            spreadRadius: 1,
            blurRadius: 2,
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          BotaoQuantidade(
            color: !podeRemover || valor > 1 ? Colors.grey: Colors.red, 
            icon: !podeRemover || valor > 1 ? Icons.remove: Icons.delete_forever, 
            onPressed: (){
            if(valor == 1 && !podeRemover)return;
            
            int total = valor - 1;
            resultadoTotal(total);
          },),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              '$valor$tipo',
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
          ),

          BotaoQuantidade(color: CoresCustomizadas.corAppCustomizada, icon: Icons.add, onPressed: (){
            int total = valor + 1;
            resultadoTotal(total);
          },),
        ]
      ),
    );
  }
}

class BotaoQuantidade extends StatelessWidget {

  final Color color;
  final IconData icon;
  final VoidCallback onPressed;

  const BotaoQuantidade({
    required this.color, required this.icon, required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        borderRadius: BorderRadius.circular(30),
        onTap: onPressed,
        child: Container(
          height: 30,
          width: 30,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
          child: Icon( icon,
            color: Colors.white,
            size: 17,
          )
        )
      ),
    );
  }
}