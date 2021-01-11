import 'package:flutter/cupertino.dart';
import 'package:templeteproject/core/init/navigation/base_navigation.dart';

class NavigationService implements INavigationService {
  static NavigationService _instance = NavigationService._init();

  static NavigationService get instance => _instance;

  NavigationService._init();

  // tüm statede saklıcam ve yöneticem.
  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  // tüm route temizlemek için key
  final removeAllOldRoutes = (Route<dynamic> route) => false;

  @override
  Future<void> navigateToPage(String path, Object data) async {
    await navigatorKey.currentState.pushNamed(path, arguments: data);
  }

  @override
  Future<void> navigateToPageClear(String path, Object data) async {
    await navigatorKey.currentState
        .pushNamedAndRemoveUntil(path, removeAllOldRoutes, arguments: data);
  }
}
