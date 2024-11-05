import 'package:get/get.dart';

import '../modules/customer/bindings/customer_binding.dart';
import '../modules/customer/views/customer_add.dart';
import '../modules/customer/views/customer_view.dart';
import '../modules/dashboard/bindings/dashboard_binding.dart';
import '../modules/dashboard/views/dashboard_view.dart';
import '../modules/employee/bindings/employee_binding.dart';
import '../modules/employee/views/employee_add.dart';
import '../modules/employee/views/employee_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/product/bindings/product_binding.dart';
import '../modules/product/views/product_add.dart';
import '../modules/product/views/product_view.dart';
import '../modules/root/bindings/root_binding.dart';
import '../modules/root/views/root_view.dart';
import '../modules/route_setting/bindings/route_setting_binding.dart';
import '../modules/route_setting/views/route_setting_view.dart';
import '../modules/settings/bindings/settings_binding.dart';
import '../modules/settings/brand/bindings/brand_binding.dart';
import '../modules/settings/brand/views/brand_add.dart';
import '../modules/settings/brand/views/brand_view.dart';
import '../modules/settings/category/bindings/category_binding.dart';
import '../modules/settings/category/views/category_add.dart';
import '../modules/settings/category/views/category_view.dart';
import '../modules/settings/color/bindings/color_binding.dart';
import '../modules/settings/color/views/color_add.dart';
import '../modules/settings/color/views/color_view.dart';
import '../modules/settings/construction/bindings/construction_binding.dart';
import '../modules/settings/construction/views/construction_add.dart';
import '../modules/settings/construction/views/construction_view.dart';
import '../modules/settings/designation/bindings/designation_binding.dart';
import '../modules/settings/designation/views/designation_add.dart';
import '../modules/settings/designation/views/designation_view.dart';
import '../modules/settings/district/bindings/district_binding.dart';
import '../modules/settings/district/views/district_add.dart';
import '../modules/settings/district/views/district_view.dart';
import '../modules/settings/division/bindings/division_binding.dart';
import '../modules/settings/division/views/division_add.dart';
import '../modules/settings/division/views/division_view.dart';
import '../modules/settings/main_category/bindings/main_category_binding.dart';
import '../modules/settings/main_category/views/main_category_add.dart';
import '../modules/settings/main_category/views/main_category_view.dart';
import '../modules/settings/role/bindings/role_binding.dart';
import '../modules/settings/role/views/role_view.dart';
import '../modules/settings/size/bindings/size_binding.dart';
import '../modules/settings/size/views/size_add.dart';
import '../modules/settings/size/views/size_view.dart';
import '../modules/settings/state/bindings/state_binding.dart';
import '../modules/settings/state/views/state_add.dart';
import '../modules/settings/state/views/state_view.dart';
import '../modules/settings/sub_category/bindings/sub_category_binding.dart';
import '../modules/settings/sub_category/views/sub_category_add.dart';
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
                  name: _Paths.customer,
                  page: () => const CustomerView(),
                  transition: Transition.noTransition,
                  binding: CustomerBinding(),
                  children: [
                    GetPage(
                      name: _Paths.customerAdd,
                      page: () => const CustomerAdd(),
                      binding: CustomerBinding(),
                    )
                  ]),
              GetPage(
                  name: _Paths.product,
                  page: () => const ProductView(),
                  binding: ProductBinding(),
                  transition: Transition.noTransition,
                  children: [
                    GetPage(
                      name: _Paths.productAdd,
                      page: () => const ProductAdd(),
                      binding: ProductBinding(),
                    ),
                  ]),
              GetPage(
                  name: _Paths.settings,
                  page: () => const SettingsView(),
                  transition: Transition.noTransition,
                  binding: SettingsBinding()),
              GetPage(
                  name: _Paths.designation,
                  page: () => const DesignationView(),
                  transition: Transition.noTransition,
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
                transition: Transition.noTransition,
                binding: SubCategoryBinding(),
                children: [
                  GetPage(
                    name: _Paths.subCategoryAdd,
                    page: () => const SubCategoryAdd(),
                    transition: Transition.noTransition,
                    binding: SubCategoryBinding(),
                  )
                ],
              ),
              GetPage(
                name: _Paths.color,
                page: () => const ColorView(),
                transition: Transition.noTransition,
                binding: ColorBinding(),
                children: [
                  GetPage(
                    name: _Paths.colorAdd,
                    page: () => const ColorAdd(),
                    transition: Transition.noTransition,
                    binding: ColorBinding(),
                  )
                ],
              ),
              GetPage(
                  name: _Paths.brand,
                  page: () => const BrandView(),
                  transition: Transition.noTransition,
                  binding: BrandBinding(),
                  children: [
                    GetPage(
                      name: _Paths.brandAdd,
                      page: () => const BrandAddView(),
                      transition: Transition.noTransition,
                      binding: BrandBinding(),
                    )
                  ]),
              GetPage(
                name: _Paths.category,
                page: () => const CategoryView(),
                transition: Transition.noTransition,
                binding: CategoryBinding(),
                children: [
                  GetPage(
                    name: _Paths.categoryAdd,
                    page: () => const CategoryAdd(),
                    transition: Transition.noTransition,
                    binding: CategoryBinding(),
                  )
                ],
              ),
              GetPage(
                  name: _Paths.mainCategory,
                  page: () => const MainCategoryView(),
                  transition: Transition.noTransition,
                  binding: MainCategoryBinding(),
                  children: [
                    GetPage(
                      name: _Paths.mainCategoryAdd,
                      page: () => const MainCategoryAdd(),
                      transition: Transition.noTransition,
                      binding: MainCategoryBinding(),
                    )
                  ]),
              GetPage(
                name: _Paths.construction,
                page: () => const ConstructionView(),
                transition: Transition.noTransition,
                binding: ConstructionBinding(),
                children: [
                  GetPage(
                    name: _Paths.constructionAdd,
                    page: () => const ConstructionAdd(),
                    transition: Transition.noTransition,
                    binding: ConstructionBinding(),
                  )
                ],
              ),
              GetPage(
                  name: _Paths.division,
                  page: () => const DivisionView(),
                  transition: Transition.noTransition,
                  binding: DivisionBinding(),
                  children: [
                    GetPage(
                      name: _Paths.divisionAdd,
                      page: () => const DivisionAdd(),
                      binding: DivisionBinding(),
                    ),
                  ]),
              GetPage(
                name: _Paths.state,
                page: () => const StateView(),
                transition: Transition.noTransition,
                binding: StateBinding(),
                children: [
                  GetPage(
                    name: _Paths.stateAdd,
                    page: () => const StateAdd(),
                    transition: Transition.noTransition,
                    binding: StateBinding(),
                  )
                ],
              ),
              GetPage(
                name: _Paths.district,
                page: () => const DistrictView(),
                transition: Transition.noTransition,
                binding: DistrictBinding(),
                children: [
                  GetPage(
                    name: _Paths.districtAdd,
                    page: () => const DistrictAdd(),
                    transition: Transition.noTransition,
                    binding: DistrictBinding(),
                  )
                ],
              ),
              GetPage(
                  name: _Paths.employee,
                  page: () => const EmployeeView(),
                  transition: Transition.noTransition,
                  binding: EmployeeBinding(),
                  children: [
                    GetPage(
                      name: _Paths.employeeAdd,
                      page: () => const EmployeeAdd(),
                      transition: Transition.noTransition,
                      binding: EmployeeBinding(),
                    ),
                  ]),
                    GetPage(
                name: _Paths.routeSetting,
                page: () => const RouteSettingView(),
                binding: RouteSettingBinding(),
              ),
              GetPage(
                name: _Paths.role,
                page: () => const RoleView(),
                transition: Transition.noTransition,
                binding: RoleBinding(),
              ),
              GetPage(
                  name: _Paths.size,
                  page: () => const SizeView(),
                  transition: Transition.noTransition,
                  binding: SizeBinding(),
                  children: [
                    GetPage(
                      name: _Paths.sizeAdd,
                      page: () => const SizeAdd(),
                      transition: Transition.noTransition,
                      binding: SizeBinding(),
                    ),
                  ]),
            ],
          ),
        ]),
  
  ];
}
