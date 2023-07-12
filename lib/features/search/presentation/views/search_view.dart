import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/features/search/data/services/search_repo.dart';
import 'package:store_app/features/search/data/services/search_services.dart';

import '../../../../core/components/components.dart';
import '../../../../core/components/list_items.dart';
import '../view_model/search_cubit/search_cubit.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    var searchController = TextEditingController();
    var formKey = GlobalKey<FormState>();
    SearchCubit searchCubit = SearchCubit(SearchRepo(SearchServices(Dio())));
    return BlocProvider(
      create: (context) => searchCubit,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('search'),
        ),
        body: BlocBuilder<SearchCubit, SearchState>(
          builder: (context, state) {
            var cubit = SearchCubit.get(context);
            return Form(
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    defaultTextFormFeild(
                      label: const Text('Search'),
                      outlineInputBorderStatus: true,
                      controller: searchController,
                      validator: (txt) {
                        if (formKey.currentState!.validate()) {
                          return 'enter value to search';
                        }
                      },
                      onSubmit: (value) {
                        cubit.search(txt: value);
                      },
                      type: TextInputType.text,
                      prefixIcon: Icons.search,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    if (state is SearchLoadinfState)
                      const LinearProgressIndicator(),
                    const SizedBox(height: 15),
                    if (state is SearchSuccessState)
                      Expanded(
                        child: ListView.separated(
                            itemBuilder: (context, index) => ListItems(
                                  product:
                                      cubit.searchModel!.data!.data![index],
                                  isSearch: false,
                                ),
                            separatorBuilder: (context, index) =>
                                const Divider(),
                            itemCount: cubit.searchModel!.data!.data!.length),
                      ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
