import 'package:flutter/material.dart';
import 'package:nylo_framework/nylo_framework.dart';
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
    if (getEnv('APP_DEBUG', defaultValue: false) == true)
    PrettyDioLogger: PrettyDioLogger()
  };

  /// Make a GET request
  Future<T?> get<T>(String url, {Object? data,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,}) async {
    if (T.toString() == 'dynamic') {
      return await network(
        request: (request) =>
            request.getUri(Uri.parse(url), data: data, options: options,
                cancelToken: cancelToken,
                onReceiveProgress: onReceiveProgress),
      );
    }
    return await network<T>(
      request: (request) => request.getUri(Uri.parse(url), data: data, options: options,
          cancelToken: cancelToken,
          onReceiveProgress: onReceiveProgress),
    );
  }

  /// Make a POST request
  Future<T?> post<T>(String url, {
    Object? data,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    if (T.toString() == 'dynamic') {
      return await network(
        request: (request) => request.postUri(Uri.parse(url), data: data, options: options,
            cancelToken: cancelToken,
            onSendProgress: onSendProgress,
            onReceiveProgress: onReceiveProgress),
      );
    }
    return await network<T>(
      request: (request) => request.postUri(Uri.parse(url), data: data, options: options,
          cancelToken: cancelToken,
          onSendProgress: onSendProgress,
          onReceiveProgress: onReceiveProgress),
    );
  }

  /// Make a PUT request
  Future<T?> put<T>(String url, {
    Object? data,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    if (T.toString() == 'dynamic') {
      return await network(
        request: (request) => request.postUri(Uri.parse(url), data: data, options: options,
            cancelToken: cancelToken,
            onSendProgress: onSendProgress,
            onReceiveProgress: onReceiveProgress),
      );
    }
    return await network<T>(
      request: (request) => request.putUri(Uri.parse(url),
        data: data,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress),
    );
  }

  /// Make a DELETE request
  Future<T?> delete<T>(String url,
      Object? data,
      Options? options,
      CancelToken? cancelToken) async {
    if (T.toString() == 'dynamic') {
      return await network(
        request: (request) =>
            request.deleteUri(Uri.parse(url), data: data,
                options: options,
                cancelToken: cancelToken),
      );
    }
    return await network<T>(
      request: (request) =>
          request.deleteUri(Uri.parse(url), data: data,
              options: options,
              cancelToken: cancelToken),
    );
  }

  @override
  displayError(DioError dioError, BuildContext context) {
    NyLogger.error(dioError.message ?? "");
    showToastNotification(context, title: "Oops!", description: "Something went wrong", style: ToastNotificationStyleType.DANGER);
  }
}
