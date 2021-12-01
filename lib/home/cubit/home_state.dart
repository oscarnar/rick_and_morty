part of 'home_cubit.dart';

@immutable
class HomeState extends Equatable {
  final int pageIndex;

  const HomeState({
    required this.pageIndex,
  });

  HomeState copyWith({
    int? pageIndex,
    bool? isDarkMode,
    ThemeData? themeData,
  }) {
    return HomeState(
      pageIndex: pageIndex ?? this.pageIndex,
    );
  }

  @override
  List<Object?> get props => [pageIndex];
}

class HomeInitial extends HomeState {
  const HomeInitial() : super(pageIndex: 0);
}
