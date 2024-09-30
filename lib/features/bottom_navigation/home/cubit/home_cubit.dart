import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial()) {
    getUser();
  }

  Future<void> getUser() async {
    emit(HomeLoading());
    emit(HomeLoaded());
  }
}
