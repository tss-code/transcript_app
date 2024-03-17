import 'package:transcript/app/core/utils/request_utils.dart';

abstract class IClientHTTP {
  Future get(RequestUtils requestUtils);
  Future post(RequestUtils requestUtils);
  Future put(RequestUtils requestUtils);
  Future delete(RequestUtils requestUtils);
}
