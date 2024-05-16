import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:insta_clone_bloc/bloc/home_page/home_event.dart';
import 'package:insta_clone_bloc/bloc/home_page/home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  PageController? pageController;
  int currentTap = 0;

  HomeBloc() : super(HomeInitialState()) {
    on<HomePageChangedEvent>(onPageChanged);
    on<HomeAnimateToPageEvent>(animateToPage);
  }

  onPageChanged(HomePageChangedEvent event, Emitter<HomeState> emit) {
    currentTap = event.index;
    emit(HomePageChangedState(currentTap));
  }

  animateToPage(HomeAnimateToPageEvent event, Emitter<HomeState> emit) {
    currentTap = event.index;
    pageController!.animateToPage(
      event.index,
      duration: const Duration(microseconds: 200),
      curve: Curves.easeIn,
    );
    emit(HomeAnimatedToPageState(currentTap, pageController!));
  }
}
