import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/tool.dart';

class ToolsService{
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  late CollectionReference toolsRef ;
  ToolsService() : super();

  Future<List<Tool>> getAllTools() async{
    try{
      toolsRef = _firestore.collection('tools');
      QuerySnapshot snapshot = await toolsRef.get();

      List<Map<String, dynamic>> documents = snapshot.docs.map((doc) {
        return doc.data() as Map<String, dynamic>;
      }).toList();

      return getToolsFromMapList(documents);
    }catch(e){
      rethrow;
    }
  }

  Future<List<Tool>> getToolBySellerId(String sellerUid) async {
    toolsRef = _firestore.collection("tools");

    try {
      QuerySnapshot querySnapshot = await toolsRef
          .where('seller_uid', isEqualTo: sellerUid)
          .get();

      List<Map<String, dynamic>> documents = querySnapshot.docs.map((doc) {
        return doc.data() as Map<String, dynamic>;
      }).toList();

      return getToolsFromMapList(documents);

    } catch (e) {
      throw "Error fetching Tools: $e";
    }
  }

  List<Tool> getToolsFromMapList(List<Map<String,dynamic>> documents){
    List<Tool> allTools = List.empty();

    for(Map<String,dynamic> map in documents){
      allTools.add(Tool.fromMap(map));
    }

    return allTools;
  }
}