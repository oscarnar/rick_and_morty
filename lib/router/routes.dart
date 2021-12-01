import 'package:auto_route/auto_route.dart';
import 'package:rick_and_morty/character_details/view/character_details_page.dart';
import 'package:rick_and_morty/characters/characters.dart';
import 'package:rick_and_morty/episodes/episodes.dart';
import 'package:rick_and_morty/home/home.dart';
import 'package:rick_and_morty/locations/view/locations_page.dart';
import 'package:rick_and_morty/login/login.dart';

// @CupertinoAutoRouter
// @AdaptiveAutoRouter
// @CustomAutoRouter
@MaterialAutoRouter(
  replaceInRouteName: 'Page',
  routes: <AutoRoute>[
    AutoRoute(page: LoginPage, initial: true),
    AutoRoute(
      path: '/home',
      page: HomePage,
      children: [
        AutoRoute(
          path: 'characters',
          page: CharactersPage,
          initial: true,
        ),
        AutoRoute(
          path: 'episodes',
          page: EpisodesPage,
        ),
        AutoRoute(
          path: 'locations',
          page: LocationsPage,
        ),
      ],
    ),
    AutoRoute(
      path: '/home/characters/:id',
      page: CharacterDetailsPage,
    ),
  ],
)
class $AppRouter {}
