import 'dart:html';

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController _controllerAlcool = TextEditingController();
  final TextEditingController _controllerGasolina = TextEditingController();
  String resultado = "";

  void _calcular() {
    double? precoAlcool = double.tryParse(_controllerAlcool.text);
    double? precoGasolina = double.tryParse(_controllerGasolina.text);
    if (precoAlcool == null || precoGasolina == null) {
      setState(() {
        resultado = "Erro ao calcular";
      });
    } else {
      if((precoAlcool/precoGasolina) >= 0.7){
        setState(() {
          resultado = "É melhor abastecer com gasolina";
        });
      }
      else{
        setState(() {
          resultado = "É melhor abastecer com alcool";
        });
      }
    }
    limpar();
  }
  void limpar(){
    setState(() {
      _controllerAlcool.text = "";
      _controllerGasolina.text = "";
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Álcool ou Gasolina"),
      ),
      body: Container(
        padding: const EdgeInsets.all(32),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 32),
                child: Image.asset("assets/logo.png"),
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Text(
                  "Saiba qual a melhor opção para abastecimento do seu carro",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
              TextField(
                keyboardType: TextInputType.number,
                controller: _controllerAlcool,
                decoration:
                    const InputDecoration(labelText: "Preço Álcool, ex: 1.59"),
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
              TextField(
                controller: _controllerGasolina,
                decoration: const InputDecoration(
                    labelText: "Preço Gasolina, ex : 3.15"),
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: ElevatedButton(
                  onPressed: _calcular,
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all(
                      const EdgeInsets.all(22),
                    ),
                  ),
                  child: const Text(
                    "Calcular",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 15),
                child: Row(
                  children: [
                    const Text(
                      "Resultado",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    if(resultado != "")
                    Text(": " + resultado, style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),)
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
