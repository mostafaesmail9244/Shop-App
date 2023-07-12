import 'package:flutter/material.dart';
import 'package:store_app/features/search/presentation/widgets/product_info_search.dart';

import '../../features/search/data/models/search_model.dart';

class ListItems extends StatelessWidget {
  const ListItems({
    super.key,
    required this.product,
    required this.isSearch,
  });
  final Product product;
  final bool isSearch;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 120,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Stack(
              alignment: AlignmentDirectional.bottomStart,
              children: [
                Image(
                  image: NetworkImage(product.image),
                  width: 120,
                  height: 120,
                ),
                if (product.discount != 0)
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(8),
                        topLeft: Radius.circular(8),
                        bottomRight: Radius.circular(8),
                      ),
                      color: Colors.red,
                    ),
                    child: isSearch
                        ? Container()
                        : const Text(
                            'Discount',
                            style: TextStyle(fontSize: 10, color: Colors.white),
                          ),
                  ),
              ],
            ),
            Expanded(
                child: ProductInfoSearch(
              productInfo: product,
              // isSearch: isSearc/h,
            )),
          ],
        ),
      ),
    );
  }
}
