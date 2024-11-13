import 'package:bloc/bloc.dart';
import 'package:fruity/core/errors/custom_exceptions.dart';
import 'package:fruity/features/auth/domain/repos/auth_repo.dart';
import 'package:meta/meta.dart';

part 'password_state.dart';

class PasswordCubit extends Cubit<PasswordState> {
  final AuthRepo authRepo;
  PasswordCubit(this.authRepo) : super(PasswordInitial());
  //reset password method with error handling
  Future<void> resetPassword(String email) async {
    emit(PasswordLoading());
    try {
      await authRepo.resetPasswordWithEmail(email);
      emit(PasswordSuccess());
    } on CustomExceptions catch (e) {
      emit(PasswordFailure(message: e.message));
    }
  }
}
