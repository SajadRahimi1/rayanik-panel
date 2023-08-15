import 'package:get/get.dart';
import 'package:dio/dio.dart';

final GetConnect getConnect =
    GetConnect(timeout: const Duration(seconds: 12), allowAutoSignedCert: true);

