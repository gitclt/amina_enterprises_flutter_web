import 'package:amina_enterprises_flutter_web/app/modules/settings/designation/views/designation_add.dart';
import 'package:get/get.dart';

import '../modules/dashboard/bindings/dashboard_binding.dart';
import '../modules/dashboard/views/dashboard_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/root/bindings/root_binding.dart';
import '../modules/root/views/root_view.dart';
import '../modules/settings/designation/bindings/designation_binding.dart';
import '../modules/settings/designation/views/designation_view.dart';

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
                ]
              ),
            ],
          ),

        ]),
 
  ];
}
