import 'dart:convert';
import 'package:cashino/pages/addpage.dart';
import 'package:http/http.dart' as http;
Future<void> snedtxt(String? rectext) async{
       const String serverUrl = "http://10.0.2.2:5000/process";
      final Uri url = Uri.parse(serverUrl);
      Map<String,String> headers = {"Content-type":"application/json"};
         Map<String,String> body = {"rectext":rectext!};
         String jBody = jsonEncode(body);
         try{
        final response = await http.post(url,headers: headers,body : jBody);
        if (response.statusCode == 200) {
          final Map<String,dynamic> data = jsonDecode(response.body);
         final String amount = (data['total'] is List && data['total'].isNotEmpty)
          ? data['total'][0].toString()
          : data['total'].toString();
         DataHandling.handleData(data['org'],"-"+amount);
        }
         }
         catch(e){
          print('Error sending request: $e');
         }
          ;


}