import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:amina_enterprises_flutter_web/app/data/model/settings/roles/add_role_model.dart';
import 'package:amina_enterprises_flutter_web/app/data/model/settings/roles/role_privilage_model.dart';
import 'package:amina_enterprises_flutter_web/app/data/model/settings/roles/user_role_model.dart';
import 'package:amina_enterprises_flutter_web/app/domain/entity/dropdown_entity.dart';
import 'package:amina_enterprises_flutter_web/app/domain/entity/status.dart';
import 'package:amina_enterprises_flutter_web/app/domain/repositories/settings/settings_repository.dart';
import 'package:amina_enterprises_flutter_web/app/utils/utils.dart';

class RoleController extends GetxController {
  final rxRequestStatus = Status.completed.obs;
  RxBool isLoading = false.obs;
  RxBool isRoleLoading = false.obs;
  RxBool isAddLoading = false.obs;
  RxBool isPrivilageLoading = false.obs;
  TextEditingController nameController = TextEditingController();
  RxString error = ''.obs;

  DropDownModel selectedRoleId = DropDownModel(); // selected year

  RxList<DropDownModel> roleDropList = <DropDownModel>[].obs;
  RxList<RoleData> roleList = <RoleData>[].obs;
  RxList<RoleData> roleListCopy = <RoleData>[].obs;
  RxList<Privilage> rolePrivilageList = <Privilage>[].obs;
  final roleRepo = SettingsRepository();
  String editId = '';
  String roleId = '';

  @override
  void onInit() {
    super.onInit();
    getRoles();
    getRoleListApi();
  }

  final formkey = GlobalKey<FormState>();

  void setRxRequestStatus(Status value) => rxRequestStatus.value = value;
  void setError(String value) => error.value = value;

  void setRoleList(List<RoleData> value) {
    roleList.clear();
    roleListCopy.clear();
    roleList.addAll(value);
    roleListCopy.addAll(value);
  }

  void getRoles() async {
    isRoleLoading(true);
    roleDropList.clear();
    roleDropList.add(DropDownModel(id: '', name: '-- Select Role --'));
    final res = await roleRepo.getRoleList();
    res.fold((failure) {
      isRoleLoading(false);
      Utils.snackBar('Role', failure.message);
      setError(error.toString());
    }, (resData) {
      isRoleLoading(false);
      for (var item in resData.data!) {
        roleDropList
            .add(DropDownModel(id: item.id.toString(), name: item.name));
      }
    });
  }

  void getRoleListApi() async {
    setRxRequestStatus(Status.loading);

    final res = await roleRepo.getUserRoleList();

    res.fold(
      (failure) {
        setRxRequestStatus(Status.completed);
        Utils.snackBar('Role Error', failure.message);
        setError(error.toString());
      },
      (resData) {
        if (resData.data != null) {
          setRxRequestStatus(Status.completed);

          if (resData.data == null || resData.data!.isEmpty) return;
          setRoleList(resData.data!);
        }
      },
    );
  }

  void addRole() async {
    isAddLoading(true);
    final res = await roleRepo.roleAdd(
        roleName: nameController.text.trim(),
        roleId: selectedRoleId.id.toString());
    res.fold((failure) {
      setRxRequestStatus(Status.completed);
      Utils.snackBar('Role Error', failure.message);
      setError(error.toString());
    }, (resData) {
      setRxRequestStatus(Status.completed);
      //  Utils.snackBar('Role', 'Added Successfully');
      addRolePrivilage();
    });
  }

  void addRolePrivilage() async {
    setRxRequestStatus(Status.loading);
    final res = await roleRepo.rolePrivilageAdd(
        data: rolePrivilageList
            .map((e) => AddRoleModel(
                privilageId: e.privilageId.toString(),
                userRoleId: roleId,
                isAdd: e.isAdd.value,
                isDelete: e.isDelete.value,
                isEdit: e.isEdit.value,
                isView: e.isView.value))
            .toList());
    res.fold((failure) {
      setRxRequestStatus(Status.completed);
      Utils.snackBar('Role Error', failure.message);
      setError(error.toString());
    }, (resData) {
      setRxRequestStatus(Status.completed);
      Utils.snackBar('Role', 'Added Successfully');
      clear();
      getRoleListApi();
     // Get.rootDelegate.toNamed(Routes.role);
    });
  }

  void delete(String id) async {
    setRxRequestStatus(Status.loading);
    final res = await roleRepo.roleDelete(id: id);

    res.fold(
      (failure) {
        setRxRequestStatus(Status.completed);
        Utils.snackBar('Role Error', 'Something went wrong!!');
        setError(error.toString());
      },
      (resData) {
        setRxRequestStatus(Status.completed);

        if (resData.status == true) {
          Utils.snackBar('Role', 'Deleted Successfully');
          getRoleListApi();
        }
      },
    );
  }

  void editApi() async {
    isAddLoading(true);
    final res = await roleRepo.roleUpdate(
        roleName: nameController.text.trim(),
        roleId: selectedRoleId.id.toString(),
        id: editId);
    res.fold(
      (failure) {
        isAddLoading(false);
        Utils.snackBar('Role Error', 'Something went wrong!!');
        setError(error.toString());
      },
      (resData) {
        isAddLoading(false);

        if (resData.status == true) {
          //  Utils.snackBar('Role', 'Updated Successfully');
          editPrivilage(editId);
        }
      },
    );
  }

  void editClick(RoleData item) {
    nameController = TextEditingController(text: item.userRoleName);
    selectedRoleId = DropDownModel(
        id: item.roleId.toString(), name: item.userRoleName.toString());
    editId = item.id.toString();
   // Get.rootDelegate.toNamed(Routes.roleAdd);
  }

  getPrivilage() async {
    isPrivilageLoading(true);
    rolePrivilageList.clear();

    final res = await roleRepo.rolePrivilageList(roleId: roleId);
    res.fold(
      (failure) {
        isPrivilageLoading(false);
        Utils.snackBar('Role Error', 'Something went wrong!!');
        setError(error.toString());
      },
      (resData) {
        isPrivilageLoading(false);
        if (resData.privilage == null || resData.privilage!.isEmpty) return;
        if (resData.privilage != null) {
          rolePrivilageList.addAll(resData.privilage!);
        }
      },
    );
  }

  void clear() {
    nameController.clear();
    selectedRoleId = DropDownModel();
    editId = '';
    roleId = '';
  }

  void searchData(String value) {
    roleList.clear();

    if (value.isEmpty) {
      roleList.addAll(roleListCopy);
    } else {
      roleList.clear();
      roleList.addAll(roleListCopy
          .where((data) =>
              data.userRoleName!.toLowerCase().contains(value.toLowerCase()))
          .toList());
    }
  }

  void editPrivilage(String roleId) async {
    isAddLoading(true);
    final res = await roleRepo.rolePrivilageUpdate(
        data: rolePrivilageList
            .map((e) => AddRoleModel(
                privilageId: e.privilageId.toString(),
                userRoleId: roleId,
                isAdd: e.isAdd.value,
                isDelete: e.isDelete.value,
                isEdit: e.isEdit.value,
                isView: e.isView.value,
                id: e.id))
            .toList());
    res.fold((failure) {
      isAddLoading(false);
      Utils.snackBar('Role Error', failure.message);
      setError(error.toString());
    }, (resData) {
      isAddLoading(false);
      Utils.snackBar('Role', 'Updated Successfully');
      clear();
      getRoleListApi();
     // Get.rootDelegate.toNamed(Routes.role);
    });
  }

  getPrivilageEdit(String roleId) async {
    isPrivilageLoading(true);
    rolePrivilageList.clear();

    final res = await roleRepo.rolePrivilageList(roleId: roleId);
    res.fold(
      (failure) {
        isPrivilageLoading(false);
        Utils.snackBar('Role Error', 'Something went wrong!!');
        setError(error.toString());
      },
      (resData) {
        isPrivilageLoading(false);
        if (resData.privilage == null || resData.privilage!.isEmpty) return;
        if (resData.privilage != null) {
          rolePrivilageList.addAll(resData.privilage!);
        }
      },
    );
  }
}
