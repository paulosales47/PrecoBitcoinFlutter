import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  String _valorBitCoinReais = "";
  String _valorBitCoinDolar = "";

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Image.asset("images/bitcoin.png", height: 80,),
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              _valorBitCoinReais,
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  decoration: TextDecoration.none
              ),),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 32),
            child: Text(
              _valorBitCoinDolar,
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  decoration: TextDecoration.none
              ),),
          ),
          RaisedButton(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Text("Atualizar", style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold
              ),),
            ),
            color: Colors.orange,
            textColor: Colors.white,
            onPressed: _atualizarValorBitCoin,
          )
        ],
      ),
    );
  }

  void _atualizarValorBitCoin() async{
    String _urlRequisicao = "https://blockchain.info/ticker";
    http.Response response;

    response = await http.get(_urlRequisicao);

    Map<String, dynamic> retorno = jsonDecode(response.body);
    _valorBitCoinReais = "${retorno["BRL"]["symbol"]}:${retorno["BRL"]["buy"]}";
    _valorBitCoinDolar = "${retorno["USD"]["symbol"]}:${retorno["USD"]["buy"]}";
    setState(() {});



  }
}
