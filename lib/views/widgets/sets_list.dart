import 'package:flutter/material.dart';
import 'package:mobile_app/models/set_model.dart';
import 'package:mobile_app/providers/sets_provider.dart';
import 'package:mobile_app/themes/app_color.dart';
import 'package:mobile_app/views/widgets/custom_network_image.dart';
import 'package:provider/provider.dart';

class SetsList extends StatelessWidget {
  const SetsList({super.key});

  @override
  Widget build(BuildContext context) {
    final SetsProvider setsProvider = Provider.of<SetsProvider>(context);
    return GridView(
      physics: BouncingScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1.5
      ),
      children: List.generate(
        setsProvider.sets.length,
        (index) {
          final SetModel set = setsProvider.sets[index];
          return GestureDetector(
            onTap: () => Navigator.pushNamed(context, "/cards", arguments: set.id),
            child: Container(
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColor.secondaryColor,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomNetworkImage(
                    imagePath: set.image!,
                    width: MediaQuery.of(context).size.width / 2,
                  ),
                  Text(
                    set.name
                  )
                ],
              ),
            ),
          );
        }
      ),
    );
  }
}
