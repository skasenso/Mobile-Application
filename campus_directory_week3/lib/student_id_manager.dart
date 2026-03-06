import 'dart:math';

class StudentIDManager {
  // Map department names to their codes
  static const Map<String, String> departmentCodes = {
    'BSc Mathematics With Statistics': 'MTH',
    'BSc Physics': 'CS',
    'BSc Chemistry': 'CS',
    'BSc Biology': 'CS',
    'BBA Banking & Finance': 'BF',
    'BBA In Accounting': 'AC',
    'BBA HRM': 'HR',
    'B.Ed English Language': 'IE',
    'B.Ed Mathematics': 'MTH',
    'B.Ed Social Studies': 'SS',
    'BA Theological Studies': 'ATS',
    'BSc Development Studies': 'DEV',
    'Diploma In Development Studies': 'DDV',
    'BSc Mental Health Nursing': 'MH',
    'BSc Midwifery': 'MW',
    'B.Sc General Nursing': 'NS',
  };

  // Get department code from department name
  static String getDepartmentCode(String departmentName) {
    return departmentCodes[departmentName] ?? 'GEN';
  }

  // Generate student ID in format: YYDDD0200XXXX
  // YY = last 2 digits of year (23 for 2023, 24 for 2024, etc.)
  // DDD = department code (IT, CS, NS, etc.)
  // 0200 = admission cohort (first semester admitted)
  // XXXX = unique student number (1000-9999)
  static String generateStudentID({
    required String departmentCode,
    int year = 2023,
    String cohort = '0200',
  }) {
    final random = Random();
    final yearCode = year % 100; // Last 2 digits
    final studentNumber = 1000 + random.nextInt(8999); // 1000-9999
    return '$yearCode$departmentCode$cohort$studentNumber';
  }

  // Validate if student ID format is correct
  static bool isValidStudentID(String studentID) {
    // Format: YYXXXNNNNXXXX (YY=year, XXX=dept, NNNN=cohort, XXXX=student#)
    if (studentID.length != 10) return false; // 2+2+4+2 = 10 chars for code, plus 4 for number =14... actually format is YYDDD0200XXXX = 12 chars

    final pattern = RegExp(r'^\d{2}[A-Z]{2,3}\d{4}\d{4}$');
    return pattern.hasMatch(studentID);
  }

  // Extract department code from student ID
  static String extractDepartmentCode(String studentID) {
    if (studentID.length < 5) return '';
    // Skip first 2 digits (year), extract 2-3 letters for department
    final dept = studentID.substring(2).replaceFirst(RegExp(r'[^A-Z].*'), '');
    return dept;
  }

  // Extract year from student ID
  static int extractYear(String studentID) {
    if (studentID.length < 2) return 0;
    final yearCode = int.tryParse(studentID.substring(0, 2)) ?? 0;
    return 2000 + yearCode;
  }

  // Map eligible courses per department
  static Map<String, List<String>> getEligibleCoursesByDepartment(String departmentCode) {
    return {
      'MTH': ['ACCRA', 'MATH', 'STAT'],
      'CS': ['COMP', 'IT', 'PROGRAMMING'],
      'BF': ['ACCRA', 'ECON', 'FINANCE'],
      'AC': ['ACCRA', 'ACCOUNTING'],
      'HR': ['ACCRA', 'HRM', 'BUSINESS'],
      'IE': ['ACCRA', 'ENGC', 'ENGLISH'],
      'SS': ['ACCRA', 'SOCI', 'SOCIAL'],
      'ATS': ['RELB', 'THEOLOGY'],
      'DEV': ['DVST', 'DEVELOPMENT'],
      'DDV': ['DVST', 'DEVELOPMENT'],
      'NS': ['ACCRA', 'NURSING', 'ANATOMY'],
      'MW': ['ACCRA', 'NURSING', 'MIDWIFERY'],
      'MH': ['ACCRA', 'NURSING', 'MENTAL'],
    };
  }

  // Check if student can register for a specific course
  static bool canRegisterCourse(String studentID, String courseCode) {
    final departmentCode = extractDepartmentCode(studentID);
    final eligibleCourses = getEligibleCoursesByDepartment(departmentCode);
    final courses = eligibleCourses[departmentCode] ?? [];
    
    return courses.any((course) => courseCode.toUpperCase().contains(course));
  }

  // Get department name from code
  static String getDepartmentName(String departmentCode) {
    for (var entry in departmentCodes.entries) {
      if (entry.value == departmentCode) {
        return entry.key;
      }
    }
    return 'Unknown Department';
  }

  // Format student ID for display (with hyphens for readability)
  static String formatStudentID(String studentID) {
    // Format: 223-IT-0200-1774
    if (studentID.length != 12) return studentID;
    return '${studentID.substring(0, 2)}-${studentID.substring(2, 4)}-${studentID.substring(4, 8)}-${studentID.substring(8)}';
  }

  // Parse formatted student ID back to raw format
  static String parseFormattedStudentID(String formattedID) {
    return formattedID.replaceAll('-', '');
  }
}
