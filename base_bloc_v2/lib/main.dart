import 'package:base_bloc_v2/presentation/routers/app_router.dart';
import 'package:flutter/material.dart';

import 'di/locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppRouter _appRouter = locator<AppRouter>();
    return MaterialApp.router(
      title: 'Flutter Clean Architecture Sample',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routerConfig: _appRouter.config(),
    );
  }
}
