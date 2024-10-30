import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/src/configuracao/cores_customizadas.dart';
import 'package:flutter_app/src/pages/autenticacao/components/campo_texto_customizado.dart';
import 'package:flutter_app/src/pages/base/base_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final tamanho = MediaQuery.of(context).size;

    print('Altura: ${tamanho.height} - largura: ${tamanho.width}');

    return Scaffold(
      backgroundColor: CoresCustomizadas.corAppCustomizada,
      body: SingleChildScrollView(
        child: SizedBox(
          height: tamanho.height,
          child: Column(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text.rich(
                      TextSpan(
                        style: const TextStyle(fontSize: 35), 
                        children: [
                          const TextSpan(
                            text: 'Hortifruti', 
                            style: TextStyle(
                              color: Colors.white, 
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
                    SizedBox(
                      height: 32,
                      child: DefaultTextStyle(
                        style: const TextStyle(
                          fontSize: 25,
                          color: Colors.white,
                        ),
                        child: AnimatedTextKit(
                          pause: Duration.zero,
                          repeatForever: true,
                          animatedTexts: [
                            FadeAnimatedText(
                              'Frutas',
                            ),
                            FadeAnimatedText(
                              'Verduras',
                            ),
                            FadeAnimatedText(
                              'Legumes',
                            ),
                            FadeAnimatedText(
                              'Carnes',
                            ),
                            FadeAnimatedText(
                              'Cereais',
                            ),
                            FadeAnimatedText(
                              'Laticíneos',
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: 40,
                ),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(45),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Email
                    const CampoTextoCustomizado(
                      label: 'Email', 
                      icon: Icons.email,
                    ),
                    // Senha
                    const CampoTextoCustomizado(
                      label: 'Senha', 
                      icon: Icons.lock,
                      isSecret: true,
                    ),
                    // Nome
                    const CampoTextoCustomizado(
                      label: 'Nome', 
                      icon: Icons.person,
                    ),
                    // Telefone
                    const CampoTextoCustomizado(
                      label: 'Telefone', 
                      icon: Icons.phone,
                    ),
                    // CPF
                    const CampoTextoCustomizado(
                      label: 'CPF', 
                      icon: Icons.credit_card,
                    ),

                    // Botão entrar
                    SizedBox(
                      height: 50,
                      child: ElevatedButton(
                        onPressed: (){
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (c) {
                              return BaseScreen();
                            })
                          );
                        }, 
                        child: const Text(
                          'Entrar', 
                          style: TextStyle(
                            fontSize: 20),
                          ),
                      ),
                    ),

                    // Link Esqueceu a senha?
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: (){}, 
                        child: Text (
                          'Esqueceu a senha?',
                          style: TextStyle(color: CoresCustomizadas.corContrasteCustomizada),
                        ),
                      ),
                    ),

                    //Divisor

                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        children: [
                          Expanded(
                            child: Divider(
                              color: Colors.grey.withAlpha(90),
                              thickness: 2,
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(bottom: 15),
                            child: Text('Ou'),
                          ),
                          Expanded(
                            child: Divider(
                              color: Colors.grey.withAlpha(90),
                              thickness: 2,
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Botão novo usuário
                    SizedBox(
                      height: 50,
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18),
                          ),
                          side: BorderSide(
                            width: 3,
                            color: CoresCustomizadas.corAppCustomizada,
                          )
                        ),
                        onPressed: (){},
                        child: Text(
                          'Criar conta',
                          style: TextStyle(
                            fontSize: 18,
                            color: CoresCustomizadas.corAppCustomizada,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}