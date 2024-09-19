import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../providers/providers.dart';
import '../bloc/blocs.dart';
import '../utils/utils.dart';
import '../screens/screens.dart';

void main() {
  runApp(const PSSSA());
}

class PSSSA extends StatelessWidget {
  const PSSSA({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.lightTheme;

    return MultiBlocProvider(
      providers: [
        BlocProvider<RecordBloc>(
          create: (context) => RecordBloc(),
        ),
        BlocProvider<UserBloc>(
          create: (context) => UserBloc(),
        ),
      ],
      child: ChangeNotifierProvider(
        create: (BuildContext context) {
          return EssentialProvider();
        },
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'PSSSA',
          theme: theme,
          initialRoute: LoginScreen.routeName,
          routes: {
            LoginScreen.routeName: (context) => const LoginScreen(),
            HomeScreen.routeName: (context) => const HomeScreen(),
            AdminHomeScreen.routeName: (context) => const AdminHomeScreen(),
          },
        ),
      ),
    );
  }
}
