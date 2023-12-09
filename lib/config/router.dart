import 'package:gcclientes/presentations/screens/ficha_cliente/ficha_cliente_screen.dart';
import 'package:gcclientes/presentations/screens/list_clients_screen.dart';
import 'package:go_router/go_router.dart';

appRouter(){
  return GoRouter(
    initialLocation: "/list_client",
    routes: [
      GoRoute(
        path: "/list_client",
        name: ListClientsScreen.name,
        builder: (context, state) => const ListClientsScreen()
      ),
      GoRoute(
        path: "/list_client/:codigo_cliente",
        name: FichaClienteScreen.name,
        builder:(context, state) {
          String codigoCliente = state.pathParameters["codigo_cliente"]!;
          return FichaClienteScreen(codigoCliente: codigoCliente);
        }
      ),
    ]
  );
}