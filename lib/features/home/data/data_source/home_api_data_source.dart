import 'dart:convert';
import 'dart:developer';
import '../../../../core/utils/constants/api_endpoints.dart';
import '../../../../core/utils/error/exceptions.dart';
import '../../../common/data/model/user_model.dart';
import 'package:http/http.dart' as http;

abstract class HomeApiDataSource {
  Future<List<UserModel>> getUsers({required String gender, required int count});
}

class HomeApiDataSourceImpl implements HomeApiDataSource {
  @override
  Future<List<UserModel>> getUsers({required String gender, required int count}) async {
    final url = Uri.parse("${ApiEndpoints.baseUrl}?results=$count${gender.isNotEmpty ? "&gender=$gender" : ""}");
    log('called ${url.toString()}');
    try {
      final response = await http.get(url);
      if (response.statusCode != 200) throw APIFetchException(message: "Unable to fetch user details. Try again");
      final results = json.decode(response.body)["results"] as List<dynamic>;
      return results.map((e) => UserModel.fromApiJson(e)).toList();
    } catch (e) {
      log("error in getUsers $e");
      throw APIFetchException(message: "Unable to fetch user details. Try again");
    }
  }
}
