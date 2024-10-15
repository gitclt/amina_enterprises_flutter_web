import 'package:amina_enterprises_flutter_web/app/modules/settings/role/bindings/role_binding.dart';
import 'package:amina_enterprises_flutter_web/app/modules/settings/role/views/role_view.dart';
import 'package:get/get.dart';

import '../modules/dashboard/bindings/dashboard_binding.dart';
import '../modules/dashboard/views/dashboard_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/root/bindings/root_binding.dart';
import '../modules/root/views/root_view.dart';
import '../modules/settings/bindings/settings_binding.dart';
import '../modules/settings/brand/bindings/brand_binding.dart';
import '../modules/settings/brand/views/brand_view.dart';
import '../modules/settings/category/bindings/category_binding.dart';
import '../modules/settings/category/views/category_view.dart';
import '../modules/settings/color/bindings/color_binding.dart';
import '../modules/settings/color/views/color_view.dart';
import '../modules/settings/construction/bindings/construction_binding.dart';
import '../modules/settings/construction/views/construction_view.dart';
import '../modules/settings/designation/bindings/designation_binding.dart';
import '../modules/settings/designation/views/designation_add.dart';
import '../modules/settings/designation/views/designation_view.dart';
import '../modules/settings/district/bindings/district_binding.dart';
import '../modules/settings/district/views/district_view.dart';
import '../modules/settings/state/bindings/state_binding.dart';
import '../modules/settings/state/views/state_view.dart';
import '../modules/settings/sub_category/bindings/sub_category_binding.dart';
import '../modules/settings/sub_category/views/sub_category_view.dart';
import '../modules/settings/views/settings_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.root;

  static final routes = [
    GetPage(
        name: _Paths.root,
        page: () => const RootView(),
        binding: RootBinding(),
        participatesInRootNavigator: true,
        preventDuplicates: true,
        children: [
          GetPage(
            name: _Paths.login,
            page: () => const LoginView(),
            binding: LoginBinding(),
            transition: Transition.fade,
          ),
          GetPage(
            // preventDuplicates: true,
            name: _Paths.home,
            transition: Transition.noTransition,
            page: () => HomeView(),
            bindings: [
              HomeBinding(),
            ],
            title: null,
            children: [
              GetPage(
                name: _Paths.dashboard,
                page: () => const DashboardView(),
                binding: DashboardBinding(),
                transition: Transition.noTransition,
                children: const [],
              ),
              GetPage(
                  name: _Paths.settings,
                  page: () => const SettingsView(),
                  transition: Transition.noTransition,
                  binding: SettingsBinding()),
              GetPage(
                  name: _Paths.designation,
                  page: () => const DesignationView(),
                  binding: DesignationBinding(),
                  children: [
                    GetPage(
                      name: _Paths.designationAdd,
                      page: () => const DesignationAdd(),
                      transition: Transition.noTransition,
                      binding: DesignationBinding(),
                    )
                  ]),
              GetPage(
                name: _Paths.subCategory,
                page: () => const SubCategoryView(),
                binding: SubCategoryBinding(),
              ),
              GetPage(
                name: _Paths.color,
                page: () => const ColorView(),
                binding: ColorBinding(),
              ),
              GetPage(
                name: _Paths.brand,
                page: () => const BrandView(),
                binding: BrandBinding(),
              ),
              GetPage(
                name: _Paths.category,
                page: () => const CategoryView(),
                binding: CategoryBinding(),
              ),
              GetPage(
                name: _Paths.construction,
                page: () => const ConstructionView(),
                binding: ConstructionBinding(),
              ),
              GetPage(
                name: _Paths.state,
                page: () => const StateView(),
                binding: StateBinding(),
              ),
              GetPage(
                name: _Paths.district,
                page: () => const DistrictView(),
                binding: DistrictBinding(),
              ),
              GetPage(
                name: _Paths.role,
                page: () => const RoleView(),
                binding: RoleBinding(),
              ),
            ],
          ),
        ]),
  ];
}
