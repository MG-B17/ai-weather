import '../../../../core/helpers/DioHelper/ApiStrings.dart';
import '../../../../core/helpers/DioHelper/dioHelper.dart';

abstract  class BaseAiRemoteData {
  Future<List> getPrediction({required List data});
}

class AiRemoteData extends BaseAiRemoteData{

  @override
  Future<List> getPrediction({required List data})async {
      final response= await  AiDioHelper.get(endpoint: ApiStrings.aiEndPoint, data: data);
      return response["prediction"];
  }

}