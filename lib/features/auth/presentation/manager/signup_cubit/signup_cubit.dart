import 'package:bloc/bloc.dart';
import 'package:fruity/features/auth/domain/entities/user_entity.dart';
import 'package:fruity/features/auth/domain/repos/auth_repo.dart';
import 'package:meta/meta.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  final AuthRepo authRepo;
  SignupCubit(this.authRepo) : super(SignupInitial());

  // //signup or signin method
  // Future<void> signupOrLogin(String email, String password, String name) async {
  //   emit(SignupLoading());

  //   // Step 1: Try to sign in with the provided email and password
  //   final signInResult =
  //       await authRepo.signInWithEmailAndPassword(email, password);

  //   signInResult.fold(
  //     (failure) async {
  //       // Step 2: If sign-in fails, proceed to create a new account
  //       final signUpResult = await authRepo.createUserWithEmailAndPassword(
  //           email, password, name);

  //       signUpResult.fold(
  //         (signUpFailure) =>
  //             emit(SignupFailure(message: signUpFailure.message)),
  //         (newUser) async {
  //           // Step 3: If signup is successful, create new user data
  //           await authRepo.addUserData(user: newUser);
  //           emit(SignupSuccess(userEntity: newUser));
  //         },
  //       );
  //     },
  //     (existingUser) async {
  //       // Step 4: If sign-in is successful, fetch existing user data
  //       final userData = await authRepo.getUserData(uId: existingUser.uId);
  //       emit(SignupSuccess(userEntity: userData));
  //     },
  //   );
  // }

  Future<void> createUserWithEmailAndPassword(
      String email, String password, String name) async {
    emit(SignupLoading());
    final result =
        await authRepo.createUserWithEmailAndPassword(email, password, name);
    result.fold(
      (failure) {
        emit(SignupFailure(message: failure.message));
      },
      (userEntity) {
        emit(SignupSuccess(userEntity: userEntity));
      },
    );
  }
}
