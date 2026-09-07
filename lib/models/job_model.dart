import 'dart:nativewrappers/_internal/vm/lib/ffi_native_type_patch.dart';

import 'package:flutter/material.dart';

class JobModel {
  final String jobId;
  final String jobTitle;
  final String jobDescription;
  final Double? jobSalary;
  final List<String> jobQualifications;
  final String jobImageUrl;
  final DateTime jobAddedDate;
  final TimeOfDay jobAddedTime;
  final String? jobLocationUrl;
  final String jobType;
  final String jobApplicationCloseDate;
  final bool isNewJob;
  final bool isPromotedJob;

  new({
    required this.jobId,
    required this.jobTitle,
    required this.jobDescription,
    required this.jobSalary,
    required this.jobQualifications,
    required this.jobImageUrl,
    required this.jobAddedDate,
    required this.jobAddedTime,
    required this.jobLocationUrl,
    required this.jobType,
    required this.jobApplicationCloseDate,
    required this.isNewJob,
    required this.isPromotedJob,
  });
}
