// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// import '../../design_system.dart';
//
// class _PreferredAppBarSize extends Size {
//   _PreferredAppBarSize(this.toolbarHeight, this.bottomHeight)
//       : super.fromHeight((toolbarHeight ?? kToolbarHeight) + (bottomHeight ?? 0));
//
//   final double? toolbarHeight;
//   final double? bottomHeight;
// }
//
//
// class EcoAppBar extends StatefulWidget implements PreferredSizeWidget {
//   const EcoAppBar({super.key}) : preferredSize = _PreferredAppBarSize(toolbarHeight, bottom?.preferredSize.height);
//
//   @override
//   State<EcoAppBar> createState() => _EcoAppBarState();
//
//   @override
//   Size get preferredSize;
// }
//
// class _EcoAppBarState extends State<EcoAppBar> {
//   @override
//   Widget build(BuildContext context) {
//     return AppBar(
//       surfaceTintColor: context.colorScheme.background,
//       leading: Padding(
//         padding: const EdgeInsets.all(5.0),
//         child: PriceBadge(),
//       ),
//       leadingWidth: 120,
//       title: Text(),
//     );
//   }
// }
