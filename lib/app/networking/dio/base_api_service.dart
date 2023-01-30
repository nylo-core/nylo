import 'package:flutter/material.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import '/config/decoders.dart';
import 'package:nylo_framework/networking/ny_base_networking.dart';

class BaseApiService extends NyBaseApiService {
  BaseApiService(BuildContext? context) : super(context);

  /// Map decoders to modelDecoders
  @override
  final Map<Type, dynamic> decoders = modelDecoders;

  /// Default interceptors
  @override
  final interceptors = {
    PrettyDioLogger: PrettyDioLogger()
  };
}
