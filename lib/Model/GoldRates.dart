import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class GoldRates with ChangeNotifier {
  String? btc = '';
  String? buy22kt = '';
  String? sell22kt = '';
  String? buy24k = '';
  String? gramsGoldBuy = '';
  String? sell24k = '';
  String? gramsGoldSell = '';
  String? buySilver = '';
  String? index = '';

  Future<void> getGoldRates() async {
    try {
      final response = await http.get(Uri.parse(
          'https://goldapp-4827a-default-rtdb.firebaseio.com/goldrate.json'));
      final getGoldRates = jsonDecode(response.body) as Map<String, dynamic>;
      btc = getGoldRates['btc'] as String;
      buy22kt = getGoldRates['buy22kt'] as String;
      sell22kt = getGoldRates['sell22kt'] as String;
      buy24k = getGoldRates['buy24k'] as String;
      gramsGoldBuy = getGoldRates['gramsGoldBuy'] as String;
      sell24k = getGoldRates['sell24k'] as String;
      gramsGoldSell = getGoldRates['gramsGoldSell'] as String;
      index = getGoldRates['index'] as String;
      buySilver = getGoldRates['buySilver'] as String;
      notifyListeners();
    } catch (e) {
      throw (e);
    }
  }
}
