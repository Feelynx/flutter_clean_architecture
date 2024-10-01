import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_clean_architecture/domain/entities/user_session_response_entity.dart';
import 'package:flutter_clean_architecture/domain/usecases/home_usecases.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this._homeUseCases) : super(HomeInitial()) {
    getUser();
  }

  final HomeUseCases _homeUseCases;

  Future<void> getUser() async {
    emit(HomeLoading());
    final response = await _homeUseCases.getLocalUserSession();
    response.when(
      (UserSessionResponseEntity user) {
        emit(HomeLoaded(user: user));
      },
      (String message) {
        emit(HomeError(message));
      },
    );
  }
}
