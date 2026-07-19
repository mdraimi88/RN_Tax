import 'package:go_router/go_router.dart';

import '../features/dashboard/presentation/pages/dashboard_page.dart';
import '../features/receipt/presentation/pages/receipt_list_page.dart';
import '../features/receipt/presentation/pages/add_receipt_page.dart';


final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(path: '/', builder: (context, state) => const DashboardPage()),
    GoRoute(
      path: '/receipts',
      builder: (context, state) => const ReceiptListPage(),
    ),

    GoRoute(
      path: '/receipts/add',
      builder: (context, state) => const AddReceiptPage(),
    ),
  ],
);
