import 'package:gcclientes/presentations/screens/ficha_cliente/ficha_cliente_screen.dart';
import 'package:gcclientes/presentations/screens/list_clients_screen.dart';
import 'package:gcclientes/presentations/screens/login/login_screen.dart';
import 'package:go_router/go_router.dart';

appRouter(){
  return GoRouter(
    initialLocation: "/login",
    // initialLocation: "/list_client",
    routes: [
      GoRoute(
        path: "/login",
        name: LoginScreen.name,
        builder: (context, state) => const LoginScreen()
      ),
      GoRoute(
        path: "/list_client",
        name: ListClientsScreen.name,
        builder: (context, state) => const ListClientsScreen()
      ),
      GoRoute(
        path: "/list_client/:codigo_cliente/:email_vendedor",
        name: FichaClienteScreen.name,
        builder:(context, state) {
          String codigoCliente = state.pathParameters["codigo_cliente"]!;
          return FichaClienteScreen(codigoCliente: codigoCliente,);
        }
      ),
    ]
  );
}