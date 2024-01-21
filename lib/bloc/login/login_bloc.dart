import 'package:drink_it/service/auth_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'login_events.dart';
import 'login_states.dart';

class LoginBloc extends Bloc<LoginEvents, LoginStates> {

  LoginBloc() : super(LoadingState()) {
   on<GoogleLoginEvent>(googleLogin);
  }

  void googleLogin(GoogleLoginEvent event, Emitter<LoginStates> emit) async {
    emit(LoadingState());
    try{
     await Authentication.signInWithGoogle(context: event.context);
      emit(LoginSuccessState());
    }catch(e){
      emit(ErrorState(e.toString()));
    }
  }

}