import 'package:flutter/material.dart';
import 'interceptors/logging_interceptor.dart';
import '../../../config/decoders.dart';
import 'package:nylo_framework/networking/ny_base_networking.dart';

class BaseApiService extends NyBaseApiService {
  BaseApiService(BuildContext? context) : super(context);

  /// Map decoders to modelDecoders
  @override
  final Map<Type, dynamic> decoders = modelDecoders;

  /// Default interceptors
  @override
  final interceptors = {
    LoggingInterceptor: LoggingInterceptor()
  };
}
