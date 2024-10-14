import 'package:amina_enterprises_flutter_web/app/constants/strings.dart';
import 'package:amina_enterprises_flutter_web/app/core/assets/image_assets.dart';
import 'package:amina_enterprises_flutter_web/app/domain/entity/menu_entity.dart';
import 'package:amina_enterprises_flutter_web/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SidemenuState {
  final RxInt _selectedIndex = 0.obs;
  RxInt get selectedIndex => _selectedIndex;
  final RxInt _selectedsubIndex = 0.obs;
  RxInt get selectedsubIndex => _selectedsubIndex;
  List<MenuEntity> menus = [];

  void onInit() {
    addMenuItems();
  }

  void addMenuItems() {
// dashboard
    menus.add(
      MenuEntity(
        id: 0,
        menu: 'Dashboard',
        icon: Icons.home_outlined,
        items: [],
        onClick: () {
          Get.rootDelegate.toNamed(Routes.dashboard);
        },
      ),
    );

    // Credit login

    for (var i in LocalStorageKey.privilage) {
      // Verify Payment
      if (i.privilageId == 2 && i.isView == 1) {
        menus.add(
          MenuEntity(
            id: i.privilageId,
            menu: i.menu ?? '',
            svgIcon: SvgAssets.sidemenu,
            items: [],
            onClick: () {
              //Get.rootDelegate.toNamed(Routes.paymentVerification);
            },
          ),
        );
      }
//Reports
      if (i.privilageId == 3 && i.isView == 1) {
        //employee
        // if (i.privilageId == 4 && i.isView == 1) {
        //   menus.add(MenuEntity(
        //       id: i.privilageId,
        //       menu: i.menu ?? '',
        //       svgIcon: SvgAssets.sidemenu,
        //       onClick: () {
        //         Get.rootDelegate.toNamed(Routes.viewEmployee);
        //       }));
        // }
        // //Product
        // if (i.privilageId == 17 && i.isView == 1) {
        //   menus.add(MenuEntity(
        //       id: i.privilageId,
        //       menu: i.menu ?? '',
        //       svgIcon: SvgAssets.sidemenu,
        //       onClick: () {
        //         Get.rootDelegate.toNamed(Routes.product);
        //       }));
        // }
        // master
        if (i.privilageId == 5 && i.isView == 1) {
          menus.add(MenuEntity(
              id: i.privilageId,
              menu: i.menu ?? '',
              svgIcon: SvgAssets.sidemenu,
              onClick: () {
               // Get.rootDelegate.toNamed(Routes.settings);
              }));
        }
      }
    }
  }
}
