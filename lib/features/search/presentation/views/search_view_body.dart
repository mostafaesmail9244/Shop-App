// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:store_app/core/components/components.dart';
// import 'package:store_app/core/components/list_items.dart';
// import 'package:store_app/features/search/presentation/view_model/search_cubit/search_cubit.dart';

// class SearchViewBody extends StatelessWidget {
//   const SearchViewBody({super.key});
//   @override
//   Widget build(BuildContext context) {
//     var searchController = TextEditingController();
//     var formKey = GlobalKey<FormState>();
//     return BlocBuilder<SearchCubit, SearchState>(
//       builder: (context, state) {
//         var cubit = SearchCubit.get(context);
//         return Form(
//           key: formKey,
//           child: Column(
//             children: [
//               defaultTextFormFeild(
//                 label: const Text('Search'),
//                 outlineInputBorderStatus: true,
//                 controller: searchController,
//                 validator: (txt) {
//                   if (formKey.currentState!.validate()) {}
//                 },
//                 type: TextInputType.text,
//                 prefixIcon: Icons.search,
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               LinearProgressIndicator(),
//               SizedBox(height: 20),
//               ListView.separated(
//                   itemBuilder: (context, index) => ListItems(
//                         product: cubit.searchModel!.data!.data![index],
//                         isSearch: false,
//                       ),
//                   separatorBuilder: (context, index) => const Divider(),
//                   itemCount: cubit.searchModel!.data!.data!.length),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }
