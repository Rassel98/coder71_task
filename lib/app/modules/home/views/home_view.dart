import 'package:cached_network_image/cached_network_image.dart';
import 'package:coder71_task/app/data/core/api_confiq.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    print(Get.height);
    print(Get.width);
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
          title: const Text("Wallpapers"),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Obx(() => controller.isRefresh.value && !controller.isLoading.value
            ? LoadingAnimationWidget.staggeredDotsWave(color: Colors.white, size: 50)
            : const SizedBox()),
        body: Obx(
          () => controller.isLoading.value
              ? Center(child: LoadingAnimationWidget.fourRotatingDots(color: Colors.pinkAccent, size: 50))
              : controller.productList.isEmpty
                  ? const Center(
                      child: Text('No product found'),
                    )
                  : Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const TabBar(
                          isScrollable: true,
                          indicatorColor: Colors.pink,
                          labelPadding: EdgeInsets.symmetric(horizontal: 20),
                          labelStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                          labelColor: Colors.deepPurple,
                          indicatorSize: TabBarIndicatorSize.label,
                          tabs: [
                            Tab(
                              child: Text("HOME"),
                            ),
                            Tab(
                              child: Text("CATEGORY"),
                            ),
                            Tab(
                              child: Text("FAVORITES"),
                            ),
                          ],
                        ),
                        Flexible(
                          flex: 1,
                          child: TabBarView(children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                 Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    'Most Popular',
                                    style: TextStyle(fontSize: 22 * Get.textScaleFactor, fontWeight: FontWeight.w700),
                                  ),
                                ),
                                SizedBox(
                                  height: Get.height * 0.00529,
                                ),
                                Expanded(
                                  child: GridView.builder(
                                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 3,
                                      mainAxisSpacing: 5.0,
                                      crossAxisSpacing: 8.0,
                                      // childAspectRatio: 0.5,
                                      childAspectRatio: MediaQuery.of(context).size.width /
                                          (MediaQuery.of(context).size.height / 1.4),
                                    ),
                                    controller: controller.scrollController,
                                    padding: const EdgeInsets.all(12.0),
                                    itemCount: controller.productList.length,
                                    itemBuilder: (context, index) {
                                      final model = controller.productList.elementAt(index);
                                      return CachedNetworkImage(
                                        fit: BoxFit.cover,
                                        imageUrl: '${ApiConfig.imageUrl}products/${model.photo.toString()}',
                                        imageBuilder: (context, imageProvider) => Container(
                                          height: 30,
                                          width: 30,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.rectangle,
                                            borderRadius: BorderRadius.circular(8),
                                            image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
                                          ),
                                        ),
                                        alignment: Alignment.center,
                                        progressIndicatorBuilder: (context, url, downloadProgress) =>
                                            Center(child: CircularProgressIndicator(value: downloadProgress.progress)),
                                        errorWidget: (context, url, error) => const Icon(Icons.error),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                            GridView.builder(
                              gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 8.0,
                                // childAspectRatio: 1.5,
                                childAspectRatio: MediaQuery.of(context).size.width /
                                  (MediaQuery.of(context).size.height / 3.5),
                                crossAxisSpacing: 8.0,
                              ),
                              padding: const EdgeInsets.all(8.0),
                              itemCount: controller.categoryList.length,
                              itemBuilder: (context, index) {
                                final model = controller.categoryList.elementAt(index);
                                return Stack(
                                  children: [
                                    CachedNetworkImage(
                                      fit: BoxFit.cover,
                                      imageUrl: '${ApiConfig.imageUrl}collections/${model.coverPhoto.toString()}',
                                      imageBuilder: (context, imageProvider) => Container(
                                        decoration: BoxDecoration(
                                          shape: BoxShape.rectangle,
                                          borderRadius: BorderRadius.circular(8),
                                          image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
                                        ),
                                      ),
                                      alignment: Alignment.center,
                                      progressIndicatorBuilder: (context, url, downloadProgress) =>
                                          Center(child: CircularProgressIndicator(value: downloadProgress.progress)),
                                      errorWidget: (context, url, error) => const Icon(Icons.error),
                                    ),
                                    Positioned.fill(
                                      child: Container(
                                        color: Colors.black38,
                                        child: Center(
                                            child: Text(
                                          model.name ?? "",
                                          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                                        )),
                                      ),
                                    )
                                  ],
                                );
                              },
                            ),
                            const Center(
                                child: Text(
                              "Coming soon...",
                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                            ))
                          ]),
                        ),
                      ],
                    ),
        ),
      ),
    );
  }
}
