import 'package:gcclientes/presentations/screens/list_clients_screen.dart';
import 'package:go_router/go_router.dart';

appRouter(){
  return GoRouter(
    initialLocation: "/list_client",
    routes: [
      GoRoute(
        path: "/list_client",
        name: ListClientsScreen.name,
        builder: (context, state) => ListClientsScreen()
      ),
    ]
  );
}