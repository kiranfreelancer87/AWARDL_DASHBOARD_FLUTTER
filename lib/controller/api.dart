import 'dart:async';
import 'dart:convert';

// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:untitled/model/result.dart';
import 'package:dio/dio.dart';

class ApiController extends GetxController {
  var client = http.Client();
  RxList<ResultModel>? results = RxList<ResultModel>();

  @override
  void onReady() {
    Timer.periodic(const Duration(seconds: 1), (timer) async {
      await fatchData();
    });
    super.onReady();
  }

  fatchData() async {
    final dio = Dio();
    var response = await dio.get('http://localhost:5000/getLeaderboard');
    var respo = jsonDecode(response.data);

    results!.clear();


    for (var e in respo["data"]) {
      var i = ResultModel.fromJson(e);
      results!.add(i);
    }
    update();
  }
}
