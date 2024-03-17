import 'package:transcript/app/core/utils/local_db_utils.dart';

abstract class ILocalDataSource {
  Future fetchDataFromLocal(LocalDBUtils localDBUtils);
  Future sendDataToLocal(
      LocalDBUtils localDBUtils, Map<String, Object?> values);
  Future deleteDataFromLocal(
      LocalDBUtils localDBUtils, Map<String, Object?> values);
  Future updateDataToLocal(
      LocalDBUtils localDBUtils, Map<String, Object?> values);
}
