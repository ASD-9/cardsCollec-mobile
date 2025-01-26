import 'package:dio/dio.dart';
import 'package:mobile_app/models/set_model.dart';
import 'package:mobile_app/utils/error_handler.dart';

class SetsService {
  final Dio _dio;

  SetsService(this._dio);

  Future<List<SetModel>> getSets({
    required int idCollection
  }) async {
    try {
      final Response response = await _dio.get('/sets/$idCollection');
      return (response.data["data"] as List).map((e) => SetModel.fromJson(e)).toList();
    } catch (e) {
      throw ErrorHandler.getErrorMessage(e);
    }
  }
}
