
import '../models/category_model.dart';
import '../models/response_model.dart';

abstract class HomeInterface {
  Future<List<CategoryModel>> getAllCategory();
  Future<ResponseModel?> getProductResponse(int page);


}
