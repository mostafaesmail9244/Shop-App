import 'package:store_app/core/constant/constant.dart';
import 'package:store_app/features/search/data/models/search_model.dart';
import 'package:store_app/features/search/data/services/search_services.dart';

class SearchRepo {
  final SearchServices searchServices;

  SearchRepo(this.searchServices);
  Future<SearchModel> search({required String txt}) async {
    return await searchServices.search({'text': txt}, Constant.token!);
  }
}
