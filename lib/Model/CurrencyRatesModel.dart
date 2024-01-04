import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class CurrencyRatesModel with ChangeNotifier{

  String? dollarBuy  = '';
  String? dollarSell = '';
  String? dollarHigh = '';
  String? dollarLow = '';
  String? gbpBuy = '';
  String? gbpSell = '';
  String? euroBuy = '';
  String? euroSell = '';
  String? malayBuy = '';
  String? malaySell = '';
  String? riyalBuy = '';
  String? riyalSell = '';
  String? dirhamBuy = '';
  String? dirhamSell = '';
  String? dollarInterBankBuy = '';
  String? dollarInterBankSell = '';
  String? dollarUpdateTime = '';
  String? result = '';
  String? interBankRateSetting = '';

Future<void> getCurrencyRates() async {
  final url = Uri.parse('https://goldapp-4827a-default-rtdb.firebaseio.com/currency.json');

   try { final response = await http.get(url);
     final responseData =  json.decode(response.body) as Map<String , dynamic>;
   dirhamSell = responseData['dirhamSell'];
   dirhamBuy = responseData['dirhamBuy'];
   dollarBuy = responseData['dollarBuy'];
   dollarInterBankBuy = responseData['dollarInterBankBuy'];
   dollarInterBankSell = responseData['dollarInterBankSell'];
   dollarSell = responseData['dollarSell'];
   dollarUpdateTime = responseData['dollarUpdateTime'];
   euroBuy = responseData['euroBuy'];
   euroSell = responseData['euroSell'];
   gbpBuy = responseData['gbpBuy'];
   gbpSell = responseData['gbpSell'];
   malayBuy = responseData['malayBuy'];
   malaySell = responseData['malaySell'];
   riyalBuy = responseData['riyalBuy'];
   riyalSell = responseData['riyalSell'];
   notifyListeners();
   } catch(error){
     throw(error);
   }

}


}
