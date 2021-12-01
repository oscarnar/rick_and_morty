import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/home/cubit/home_cubit.dart';
import 'package:rick_and_morty/router/routes.gr.dart';
import 'package:rick_and_morty/theme/cubit/theme_cubit.dart';
import 'package:rick_and_morty/theme/theme.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final _routes = <PageRouteInfo>[
    const CharactersPageRoute(),
    const EpisodesPageRoute(),
    const LocationsPageRoute(),
  ];

  @override
  Widget build(BuildContext context) {
    final ThemeCubit themeCubit =
        BlocProvider.of<ThemeCubit>(context, listen: true);
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) => previous.pageIndex != current.pageIndex,
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Rick and Morty'),
            actions: [
              const Icon(Icons.brightness_7_rounded, size: 23),
              Switch.adaptive(
                  value: themeCubit.state.isDarkMode,
                  onChanged: (value) {
                    if (value) {
                      themeCubit.changeTheme(AppTheme.dark);
                    } else {
                      themeCubit.changeTheme(AppTheme.light);
                    }
                  }),
              const Icon(
                Icons.brightness_2_rounded,
                size: 23,
              ),
            ],
          ),
          body: const AutoRouter(),
          bottomNavigationBar: BottomNavigationBar(
            items: const [
              BottomNavigationBarItem(
                label: 'Characters',
                icon: Icon(
                  Icons.library_books_rounded,
                ),
              ),
              BottomNavigationBarItem(
                label: 'Episodes',
                icon: Icon(
                  Icons.filter,
                ),
              ),
              BottomNavigationBarItem(
                label: 'Locations',
                icon: Icon(
                  Icons.location_on_rounded,
                ),
              ),
            ],
            currentIndex: state.pageIndex,
            onTap: (index) {
              BlocProvider.of<HomeCubit>(context).changePage(index);
              AutoRouter.of(context).push(_routes[index]);
            },
          ),
        );
      },
    );
  }
}
