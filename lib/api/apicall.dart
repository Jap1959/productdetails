import 'dart:convert';

import 'package:dummy/Model/productdatamodel.dart';
import 'package:http/http.dart';

class Apicall{
  String apiurl='https://dummyjson.com/products';
    Future<List<Datamodel>> getdata() async{
      Response response=await get(Uri.parse(apiurl));
      if(response.statusCode==200){
        final List json =jsonDecode(response.body)['products'];
        List<Map<String,dynamic>> res=[
          for (final json in result.map((x) => x.toJson()))
            {
              "id":json['id'],
              "title":json['title'],
              "description":json['description'],
              "price":json['price'],
              "discountPercentage":json['discountPercentage'],
              "rating":json['rating'],
              "stock":json['stock'],
              "brand":json['brand'],
              "category":json['category'],
              "images":json['images'][0],
            }
        ];
        print('HIII');
        res.forEach((element) { print(element);});
        return result.map((e) => Datamodel.fromJson(e)).toList();

      }
      else{
        throw Exception(response.reasonPhrase);
      }
    }
}