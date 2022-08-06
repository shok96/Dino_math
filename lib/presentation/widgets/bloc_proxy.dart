/*
 * *
 *  * Created by Kosyachenko Roman aka Andlancer on 05.08.2022, 20:07
 *  * Copyright (c) 2022 . All rights reserved.
 *  * Last modified 29.07.2022, 22:24
 *
 */

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

typedef BlocCreate<T> = T Function(
  BuildContext context,
  T? bloc,
);

class BlocProxy<T extends StateStreamableSource<Object?>>
    extends StatefulWidget {
 // T bloc;
  BlocCreate<T> bloc;
  Widget child;

  BlocProxy({Key? key, required this.bloc, required this.child})
      : super(key: key);

  @override
  State<BlocProxy<T>> createState() => _BlocProxyState<T>();
}

class _BlocProxyState<T extends StateStreamableSource<Object?>>
    extends State<BlocProxy<T>> {
  T? bloc;


  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (bloc != null) return;
    _rebuildBLoC(context, bloc);
  }

  void _rebuildBLoC(BuildContext context, T? currentBloc) {
    bloc = widget.bloc(
      context,
      bloc,
    );
    if (currentBloc != null && !identical(currentBloc, bloc)) {
      _closeBLoC(currentBloc);
    }
  }

  @override
  void dispose() {
    _closeBLoC(bloc!);
    super.dispose();
  }

  void _closeBLoC(T oldBloc) {
    oldBloc.close();
  }

  @override
  Widget build(BuildContext context) {
     return BlocProvider<T>.value(value: bloc!, child: widget.child,);
    // return BlocProvider<T>(
    //   create: (context) => bloc!,
    //   child: widget.child,
    // );
    //  return BlocProvider<T>.value(
    //    value: bloc!,
    //    child: widget.child,
    //  );
  }
}
