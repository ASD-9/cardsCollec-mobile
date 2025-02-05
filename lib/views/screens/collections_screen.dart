// ignore_for_file: use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:mobile_app/providers/auth_provider.dart';
import 'package:mobile_app/providers/collections_provider.dart';
import 'package:mobile_app/themes/app_color.dart';
import 'package:mobile_app/views/widgets/collections_list.dart';
import 'package:mobile_app/views/widgets/main_layout.dart';
import 'package:mobile_app/views/widgets/reload.dart';
import 'package:provider/provider.dart';

class CollectionsScreen extends StatefulWidget {
  const CollectionsScreen({super.key});

  @override
  State<CollectionsScreen> createState() => _CollectionsScreenState();
}

class _CollectionsScreenState extends State<CollectionsScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => Provider.of<CollectionsProvider>(context, listen: false).fetchCollections());
  }
  
  @override
  Widget build(BuildContext context) {
    final CollectionsProvider collectionsProvider = Provider.of<CollectionsProvider>(context);
    return MainLayout(
      title: "Collections",
      actions: [
        IconButton(
          icon: Icon(
            Icons.logout,
          ),
          onPressed: () {
            Provider.of<AuthProvider>(context, listen: false).logout();
          },
        )
      ],
      body: collectionsProvider.isLoading
        ? Center(
          child: LoadingAnimationWidget.fourRotatingDots(
            color: AppColor.primaryAccentColor,
            size: MediaQuery.of(context).size.width / 5
          ),
        )
        : collectionsProvider.error != null
          ? Reload(
            error: collectionsProvider.error!,
            onTap: () => collectionsProvider.fetchCollections(),
          )
          : CollectionsList()
    );
  }
}
