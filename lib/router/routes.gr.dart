// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i7;
import 'package:flutter/material.dart' as _i8;

import '../character_details/view/character_details_page.dart' as _i3;
import '../characters/characters.dart' as _i4;
import '../episodes/episodes.dart' as _i5;
import '../home/home.dart' as _i2;
import '../locations/view/locations_page.dart' as _i6;
import '../login/login.dart' as _i1;

class AppRouter extends _i7.RootStackRouter {
  AppRouter([_i8.GlobalKey<_i8.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i7.PageFactory> pagesMap = {
    LoginPageRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.LoginPage());
    },
    HomePageRoute.name: (routeData) {
      final args = routeData.argsAs<HomePageRouteArgs>(
          orElse: () => const HomePageRouteArgs());
      return _i7.MaterialPageX<dynamic>(
          routeData: routeData, child: _i2.HomePage(key: args.key));
    },
    CharacterDetailsPageRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<CharacterDetailsPageRouteArgs>(
          orElse: () =>
              CharacterDetailsPageRouteArgs(id: pathParams.getInt('id')));
      return _i7.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i3.CharacterDetailsPage(
              key: args.key, id: args.id, name: args.name));
    },
    CharactersPageRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.CharactersPage());
    },
    EpisodesPageRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.EpisodesPage());
    },
    LocationsPageRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i6.LocationsPage());
    }
  };

  @override
  List<_i7.RouteConfig> get routes => [
        _i7.RouteConfig(LoginPageRoute.name, path: '/'),
        _i7.RouteConfig(HomePageRoute.name, path: '/home', children: [
          _i7.RouteConfig('#redirect',
              path: '',
              parent: HomePageRoute.name,
              redirectTo: 'characters',
              fullMatch: true),
          _i7.RouteConfig(CharactersPageRoute.name,
              path: 'characters', parent: HomePageRoute.name),
          _i7.RouteConfig(EpisodesPageRoute.name,
              path: 'episodes', parent: HomePageRoute.name),
          _i7.RouteConfig(LocationsPageRoute.name,
              path: 'locations', parent: HomePageRoute.name)
        ]),
        _i7.RouteConfig(CharacterDetailsPageRoute.name,
            path: '/home/characters/:id')
      ];
}

/// generated route for [_i1.LoginPage]
class LoginPageRoute extends _i7.PageRouteInfo<void> {
  const LoginPageRoute() : super(name, path: '/');

  static const String name = 'LoginPageRoute';
}

/// generated route for [_i2.HomePage]
class HomePageRoute extends _i7.PageRouteInfo<HomePageRouteArgs> {
  HomePageRoute({_i8.Key? key, List<_i7.PageRouteInfo>? children})
      : super(name,
            path: '/home',
            args: HomePageRouteArgs(key: key),
            initialChildren: children);

  static const String name = 'HomePageRoute';
}

class HomePageRouteArgs {
  const HomePageRouteArgs({this.key});

  final _i8.Key? key;

  @override
  String toString() {
    return 'HomePageRouteArgs{key: $key}';
  }
}

/// generated route for [_i3.CharacterDetailsPage]
class CharacterDetailsPageRoute
    extends _i7.PageRouteInfo<CharacterDetailsPageRouteArgs> {
  CharacterDetailsPageRoute({_i8.Key? key, required int id, String name0 = ''})
      : super(name,
            path: '/home/characters/:id',
            args: CharacterDetailsPageRouteArgs(key: key, id: id, name: name0),
            rawPathParams: {'id': id});

  static const String name = 'CharacterDetailsPageRoute';
}

class CharacterDetailsPageRouteArgs {
  const CharacterDetailsPageRouteArgs(
      {this.key, required this.id, this.name = ''});

  final _i8.Key? key;

  final int id;

  final String name;

  @override
  String toString() {
    return 'CharacterDetailsPageRouteArgs{key: $key, id: $id, name: $name}';
  }
}

/// generated route for [_i4.CharactersPage]
class CharactersPageRoute extends _i7.PageRouteInfo<void> {
  const CharactersPageRoute() : super(name, path: 'characters');

  static const String name = 'CharactersPageRoute';
}

/// generated route for [_i5.EpisodesPage]
class EpisodesPageRoute extends _i7.PageRouteInfo<void> {
  const EpisodesPageRoute() : super(name, path: 'episodes');

  static const String name = 'EpisodesPageRoute';
}

/// generated route for [_i6.LocationsPage]
class LocationsPageRoute extends _i7.PageRouteInfo<void> {
  const LocationsPageRoute() : super(name, path: 'locations');

  static const String name = 'LocationsPageRoute';
}
