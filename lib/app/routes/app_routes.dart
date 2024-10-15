part of 'app_pages.dart';
// DO NOT EDIT. This is code generated via package:get_cli/get_cli.dart

abstract class Routes {
  Routes._();
  static const home = _Paths.home;
  static const login = _Paths.login;
  static const root = _Paths.root;
  static const dashboard = _Paths.home + _Paths.dashboard;

  //settings
  static const designation = _Paths.home + _Paths.designation;
   static const designationAdd =
      _Paths.home + _Paths.designation + _Paths.designationAdd;
    static const settings = _Paths.home + _Paths.settings;
}

abstract class _Paths {
  _Paths._();
  static const home = '/home';
  static const login = '/login';
  static const root = '/';
  static const dashboard = '/dashboard';
  
//settings
   static const settings = '/settings';
   static const designation = '/designation';
   static const designationAdd = '/designation-add';
}
