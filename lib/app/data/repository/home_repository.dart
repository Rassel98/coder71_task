
import '../core/api_confiq.dart';
import '../db/api_service/base_service.dart';
import '../interface/home_interface.dart';
import '../models/category_model.dart';
import '../models/response_model.dart';

class HomeRepository extends HomeInterface {
  @override
  Future<List<CategoryModel>> getAllCategory() async {
    var data = await BaseService.getData(api: ApiConfig.category);
    return data != null ? categoryModelFromJson(data) : [];
  }

  @override
  Future<ResponseModel?> getProductResponse(int page) async {
    var data = await BaseService.getData(api: "${ApiConfig.recentProducts}?page=$page");
    print(data);
    return data != null ? ResponseModel.fromJson(data) : null;
  }
}
