import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Variável para controlar a posição do Container
  double _containerOffset = 0.0;

  @override
  void initState() {
    super.initState();
    // Inicia a animação após um pequeno atraso
    Future.delayed(Duration(milliseconds: 100), () {
      setState(() {
        _containerOffset = 100.0; // Altera a posição para 0 quando inicia
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 100), // Espaço acima da logo
                Image.asset('assets/logo.png', width: 300), // Logo
                const SizedBox(height: 80), // Espaço entre a logo e o texto
                const SizedBox(height: 20), // Espaço entre o nome e o container
              ],
            ),
            AnimatedPositioned(
              duration: const Duration(milliseconds: 1000),
              curve: Curves.easeInOut,
              bottom: _containerOffset, // Anima a posição do container
              child: Container(
                width: MediaQuery.of(context).size.width *
                    1, // Ocupa toda a largura
                decoration: const BoxDecoration(
                  color: Colors.orange, // Cor de fundo
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(90), // Bordas arredondadas em cima
                  ),
                ),
                child: const Center(
                  child: Text(
                    'Olá, seja bem-vindo!',
                    style: TextStyle(
                      color: Colors.white, // Cor do texto
                      fontSize: 18,
                    ),
                    textAlign: TextAlign.center, // Centraliza o texto
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
