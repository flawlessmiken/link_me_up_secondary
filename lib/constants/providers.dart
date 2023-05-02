
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../api/repositories/auth_repository.dart';
import '../api/repositories/pusher_repository.dart';
import '../api/repositories/user_repository.dart';
import '../home_viewmodel.dart';

class AppProviders {
  //The providers for dependency injection and state management are to added here
  //as the app will use MultiProvider
  static final providers = <SingleChildWidget>[
    //format for registering providers:
    ListenableProvider(create: (_) => HomeViewmodel()),
    ListenableProvider(create: (_) => AuthRepository()),
    ListenableProvider(create: (_) => UserRepository()),
    ListenableProvider(create: (_) => PusherRepository()),


  ];
}

