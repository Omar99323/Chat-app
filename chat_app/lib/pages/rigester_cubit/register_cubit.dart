import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scholar_chat/pages/rigester_cubit/register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  Future<void> registeruser(
      {required String email, required String password}) async {
    emit(RegisterLoading());
    try {
      // ignore: unused_local_variable
      UserCredential user = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      emit(RegisterSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(RegisterFailure(errormsg: 'Weak Password'));
      } else if (e.code == 'email-already-in-use') {
        emit(RegisterFailure(
            errormsg: 'The account already exists for that email.'));
      } else {
        emit(RegisterFailure(errormsg: 'Something went wrong.'));
      }
    }
  }
}
