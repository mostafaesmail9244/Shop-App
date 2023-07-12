
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

// import '../../../../categories/presentation/views/widgets/categories_builder.dart';
// import '../../../data/models/home_model.dart';
// import 'build_grid_product.dart';
// import 'carousel_slider_builder.dart';

// class WidgetBuilder extends StatelessWidget {
//   const WidgetBuilder({super.key, required this.homeModel});
//   final HomeModel homeModel;
//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           carouselSliderBuilder(homeModel: homeModel),
//           const SizedBox(
//             height: 20,
//           ),
//           const Text(
//             'Categories',
//             style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
//           ),
//           SizedBox(
//             height: 100,
//             child: ListView.separated(
//                 padding: const EdgeInsets.all(0),
//                 scrollDirection: Axis.horizontal,
//                 physics: const BouncingScrollPhysics(),
//                 itemBuilder: (context, index) => CategoriesBuilder(),
//                 separatorBuilder: (context, index) => const SizedBox(
//                       width: 5,
//                     ),
//                 itemCount: 10),
//           ),
//           Container(
//             color: Colors.grey[300],
//             child: GridView.count(
//               shrinkWrap: true,
//               crossAxisCount: 2,
//               childAspectRatio: 1 / 1.643,
//               mainAxisSpacing: 2,
//               crossAxisSpacing: 2,
//               physics: const NeverScrollableScrollPhysics(),
//               children: List.generate(
//                   homeModel.data!.products!.length,
//                   (index) =>
//                       buildGridProduct(homeModel.data!.products![index])),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }