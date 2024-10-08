import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

// import 'package:bloc/bloc.dart';

class CustomBlocObserver extends BlocObserver {
  @override
  void onTransition(Bloc bloc, Transition transition) {
    log('${bloc.runtimeType} ${transition.currentState} => ${transition.nextState}');
    super.onTransition(bloc, transition);
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    log('${bloc.runtimeType} $change');
    super.onChange(bloc, change);
  }
}
