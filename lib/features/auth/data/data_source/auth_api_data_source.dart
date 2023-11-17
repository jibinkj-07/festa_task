import 'dart:convert';
import 'dart:developer';
import '../../../../core/utils/constants/api_endpoints.dart';
import '../../../../core/utils/error/exceptions.dart';
import '../../../common/data/model/user_model.dart';
import 'package:http/http.dart' as http;

abstract class AuthApiDataSource {
  Future<UserModel> loginUser({required String email, required String password});
}

class AuthApiDataSourceImpl implements AuthApiDataSource {
  @override
  Future<UserModel> loginUser({required String email, required String password}) async {
    final url = Uri.parse(ApiEndpoints.baseUrl);
    try {
      final response = await http.get(url);
      if (response.statusCode != 200) throw APIFetchException(message: "Something went wrong. Try again");
      final result=json.decode(response.body)["results"] as List<dynamic>;
      return UserModel.fromApiJson(result.first);
    } catch (e) {
      log("Error in AuthApiDataSource $e");
      throw APIFetchException(message: "Something went wrong. Try again");
    }
  }
}
