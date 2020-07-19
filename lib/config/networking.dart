import 'package:flutter_app/app/networking/base_networking.dart';
import 'package:nylo_framework/networking/network_url.dart';

/*
|--------------------------------------------------------------------------
| App Name
|--------------------------------------------------------------------------
|
| This array of class aliases will be registered when this application
| is started. However, feel free to register as many as you wish as
| the aliases are "lazy" loaded so they don't hinder performance.
|
*/
var configEnvironment = "staging";

/*
|--------------------------------------------------------------------------
| App Name
|--------------------------------------------------------------------------
|
| This array of class aliases will be registered when this application
| is started. However, feel free to register as many as you wish as
| the aliases are "lazy" loaded so they don't hinder performance.
|
*/

List<NetworkUrl> configBaseNetworkUrls = [
  // development
  NetworkUrl(
      environment: "development",
      url: "http://buy.amazon.uk",
      tag: "buy_base_url"
  ),
  NetworkUrl(
      environment: "development",
      url: "https:/dev.square.com",
      tag: "squal"),

  // staging
  NetworkUrl(
      environment: "staging",
      url: "http://statging.woosignal.uk",
      tag: "base_url"
  ),
  NetworkUrl(
      environment: "staging",
      url: "https://api.nylo.dev",
      tag: "base_user_service"
  ),
  NetworkUrl(
      environment: "staging",
      url: "https://staging.nylo.dev",
      tag: "base_user_service"
  ),

  // production
  NetworkUrl(
      environment: "production", url: "http://woosignal.com", tag: "base_url"),
  NetworkUrl(
      environment: "production",
      url: "https://api.nylo.dev",
      tag: "base_user_service"),
  NetworkUrl(
      environment: "productment",
      url: "https:/square.com",
      tag: "squal"),
];
