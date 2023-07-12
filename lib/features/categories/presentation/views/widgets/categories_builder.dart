import 'package:flutter/material.dart';
import 'package:store_app/features/categories/data/models/categories_model.dart';

class CategoriesBuilder extends StatelessWidget {
  const CategoriesBuilder({super.key, required this.dataModelC});
  final DataModelC dataModelC;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Image(width: 100, height: 100, fit: BoxFit.cover, image: NetworkImage(
            //TODO:add dataModelc.image
            dataModelC.image!)),
        Container(
            width: 100,
            color: Colors.black87,
            child: Text(
              '${dataModelC.name}',
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(color: Colors.white),
            ))
      ],
    );
  }
}
