import 'dart:convert';
import 'package:http/http.dart' as http;
Future<void> snedtxt(String? rectext) async{
       const String serverUrl = "http://10.0.2.2:5000/process";
      final Uri url = Uri.parse(serverUrl);
      Map<String,String> headers = {"Content-type":"application/json"};
         Map<String,String> body = {"rectext":rectext!};
         String jBody = jsonEncode(body);
        await http.post(url,headers: headers,body : jBody).then((response){
       
}
          );


}