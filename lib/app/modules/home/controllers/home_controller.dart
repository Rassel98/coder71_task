import 'dart:math';
import 'package:coder71_task/app/data/models/category_model.dart';
import 'package:coder71_task/app/data/repository/home_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/models/product_model.dart';

class HomeController extends GetxController {
  RxBool isLoading = true.obs;
  RxBool isRefresh = false.obs;
  int total = 1;
  int count = 0;
  ScrollController scrollController = ScrollController();
  late HomeRepository homeRepository;

  final _categoryList = <CategoryModel>[].obs;
  List<CategoryModel> get categoryList => _categoryList;

  final _productList = <ProductModel>[].obs;
  List<ProductModel> get productList => _productList;

  @override
  void onInit() async {
    super.onInit();
    homeRepository=HomeRepository();
    scrollController = ScrollController();
    scrollController.addListener(_scrollListener);
     await getAllProductList();
     await getAllCategoryList();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  _scrollListener() async {
    if (scrollController.offset >= scrollController.position.maxScrollExtent && !scrollController.position.outOfRange) {
      getAllProductList();
    }
  }

  Future<void> getAllCategoryList() async {
    var getResponse = await homeRepository.getAllCategory();
    if (getResponse != []) {
      _categoryList.value = getResponse;
    } else {
      print('dtata not comming');
    }
    isLoading(false);
  }

  Future<void> getAllProductList() async {
    if (total >= count) {
      isRefresh(true);
      count++;
    } else {
      return;
    }
    var getResponse = await homeRepository.getProductResponse(count);
    if (getResponse != null && getResponse.data != []) {
      total = getResponse.lastPage ?? 1;
      print(getResponse.lastPage );
      _productList.addAll(getResponse.data!);
      isLoading.value = false;
      isRefresh(false);
    } else {
      print('dtata not comming');
    }
    isLoading.value = false;
    isRefresh(false);
  }
}
