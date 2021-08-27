import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  TextEditingController _controllerAlcool = TextEditingController();
  TextEditingController _controllerGasolina = TextEditingController();
  String _textoResultado = "";

  void _calcular(){

    double? precoAlcool = double.tryParse(_controllerAlcool.text);
    double? precoGasolina = double.tryParse(_controllerGasolina.text);


    if(precoAlcool == null || precoGasolina == null){
      setState(() {
        _textoResultado = "Número inválido, digite números maiores que 0 e utilizando (.).";
      });
    }else{
      /*Se o preço do álcool dividido pelo preço da gasolina
      * for >= a 0.7 é melhor abastecer com gasolina, caso contrário
      * melhor usar ácool.
      * */

      if((precoAlcool / precoGasolina) >= 0.7){
        setState(() {
          _textoResultado = "Melhor abastecer com álcool!";
        });
      }else{
        setState(() {
          _textoResultado = "Melhor abastecer com gasolina!";
        });
      }

      //Caso queira limpar os campos após os calculos.
      //_limparCampos();

    }

  }

  void _limparCampos(){
    _controllerGasolina.text = "";
    _controllerAlcool.text = "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Alcool ou gasolina"),
        backgroundColor: Colors.blue,
      ),
      body: Container(

        child: SingleChildScrollView(
          padding: EdgeInsets.all(32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(bottom: 32),
                child: Image.asset("imagens/logo.png"),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Text(
                  "Saiba qual a melhor opção para o seu bolso!",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: "Preco Alcool, ex: 1.59"
                ),
                style: TextStyle(
                    fontSize: 15
                ),
                controller: _controllerAlcool,
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: "Preco Gasolina, ex: 1.59"
                ),
                style: TextStyle(
                    fontSize: 15
                ),
                controller: _controllerGasolina,
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.lightBlue,
                      onPrimary: Colors.white
                  ),
                  child: Text(
                      "Calcular",
                    style: TextStyle(fontSize: 18),
                  ),
                  onPressed: (){_calcular();},
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: Text(
                  _textoResultado,
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
