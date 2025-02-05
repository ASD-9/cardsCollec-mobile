import 'package:flutter/material.dart';
import 'package:mobile_app/models/collection_model.dart';
import 'package:mobile_app/providers/collections_provider.dart';
import 'package:mobile_app/themes/app_color.dart';
import 'package:mobile_app/views/widgets/custom_network_image.dart';
import 'package:provider/provider.dart';

class CollectionsList extends StatelessWidget {
  const CollectionsList({super.key});

  @override
  Widget build(BuildContext context) {
    final CollectionsProvider collectionsProvider = Provider.of<CollectionsProvider>(context);
    return ListView.builder(
      physics: BouncingScrollPhysics(),
      itemCount: collectionsProvider.collections.length,
      itemBuilder: (context, index) {
        final CollectionModel collection = collectionsProvider.collections[index];
        return GestureDetector(
          onTap: () => Navigator.pushNamed(context, "/sets", arguments: collection.id),
          child: Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColor.secondaryColor,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomNetworkImage(
                  imagePath: collection.image,
                  width: MediaQuery.of(context).size.width / 2,
                ),
                Text(
                  collection.name
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
