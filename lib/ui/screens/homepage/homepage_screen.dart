import 'package:flutter/material.dart';
import 'package:mowgli/ui/screens/homepage/bloc/homepage_bloc.dart';
import 'package:mowgli/ui/screens/homepage/components/appbar/homepage_appbar.dart';
import 'package:mowgli/ui/screens/homepage/components/homepage_body.dart';
import 'package:mowgli/ui/utils/image_utils.dart';
import 'package:mowgli/ui/utils/status_bar.dart';

class HomePageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StatusBar(
      child: BlocProvider<HomePageBloc>(
        create: (_) {
          return HomePageBloc(context.imagesWidth);
        },
        lazy: false,
        child: Scaffold(
          appBar: HomePageAppBar(),
          body: HomePageBody(),
        ),
      ),
    );
  }
}
