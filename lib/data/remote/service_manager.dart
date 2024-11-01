import 'package:dio/dio.dart';
import 'package:tikok_app_ver2/const/const.dart';
import 'package:tikok_app_ver2/data/remote/interceptors/auth_interceptor.dart';
import 'package:tikok_app_ver2/data/remote/service.dart';

class ServiceManager {
  static final ServiceManager _singleton = ServiceManager._internal();

  factory ServiceManager() {
    return _singleton;
  }

  ServiceManager._internal();

  Service? _service;
  Dio? dioClient;

  Service? get service => _service;

  static void initialize() {
    if ( _singleton.service == null ) {
      _singleton.getNewInstance();
    }
  }

  void getNewInstance() {
    dioClient = Dio();
    dioClient!.interceptors.add(AuthInterceptor());
    _service = Service(dioClient!, baseUrl: DOMAIN);
  }
}