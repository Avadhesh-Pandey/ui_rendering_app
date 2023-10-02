import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui_rendering_app/features/presentation/pages/home/subpages/home_sub_page.dart';

import '../../../../core/di/injection_getit.dart';
import '../../bloc/get_rendering_json_bloc/rendering_json_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<GetRenderingJsonBloc>(),
      child: const HomeSubPage(title: 'UI Rendering'),
    );
  }
}
