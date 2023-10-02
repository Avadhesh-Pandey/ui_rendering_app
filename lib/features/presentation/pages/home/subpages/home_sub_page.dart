import 'package:engine/core/constants/color_constants.dart';
import 'package:engine/engine.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:ui_rendering_app/features/presentation/bloc/get_rendering_json_bloc/rendering_json_bloc.dart';
import 'package:ui_rendering_app/theme/theme_provider.dart';


class HomeSubPage extends StatefulWidget {
  const HomeSubPage({super.key, required this.title});

  final String title;

  @override
  State<HomeSubPage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomeSubPage> {
  @override
  void initState() {
    BlocProvider.of<GetRenderingJsonBloc>(context).add(GetRenderingJsonEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(
          widget.title,
          style: TextStyle(
            color: Theme.of(context).colorScheme.inversePrimary,
          ),
        ),
      ),
      body: BlocBuilder(
        bloc: BlocProvider.of<GetRenderingJsonBloc>(context),
        builder: (context, state) {
          if (state is RenderingJsonRetrievedSuccessfullyStatus) {
            Map<String, dynamic> jsonData = state.renderingJson;
            updateTheTheme(jsonData["app"]?["theme"]);
            return UIRenderer(jsonData["widgets"]);
          }
          return const Center(
            child: SizedBox(
              width: 24,
              height: 24,
              child: CircularProgressIndicator(
                backgroundColor: kTextBackgroundGrey,
              ),
            ),
          );
        },
      ),
    );
  }

  void updateTheTheme(String theme)
  {
    WidgetsBinding.instance
        .addPostFrameCallback((_) {
      Provider.of<ThemeProvider>(context, listen: false).setTheme(theme);
    });
  }
}
