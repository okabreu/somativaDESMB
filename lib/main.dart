import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 66, 183, 58)),
        useMaterial3: true,
      ),
      home: const Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 66, 198, 136),
        title: const Text("SVAR - Hospedagenss"),
      ),
      body: ListView(
        children: [
          Destino("Angra dos Reis", "assets/images/angra.jpg", 384, 70),
          Divider(),
          Destino("Jericoacoara", "assets/images/jericoacoara.jpg", 571, 75),
          Divider(),
          Destino("Arraial do Cabo", "assets/images/arraial.jpg", 534, 65),
          Divider(),
          Destino("Florianópolis", "assets/images/florianopolis.jpg", 348, 85),
          Divider(),
          Destino("Madrid", "assets/images/madrid.jpg", 401, 85),
          Divider(),
          Destino("Paris", "assets/images/paris.jpg", 546, 95),
          Divider(),
          Destino("Orlando", "assets/images/orlando.jpg", 616, 105),
          Divider(),
          Destino("Las Vegas", "assets/images/lasvegas.jpg", 504, 110),
          Divider(),
          Destino("Roma", "assets/images/roma.jpg", 478, 85),
          Divider(),
          Destino("Chile", "assets/images/chile.jpg", 446, 95),
        ],
      ),
    );
  }
}

class Destino extends StatefulWidget {
  final String nome_c;
  final String img;
  final int preco;
  final int valorPessoa;

  Destino(this.nome_c, this.img, this.preco, this.valorPessoa, {Key? key})
      : super(key: key);

  @override
  _DestinoState createState() => _DestinoState();
}

class _DestinoState extends State<Destino> {
  String? mensagem;
  int qtdD = 0;
  int qtdP = 0;
  int valorTotal = 0;

  void _incqtdD() {
    setState(() {
      qtdD++;
    });
  }

  void _incqtdP() {
    setState(() {
      qtdP++;
    });
  }

  void _calctotal() {
    setState(() {
      valorTotal = (qtdD * widget.preco) + (qtdP * widget.valorPessoa);
    });
  }

  void _limparVariaveis() {
    setState(() {
      qtdD = 0;
      qtdP = 0;
      valorTotal = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          widget.nome_c,
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        Container(
          width: 300,
          height: 250,
          child: Image.asset(
            widget.img,
            fit: BoxFit.fill,
          ),
        ),
        Text(
          "VALOR DIÁRIA: ${widget.preco} \nVALOR POR PESSOA: ${widget.valorPessoa}",
          style: TextStyle(fontSize: 20),
          textAlign: TextAlign.center,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: Colors.white,
              width: 300,
              height: 40,
              child: Text(
                "DIAS: $qtdD",
                style: TextStyle(fontSize: 20),
                textAlign: TextAlign.center,
              ),
            ),
            ElevatedButton(onPressed: _incqtdD, child: Icon(Icons.add)),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: Colors.white,
              width: 300,
              height: 40,
              child: Text(
                "Pessoas: $qtdP",
                style: TextStyle(fontSize: 20),
                textAlign: TextAlign.center,
              ),
            ),
            ElevatedButton(onPressed: _incqtdP, child: Icon(Icons.add)),
          ],
        ),
        Container(
          color: Colors.white,
          width: 300,
          height: 80,
          child: Text(
            "Valor total R\$: $valorTotal",
            style: TextStyle(fontSize: 20),
            textAlign: TextAlign.center,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: _calctotal,
              child: Text("Calcular Total"),
            ),
            SizedBox(width: 10), // Adiciona um espaço entre os botões
            ElevatedButton(
              onPressed: _limparVariaveis,
              child: Text("Limpar Variáveis"),
            ),
          ],
        ),
        Divider(), // Adiciona um separador após cada destino
      ],
    );
  }
}
