import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Метод для регистрации
  Future<void> register({required String email, required String password}) async {
    try {
      emit(AuthLoading());
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      emit(AuthSuccess(userCredential));
    } on FirebaseAuthException catch (e) {
      emit(AuthError(e.message ?? 'Registration failed.'));
    }
  }

  // Метод для входа
  Future<void> login({required String email, required String password}) async {
    try {
      emit(AuthLoading());
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      emit(AuthSuccess(userCredential));
    } on FirebaseAuthException catch (e) {
      emit(AuthError(e.message ?? 'Login failed.'));
    }
  }

  // Метод для выхода
  Future<void> signOut() async {
    await _auth.signOut();
    emit(AuthInitial());
  }
}
