import 'package:flutter/material.dart';
import 'package:flutter_app/config/networking.dart';
import 'package:nylo_framework/networking/network_environment.dart';

class BaseNetworking {
  NetworkEnvironment _networkEnvironments;

  BaseNetworking() {
    _networkEnvironments = NetworkEnvironment(configBaseNetworkUrls,
        environment: configEnvironment);
  }

  String getUrl({String tag = "base_url"}) {
    return this._networkEnvironments.getBaseUrl(tag: tag);
  }
}
