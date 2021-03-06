import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:food_list_demo/models/pizza.dart';

class HttpHelper {
  final String server = 'pizzas.mocklab.io';
  final String getPath = 'pizza';
  final String postPath = 'pizza';
  final String putPath = 'pizza';
  final String deletePath = 'pizza';

  Future<List<Pizza>> getPizzaList() async {
    Uri url = Uri.https(server, getPath);
    http.Response result = await http.get(url);
    if (result.statusCode == HttpStatus.ok) {
      final jsonResponse = json.decode(result.body);
      //provide a type argument to the map method to avoid type error
      List<Pizza> pizzas =
          jsonResponse.map<Pizza>((i) => Pizza.fromJson(i)).toList();
      return pizzas;
    } else {
      return [];
    }
  }

  Future<http.Response> postPizza(Pizza pizza) {
    String post = json.encode(pizza.toJson());
    Uri url = Uri.https(server, postPath);

    return http.post(
      url,
    );
  }

  Future<http.Response> putPizza(Pizza pizza) async {
    String put = json.encode(pizza.toJson());
    Uri url = Uri.https(server, putPath);

    return http.put(
      url,
    );
  }

  Future<http.Response> deletePizza(int id) async {
    Uri url = Uri.https(server, deletePath);
    return http.delete(url);
  }
}
