// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:futara/view/widgets/my_text.dart';
// import 'package:pull_to_refresh/pull_to_refresh.dart';
//
// class SmartRefresh extends StatelessWidget {
//   const SmartRefresh(
//       {this.child,
//       this.footer,
//       this.onLoading,
//       this.onRefresh,
//       this.waterDropColor,
//       this.idleIconColor,
//       this.controller,
//       Key? key})
//       : super(key: key);
//   final Widget? child;
//   final bool? footer;
//   final Function? onRefresh, onLoading;
//   final RefreshController? controller;
//   final Color? waterDropColor;
//   final Color? idleIconColor;
//
//   @override
//   Widget build(BuildContext context) {
//     return SmartRefresher(
//       enablePullDown: true,
//       enablePullUp: footer!,
//       header: WaterDropHeader(
//         waterDropColor: waterDropColor ?? Theme.of(context).primaryColor,
//         idleIcon: Icon(
//           Icons.autorenew,
//           size: 15,
//           color: idleIconColor ?? Colors.white,
//         ),
//         complete: refreshStatue('refresh-complete'.tr(), Icons.done),
//         failed: refreshStatue('refresh-failed'.tr(), Icons.close),
//       ),
//       footer: CustomFooter(
//         builder: (BuildContext context, LoadStatus? mode) {
//           Widget body;
//           if (mode == LoadStatus.idle) {
//             body = MyText(title: 'pull-up-load'.tr());
//           } else if (mode == LoadStatus.loading) {
//             body = const CupertinoActivityIndicator();
//           } else if (mode == LoadStatus.failed) {
//             body = MyText(title: 'load-failed-click-try'.tr());
//           } else if (mode == LoadStatus.canLoading) {
//             body = MyText(title: 'release-load-more'.tr());
//           } else {
//             body = MyText(title: 'no-more-data'.tr());
//           }
//           return SizedBox(
//             height: 55,
//             child: Center(child: body),
//           );
//         },
//       ),
//       controller: controller!,
//       onRefresh: () {
//         onRefresh!.call();
//       },
//       onLoading: () {
//         onLoading!.call();
//       },
//       child: child,
//     );
//   }
//
//   Widget refreshStatue(String refreshStatue, IconData icon) => Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: <Widget>[
//           Icon(icon, color: Colors.grey),
//           Container(width: 15),
//           MyText(title: refreshStatue, color: Colors.grey)
//         ],
//       );
// }
