import 'package:flutter/material.dart';
import 'package:looks_beauty/components/search_component.dart';
import 'package:looks_beauty/constants/color_constant.dart';

class OfferScreen extends StatelessWidget {
  const OfferScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: safeareaColor),
      child: Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              automaticallyImplyLeading: false,
              pinned: true, // Make the SearchComponent pinned at the top
              backgroundColor: safeareaColor,
              expandedHeight: 50, // Adjust the height as needed
              flexibleSpace: SearchComponent(),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                <Widget>[],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
