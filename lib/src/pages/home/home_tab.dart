
import 'package:flutter/material.dart';
import 'package:flutter_app/src/configuracao/cores_customizadas.dart';
import 'package:flutter_app/src/pages/home/components/titulo_categoria.dart';
import 'package:flutter_app/src/configuracao/dados_app.dart' as dadosApp;
import 'package:flutter_app/src/pages/home/components/titulo_item.dart';

class HomeTab extends StatefulWidget {
  HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {

  String categoriaSelecionada = 'Verduras';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withAlpha(190),
      appBar: AppBar(
        centerTitle: true,
        title: Text.rich(
          TextSpan(
            style: const TextStyle(fontSize: 35), 
            children: [
              TextSpan(
                text: 'Hortifruti', 
                style: TextStyle(
                  color: CoresCustomizadas.corAppCustomizada, 
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextSpan(
                text: 'comunitária', 
                style: TextStyle(color: CoresCustomizadas.corContrasteCustomizada),
              ),
            ],
          ),
        ),

        actions: [
          Padding(
            padding: const EdgeInsets.only(
              top: 15, 
              right: 15,
            ),
            child: Icon(
              Icons.shopping_cart, 
              color: CoresCustomizadas.corAppCustomizada,
            ),
          )
        ],
      ),

      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20, 
              vertical: 10,
            ),
            child: TextFormField(
              decoration: InputDecoration(
                isDense: true,
                filled: true,
                fillColor: Colors.white,
                hintText: 'Faça sua pesquisa aqui...',
                hintStyle: TextStyle(
                  color: Colors.grey, 
                  fontSize: 16,
                ),
                prefixIcon: Icon(
                  Icons.search, 
                  color: CoresCustomizadas.corContrasteCustomizada,
                  size: 24,
                ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(60),
                    borderSide: const BorderSide(width: 0, style: BorderStyle.none)
                ),
              ),
            ),
          ),

          //Categorias
          Container(
            padding: const EdgeInsets.only(left: 25),
            height: 40,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, index){
                return TituloCategoria(
                  onPressed: () {
                    setState(() {
                      categoriaSelecionada = dadosApp.categias[index];
                    });
                  },
                  categoria: dadosApp.categias[index],
                  foiSelecionada: dadosApp.categias[index] == categoriaSelecionada,
                );
              },
              separatorBuilder: (_, index) => const SizedBox(
                width: 10,),
              itemCount: dadosApp.categias.length,
            ),
          ),

          // Grid de produtos
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
              physics: const BouncingScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: (9 / 12.5),
            ),
                  itemCount: dadosApp.items.length,
              itemBuilder: (_,index){
                return TituloItem(
                  item: dadosApp.items[index],
                );
              },
            ),
          ),
        ]
      ),
    );
  }
}