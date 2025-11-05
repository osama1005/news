
class SourceData{
  final String sourceId ;
  final String sourceName ;

  SourceData({
    required this.sourceId,
    required this.sourceName,
  });
   factory SourceData.fromJson(Map<String , dynamic> jason){
    return SourceData(sourceId: jason["id"], sourceName: jason["name"]);
  }

}