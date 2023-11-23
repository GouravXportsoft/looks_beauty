import 'package:flutter/material.dart';
import 'package:looks_beauty/components/search_component.dart';
import 'package:looks_beauty/constants/color_constant.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          automaticallyImplyLeading: false,
          pinned: true,
          backgroundColor: safeareaColor,
          expandedHeight: 50,
          flexibleSpace: SearchComponent(),
        ),
        SliverList(
          delegate: SliverChildListDelegate(
            <Widget>[Center(child: Text("Profile Screen"))],
          ),
        ),
      ],
    )));
  }
}
