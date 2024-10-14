import 'package:flutter/material.dart';
import '../../constants/colors.dart';

String getStatusText(String status) {
  switch (status) {
    case UserStatus.pending:
      return "Pending";
    case UserStatus.dead:
      return "Dead";
    case UserStatus.revived:
      return "Revived";
    case UserStatus.processing:
      return "Processing";
    case UserStatus.approved:
      return "Approved";
    case UserStatus.completed:
      return "Completed";
    case UserStatus.reclaimed:
      return "Reclaimed";
    case UserStatus.rejected:
      return "Rejected";
    case UserStatus.ongoing:
      return "On Going";
    case UserStatus.cancelled:
      return "Cancelled";
    default:
      return "Unknown Status";
  }
}

Color getStatusColor(String status) {
  switch (status) {
    case UserStatus.pending:
      return AppColor.orange;
    case UserStatus.dead:
      return AppColor.red;
    case UserStatus.rejected:
      return AppColor.red;
    case UserStatus.revived:
      return AppColor.green;
    case UserStatus.processing:
      return AppColor.matteBlue;
    case UserStatus.approved:
      return AppColor.matteBlue;
    case UserStatus.completed:
      return AppColor.green;
    case UserStatus.reclaimed:
      return AppColor.violet;
    case UserStatus.ongoing:
      return AppColor.orange;
    case UserStatus.cancelled:
      return AppColor.red;
    default:
      return AppColor.grey;
  }
}

class UserStatus {
  static const String pending = "pending";
  static const String dead = "dead";
  static const String revived = "revived";
  static const String processing = "processing";
  static const String completed = "completed";
  static const String reclaimed = "reclaimed";
  static const String rejected = "rejected";
  static const String approved = "approved";
  static const String inProgress = "inprogress";
  static const String created = "created";
  static const String onHold = "onhold";
  static const String converted = "converted";
  static const String cancelled = "cancelled";
  static const String ongoing = "ongoing";
  static const String givenToThirdParty = "given_to_third_party";
  static const String branchTransfer = "branch_transfer";
  static const String hot = "hot";
  static const String warm = "warm";
  static const String cold = "cold";
  static const String repaired = "repaired-collected";
  static const String notRepaired = "not-repaired-collected";
  static const String delivered = "repaired-delivered";
  static const String notDelivered = "not-repaired-delivered";
  static const String qualified = "qualified";
  static const String readyToClose = "ready_to_close";
  static const String lost = "lost";
}
