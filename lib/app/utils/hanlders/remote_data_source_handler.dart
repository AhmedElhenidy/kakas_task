import 'dart:developer';
import 'package:http/http.dart';
import 'package:kakas_task/features/auth_feature/presentation/screens/signin_screen.dart';
import '../../../features/auth_feature/data/model/user_model.dart';
import '../../error/exceptions.dart';
import '../../model/global_response_model.dart';
import '../../services/cache_service.dart';
import '../get_it_injection.dart';
import '../helper.dart';

class RemoteDataSourceCallHandler {
  RemoteDataSourceCallHandler();

  Future<dynamic> call(Response res,) async {
    log(res.body.toString(),name: "response is ");
    if (res.statusCode == 200) {
      GlobalResponseModel response ;
      response = GlobalResponseModel.fromJson(res.body.toString());
      if(response.success==false){
        throw ServerException(response.msg??"unknown Error");
      }else{
        return response.data??{};
      }
    } else {
      throw ServerException("unknown error");
    }
  }

  Future<GlobalResponseModel> handleFormData(StreamedResponse res,) async {
    log(res.statusCode.toString(),name: "status code");
    String responseData = await res.stream.bytesToString();
    log(responseData,name: "response body");
    if (res.statusCode == 200) {
      final response = GlobalResponseModel.fromJson(responseData);
      if(response.authError==true){
        await getIt<CacheService>().clear();
        navigateTo(SignInScreen(),removeAll: true);
        throw ServerException(response.msg ?? "unknown Error");
      }
      else if(response.success==false) {
        if(response.key=="needActive"){
          throw AuthException(response.msg??"unknown Error",user:UserModel.fromMap(response.data['user']));
        }
        throw ServerException(response.msg ?? "unknown Error");
      }
      return response;
    } else {
      throw ServerException("unknown error${res.statusCode}");
    }
  }
}
