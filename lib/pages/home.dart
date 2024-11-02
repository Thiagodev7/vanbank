import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double _containerOffset = 300.0; // Começa fora da tela (abaixo)
  bool _showMessage = false; // Controla a exibição da mensagem
  bool _showButtons = false; // Controla a exibição dos botões

  @override
  void initState() {
    super.initState();
    // Inicia a animação após um pequeno atraso
    Future.delayed(Duration(milliseconds: 100), () {
      setState(() {
        _containerOffset = 0.0; // Muda a posição para 0 para aparecer na tela
      });

      // Espera a animação do container terminar para mostrar a mensagem e os botões
      Future.delayed(Duration(milliseconds: 1000), () {
        setState(() {
          _showMessage = true; // Mostra a mensagem após a animação
        });
        // Future.delayed(Duration(milliseconds: 1000), () {
        //   setState(() {
        //     _showButtons = true; // Mostra os botões após um pequeno atraso
        //   });
        // });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 100), // Espaço acima da logo
          AnimatedOpacity(
            opacity: _showMessage ? 1.0 : 0.0,
            duration: const Duration(milliseconds: 500),
            child: Image.asset('assets/logo.png', width: 400), // Logo
          ),
          const SizedBox(height: 30), // Espaço entre a logo e o texto
          AnimatedOpacity(
            opacity: _showMessage ? 1.0 : 0.0,
            duration: const Duration(milliseconds: 500),
            child: Center(
              child: Text(
                'VANBANK',
                style: TextStyle(
                  color: Color(0xFFFFC7D45), // Cor do texto
                  fontSize: 80, // Tamanho do texto
                  fontWeight: FontWeight.bold, // Deixa o texto em negrito
                ),
              ),
            ),
          ),
          Expanded(
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 1000),
              curve: Curves.easeInOut,
              transform: Matrix4.translationValues(0, _containerOffset, 0),
              height: MediaQuery.of(context).size.height * 0.5, // 50% da altura
              width: MediaQuery.of(context).size.width, // Ocupa toda a largura
              decoration: const BoxDecoration(
                color: Color(0xFFFFC7D45), // Cor de fundo
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(90), // Bordas arredondadas em cima
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                      child: AnimatedOpacity(
                          opacity: _showMessage ? 1.0 : 0.0,
                          duration: const Duration(milliseconds: 1000),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // Linha à esquerda do texto
                              Container(
                                width: 4, // Largura da linha
                                height: 110, // Altura da linha
                                color: Colors.white, // Cor da linha
                              ),
                              const SizedBox(
                                  width: 10), // Espaço entre a linha e o texto
                              const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Olá,',
                                    style: TextStyle(
                                      color: Colors.white, // Cor do texto
                                      fontSize: 45, // Tamanho do texto
                                    ),
                                  ),
                                  Text(
                                    'seja bem-vindo!',
                                    style: TextStyle(
                                      color: Colors.white, // Cor do texto
                                      fontSize: 45, // Tamanho do texto
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          )) // Não exibe nada antes
                      ),
                  const SizedBox(
                      height: 40), // Espaço entre o texto e os botões
                  // Exibe os botões apenas se _showButtons for true

                  AnimatedOpacity(
                    opacity: _showMessage ? 1.0 : 0.0,
                    duration: const Duration(milliseconds: 1000),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            // Ação para "Quero abrir uma conta"
                          },
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Color(0xFFFFC7D45),
                            backgroundColor: Colors.white, // Cor do botão
                            padding: EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 10), // Tamanho do botão
                          ),
                          child: const Text(
                            'Quero abrir uma conta',
                            style: TextStyle(
                              fontSize: 30, // Aumente o tamanho do texto
                            ),
                          ),
                        ),
                        const SizedBox(height: 15),
                        ElevatedButton(
                          onPressed: () {
                            // Ação para "Login"
                          },
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Color(0xFFFFC7D45),
                            backgroundColor: Colors.white, // Cor do botão
                            padding: EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 10), // Tamanho do botão
                          ),
                          child: const Text(
                            'Login',
                            style: TextStyle(
                              fontSize: 30, // Aumente o tamanho do texto
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
        ],
      ),
    );
  }
}
