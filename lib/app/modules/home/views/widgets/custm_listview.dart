// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// import '../../../core/utils/helpers.dart';
// import '../../../data/models/notification_model.dart';
// import '../../../global_widgets/empty_orders_widget.dart';
// import 'my_push_notification_details_view.dart';
//
// class customListview extends StatelessWidget {
//   customListview({
//     super.key,
//     required this.notifications
//   });
//   List<NotificationsModel> notifications;
//   @override
//   Widget build(BuildContext context) {
//     return notifications.isEmpty?
//     const EmptyOrdersWidget()
//         :ListView.builder(
//       itemCount: notifications.length,
//       itemBuilder: (context, index) {
//         NotificationsModel notificationModel =
//         notifications.elementAt(index);
//         return InkWell(
//           onTap: () => Get.to(() => MyPushNotificationDetailsView(
//               notificationModel: notificationModel.noticeDetail!)),
//           child: Container(
//             margin:
//             const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
//             padding:
//             const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
//             decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(5),
//                 color: Colors.white,
//                 boxShadow: [Helpers.customBoxShadow()]),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const SizedBox(
//                   height: 15.0,
//                 ),
//                 Text(
//                   '${notificationModel.noticeDetail!.title} ',
//                   maxLines: 2,
//                   style: const TextStyle(
//                      overflow: TextOverflow.ellipsis,
//                     fontWeight: FontWeight.bold,
//                     fontSize: 16,
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 15.0,
//                 ),
//                 Text(
//                   notificationModel.noticeDetail!.description ?? "",
//                   maxLines: 2,
//                   overflow: TextOverflow.ellipsis,
//                   style: const TextStyle(fontSize: 14.0),
//                 ),
//                 const SizedBox(
//                   height: 15.0,
//                 ),
//                 CachedNetworkImage(
//                   // filterQuality: FilterQuality.low,
//                   // fit: BoxFit.cover,
//                   height: 120,
//                   width: Get.width,
//                   imageUrl: '${notificationModel.noticeDetail!.image}',
//                   imageBuilder: (context, imageProvider) => Container(
//                     height: 30,
//                     width: 30,
//                     decoration: BoxDecoration(
//                       // shape: BoxShape.circle,
//                       image: DecorationImage(
//                           image: imageProvider, fit: BoxFit.cover),
//                     ),
//                   ),
//                   alignment: Alignment.center,
//                   errorWidget: (context, url, error) {
//                     return Image.asset(
//                       'assets/images/notification.jpg',
//                       fit: BoxFit.cover,
//                     );
//                   },
//                 ),
//                 const SizedBox(
//                   height: 5.0,
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
// }