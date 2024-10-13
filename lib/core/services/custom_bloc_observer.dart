import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruity/core/services/service_locator.dart';
// import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';

// import 'package:bloc/bloc.dart';

class CustomBlocObserver extends BlocObserver {
  // final Logger logger = GetIt.I<Logger>();
  final logger = getIt<Logger>();
  @override
  void onTransition(Bloc bloc, Transition transition) {
    logger.i(
        '${bloc.runtimeType} ${transition.currentState} => ${transition.nextState}');
    super.onTransition(bloc, transition);
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    logger.i('${bloc.runtimeType} $change');
    super.onChange(bloc, change);
  }
}
