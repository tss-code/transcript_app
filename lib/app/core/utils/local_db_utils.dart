class LocalDBUtils {
  String? path;
  int? version;
  String? tableName;
  String? sqlCodeOnCreate;
  String? sqlCodeOnQuery;

  LocalDBUtils({
    this.path,
    this.version,
    this.tableName,
    this.sqlCodeOnCreate,
    this.sqlCodeOnQuery,
  });
}
