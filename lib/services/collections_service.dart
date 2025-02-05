import 'package:dio/dio.dart';
import 'package:mobile_app/models/collection_model.dart';
import 'package:mobile_app/utils/error_handler.dart';

class CollectionsService {
  final Dio _dio;

  CollectionsService(this._dio);

  Future<List<CollectionModel>> getCollections() async {
    try {
      final Response response = await _dio.get('/collections');
      return (response.data["data"] as List).map((e) => CollectionModel.fromJson(e)).toList();
    } catch (e) {
      throw ErrorHandler.getErrorMessage(e);
    }
  }
}
