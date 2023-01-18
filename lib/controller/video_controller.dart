import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:tiktok_clone/controller/auth_controller.dart';

import '../model/video_model.dart';

class VideoController extends GetxController{
  final Rx<List<VideoModel>> _videoList = Rx<List<VideoModel>>([]);
  List<VideoModel> get videoList => _videoList.value;

  @override
  void onInit() {
    super.onInit();
    _videoList.bindStream(FirebaseFirestore.instance.collection("videos").snapshots().map((QuerySnapshot query){
      List<VideoModel> retVal  = [];
      for(var element in query.docs){
        retVal.add(VideoModel.fromSnap(element));
      }
      return retVal;
    }));
  }
  likedVideo(String id)async{
    DocumentSnapshot doc=await FirebaseFirestore.instance.collection("videos").doc(id).get();
    var uid=AuthController.instance.user.uid;
    if((doc.data() as dynamic)['likes'].contains(uid)){
      await FirebaseFirestore.instance.collection("video").doc(id).update({
        'likes':FieldValue.arrayRemove([uid])
      });
    }
    else{
      await FirebaseFirestore.instance.collection("videos").doc(id).update({
        'likes':FieldValue.arrayUnion([uid])
      });
    }

  }
}