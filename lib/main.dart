import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:union/cubit.dart';

import 'home.dart';

void main() {
  runApp(MaterialApp(
    home: BlocProvider(create: (c) => HomeCubit(), child: const HomePage()),
  ));
}
