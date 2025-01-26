// ignore_for_file: use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:mobile_app/providers/sets_provider.dart';
import 'package:mobile_app/themes/app_color.dart';
import 'package:mobile_app/views/widgets/main_layout.dart';
import 'package:mobile_app/views/widgets/reload.dart';
import 'package:mobile_app/views/widgets/sets_list.dart';
import 'package:provider/provider.dart';

class SetsScreen extends StatefulWidget {
  const SetsScreen({super.key, required this.idCollection});

  final int idCollection;

  @override
  State<SetsScreen> createState() => _SetsScreenState();
}

class _SetsScreenState extends State<SetsScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => Provider.of<SetsProvider>(context, listen: false).fetchSets(widget.idCollection));
  }

  @override
  Widget build(BuildContext context) {
    final SetsProvider setsProvider = Provider.of<SetsProvider>(context);
    return MainLayout(
      title: "Sets", // TODO: Replace with the name of the collection
      body: setsProvider.isLoading
        ? Center(
          child: LoadingAnimationWidget.fourRotatingDots(
            color: AppColor.primaryAccentColor,
            size: MediaQuery.of(context).size.width / 5
          ),
        )
        : setsProvider.error != null
          ? Reload(
            error: setsProvider.error!,
            onTap: () => setsProvider.fetchSets(widget.idCollection),
          )
          : SetsList()
    );
  }
}
