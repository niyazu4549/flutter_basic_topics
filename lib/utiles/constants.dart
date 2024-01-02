// Dashboard Images

import 'package:flutter_basic_topics/utiles/common_functions.dart';

String orderIcon = 'assets/images/orderIcon.png';
String customersIcon = 'assets/images/costomersIcon.png';
String inventoryIcon = 'assets/images/inventory.png';
String plantsIcon = 'assets/images/plants.png';
String sparesavailableIcon = 'assets/images/sparesavailabe.png';
String districtsIcon = 'assets/images/districts.png';
String avatarimage = 'assets/images/avatarimage.png';
String callIcon = 'assets/images/call.png';
String locationIcon = 'assets/images/location.png';


String plantReportOnDate = 'Plant Report On Date: ${getCurrentDatetime()}';


class ConstantVariables {
  static String userId = '';
  static String userName = '';
  static String plantId = '';
  static String reportId = '';
  static String plantName = '';
  static String plantAddress = '';
  static String remarks = '';
  static String customerName = '';
  static String executiveName = '';

  static List<String> selectedImages = [];
  static String? customerSignatureImageArray;
  static String? executiveSignatureImageArray;
  static List<Map<String, dynamic>> serviceListDataArray = [];
  static String deviceToken='';
}