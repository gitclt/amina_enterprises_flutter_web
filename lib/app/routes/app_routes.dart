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
  static const subCategory = _Paths.home + _Paths.subCategory;
  static const color = _Paths.home + _Paths.color;
  static const brand = _Paths.home + _Paths.brand;
  static const brandAdd = _Paths.home + _Paths.brand + _Paths.brandAdd;
  static const category = _Paths.home + _Paths.category;
  static const categoryAdd = _Paths.home + _Paths.category + _Paths.categoryAdd;
  static const construction = _Paths.home + _Paths.construction;
  static const state = _Paths.home + _Paths.state;
  static const district = _Paths.home + _Paths.district;
  static const role = _Paths.home + _Paths.role;
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
  static const subCategory = '/sub-category';
  static const color = '/color';
  static const brand = '/brand';
  static const brandAdd = '/brand-add';
  static const category = '/category';
  static const categoryAdd = '/category-add';
  static const construction = '/construction';
  static const state = '/state';
  static const district = '/district';
  static const role = '/role';
}
