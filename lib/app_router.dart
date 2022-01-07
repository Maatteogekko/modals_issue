import 'package:auto_route/auto_route.dart';
import 'package:modals_issue/main.dart';

@MaterialAutoRouter(
  routes: [
    AutoRoute(page: ModalButton, initial: true),
  ],
)
class $AppRouter {}
