import 'package:intl/intl.dart';
import 'package:amina_enterprises_flutter_web/app/domain/entity/dropdown_entity.dart';

class AppConstValue {
  List<DropDownModel> year = _generateYear();
  List<DropDownModel> nextYears = _generateNextYears();
  List<DropDownModel> nextMonths = _generateNextMonths();

// vist
  List<DropDownModel> type = [
    DropDownModel(id: '1', name: 'Credit limit Enhancement'),
    DropDownModel(id: '2', name: 'New Lead'),
    DropDownModel(id: '3', name: 'Payment Follow up'),
    DropDownModel(id: '4', name: 'In Active Customer Visit'),
    DropDownModel(id: '5', name: 'For Orders'),
    DropDownModel(id: '6', name: 'tour'),
    DropDownModel(id: '7', name: 'Work from Home'),
    DropDownModel(id: '8', name: 'Live'),
    DropDownModel(id: '9', name: 'New Customer'),
    DropDownModel(id: '10', name: 'Cheque Collection'),
    DropDownModel(id: '11', name: 'Remark'),
    DropDownModel(id: '12', name: 'Credit day Enhancement'),
  ];
  List<DropDownModel> visitType = [
    DropDownModel(id: '1', name: 'Coordinator Remark'),
    DropDownModel(id: '2', name: 'Work from Home'),
    DropDownModel(id: '3', name: 'New Lead Created'),
    DropDownModel(id: '4', name: 'Live'),
    DropDownModel(id: '5', name: 'Buissness Head Remark'),
    DropDownModel(id: '6', name: 'Zsm Remark'),
    DropDownModel(id: '7', name: 'Executive Remark'),
  ];

  List<DropDownModel> routeVisitType = [
    DropDownModel(id: '1', name: 'LIVE'),
    DropDownModel(id: '2', name: 'WORK FROM HOME'),
  ];

  List<DropDownModel> isBde = [
    DropDownModel(id: '0', name: 'No'),
    DropDownModel(id: '1', name: 'Yes'),
  ];

  static List<DropDownModel> _generateYear() {
    final DateTime now = DateTime.now();
    final String currentYear = DateFormat('yyyy').format(now);
    final String previousYear =
        DateFormat('yyyy').format(DateTime(now.year - 1));

    return [
      DropDownModel(id: '1', name: currentYear),
      DropDownModel(id: '2', name: previousYear),
    ];
  }

  static List<DropDownModel> _generateNextYears() {
    final DateTime now = DateTime.now();
    final String currentYear = DateFormat('yyyy').format(now);
    final String nextYear = DateFormat('yyyy').format(DateTime(now.year + 1));

    return [
      DropDownModel(id: '1', name: currentYear),
      DropDownModel(id: '2', name: nextYear),
    ];
  }

  static List<DropDownModel> _generateNextMonths() {
    final List<DropDownModel> months = [];
    final DateTime now = DateTime.now();
    final DateFormat monthFormat =
        DateFormat('MMMM'); // e.g., January, February, etc.

    for (int i = 1; i <= 4; i++) {
      DateTime nextMonth = DateTime(now.year, now.month + i, 1);
      months.add(DropDownModel(
        id: (i + 2).toString(), // Adjusting ID to avoid conflict with year IDs
        name: monthFormat.format(nextMonth),
      ));
    }

    return months;
  }

  List<DropDownModel> months = [
    DropDownModel(id: '1', name: 'JANUARY'),
    DropDownModel(id: '2', name: 'FEBRUARY'),
    DropDownModel(id: '3', name: 'MARCH'),
    DropDownModel(id: '4', name: 'APRIL'),
    DropDownModel(id: '5', name: 'MAY'),
    DropDownModel(id: '6', name: 'JUNE'),
    DropDownModel(id: '7', name: 'JULY'),
    DropDownModel(id: '8', name: 'AUGUST'),
    DropDownModel(id: '9', name: 'SEPTEMBER'),
    DropDownModel(id: '10', name: 'OCTOBER'),
    DropDownModel(id: '11', name: 'NOVEMBER'),
    DropDownModel(id: '12', name: 'DECEMBER'),
  ];

  List<DropDownModel> filterTypes = [
    DropDownModel(id: 'all', name: 'All'),
    DropDownModel(id: 'my_customer', name: 'My Customer')
  ];

  
  List<DropDownModel> custemerTypes = [
    DropDownModel(id: 'delear', name: 'Delear'),
    DropDownModel(id: 'subdelear', name: 'SubDelear')
  ];

  List<DropDownModel> flags = [
    DropDownModel(id: '1', name: 'Lead'),
    DropDownModel(id: '2', name: 'Customer'),
    DropDownModel(id: '3', name: 'Prospective 1'),
    DropDownModel(id: '4', name: 'Prospective 2'),
    DropDownModel(id: '5', name: 'Inactive Customer'),
    DropDownModel(id: '6', name: 'Lead Enquiry'),
  ];

  List<DropDownModel> leadSources = [
    DropDownModel(id: '1', name: 'Ads'),
    DropDownModel(id: '2', name: 'Direct Visit'),
    DropDownModel(id: '3', name: 'Exhibition'),
    DropDownModel(id: '4', name: 'Existing'),
    DropDownModel(id: '5', name: 'Friends'),
    DropDownModel(id: '6', name: 'Newspaper'),
    DropDownModel(id: '7', name: 'Online')
  ];

  List<DropDownModel> priority = [
    DropDownModel(id: '1', name: '1'),
    DropDownModel(id: '2', name: '2'),
    DropDownModel(id: '3', name: '3'),
  ];
}
