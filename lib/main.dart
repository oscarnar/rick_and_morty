import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/character_details/cubit/character_details_cubit.dart';
import 'package:rick_and_morty/characters/cubit/characters_cubit.dart';
import 'package:rick_and_morty/episodes/cubit/episodes_cubit.dart';
import 'package:rick_and_morty/home/cubit/home_cubit.dart';
import 'package:rick_and_morty/home/view/home_page.dart';
import 'package:rick_and_morty/locations/cubit/locations_cubit.dart';
import 'package:rick_and_morty/login/view/login_page.dart';
import 'package:rick_and_morty/router/routes.gr.dart';
import 'package:rick_and_morty/theme/cubit/theme_cubit.dart';
import 'package:rick_and_morty/theme/theme.dart';

import 'login/bloc/login_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final AppRouter _appRouter = AppRouter();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LoginBloc(),
        ),
        BlocProvider(
          create: (context) => ThemeCubit(),
        ),
        BlocProvider(
          create: (context) => HomeCubit(),
        ),
        BlocProvider(
          create: (context) => EpisodesCubit(),
        ),
        BlocProvider(
          create: (context) => CharactersCubit(),
        ),
        BlocProvider(
          create: (context) => CharacterDetailsCubit(),
        ),
        BlocProvider(
          create: (context) => LocationsCubit(),
        ),
      ],
      child: BlocBuilder<ThemeCubit, ThemeState>(
        buildWhen: (previous, current) =>
            previous.themeData != current.themeData,
        builder: (context, state) {
          return LayoutBuilder(builder: (context, constraints) {
            BlocProvider.of<ThemeCubit>(context).responsiveTheme(constraints);
            return MaterialApp.router(
              title: 'Rick and Morty',
              theme: state.themeData,
              routeInformationParser: _appRouter.defaultRouteParser(),
              routerDelegate: _appRouter.delegate(),
              debugShowCheckedModeBanner: false,
            );
          });
        },
      ),
    );
  }
}
