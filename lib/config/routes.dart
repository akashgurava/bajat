import 'package:flutter/material.dart';

import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../ui/pages/add_transaction/add_transaction_page.dart';
import '../ui/pages/home_page.dart';

/// Navigate to named routes.
Route<dynamic> router(RouteSettings settings) {
  switch (settings.name) {
    case '/':
      return MaterialWithModalsPageRoute<Widget>(
        builder: (_) => const HomePage(),
        settings: settings,
      );
      break;
    case '/add_transaction':
      return MaterialWithModalsPageRoute<Widget>(
        builder: (_) => const AddTransactionPage(),
        settings: settings,
      );
      break;
    default:
      return MaterialWithModalsPageRoute<Widget>(
        builder: (_) => Container(),
        settings: settings,
      );
      break;
  }
}
