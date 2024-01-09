import 'package:geoclientes/presentations/screens/checkoin_cliente/checkin_cliente.dart';
import 'package:geoclientes/presentations/screens/demo/demo_sreen.dart';
import 'package:geoclientes/presentations/screens/ficha_cliente/ficha_cliente_screen.dart';
import 'package:geoclientes/presentations/screens/vendedores/list_clients_screen.dart';
import 'package:geoclientes/presentations/screens/login/login_screen.dart';
import 'package:geoclientes/presentations/screens/vendedores/vendedores_screen.dart';
import 'package:go_router/go_router.dart';

appRouter(){
  return GoRouter(
    // initialLocation: "/login",
    initialLocation: "/checkin_cliente",
    // initialLocation: "/ficha_client/77026254/avillegas@neumachile.cl",
    routes: [
      GoRoute(
        path: '/demo',
        name: Ddemo.name,
        builder: (context, state) => Ddemo()
      ),
      GoRoute(
        path: '/vendedores',
        name: VendedoresScreen.name,
        builder: (context, state) => VendedoresScreen()
      ),

      GoRoute(
        path: "/login",
        name: LoginScreen.name,
        builder: (context, state) => const LoginScreen()
      ),
      GoRoute(
        path: "/list_client/:email_vendedor",
        name: ListClientsScreen.name,
        builder:(context, state) {
          String emailVendedor = state.pathParameters["email_vendedor"]!;
          return ListClientsScreen(emailVendedor: emailVendedor);
        }
      ),
      GoRoute(
        path: "/ficha_client/:codigo_cliente/:email_vendedor",
        name: FichaClienteScreen.name,
        builder:(context, state) {
          String codigoCliente = state.pathParameters["codigo_cliente"]!;
          // String codigoCliente = "16803933";
          String emailVendedor = state.pathParameters["email_vendedor"]!;
          // String emailVendedor = "avillegas@neumachile.cl";
          return FichaClienteScreen(codigoCliente: codigoCliente,emailVendedor:emailVendedor);
        }
      ),
       GoRoute(
        path: "/checkin_cliente",
        name: CheckinClienteScreen.name,
        builder: (context, state) => const CheckinClienteScreen()
      ),
    ]
  );
}