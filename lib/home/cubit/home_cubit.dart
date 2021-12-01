import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(const HomeInitial());

  void changePage(int index) {
    switch (index) {
      case 0:
        // Characters page
        emit(state.copyWith(pageIndex: 0));
        break;
      case 1:
        // Episodes page
        emit(state.copyWith(pageIndex: 1));
        break;
      case 2:
        // Locations page
        emit(state.copyWith(pageIndex: 2));
        break;
      default:
        emit(const HomeInitial());
    }
  }
  
}
