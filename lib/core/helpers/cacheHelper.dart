import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper{

 static void setData({required String key , required dynamic value})async{
    SharedPreferences sharedPreferences =await SharedPreferences.getInstance();
    switch(value.runtimeType){
      case String:
        sharedPreferences.setString(key, value);
        break;
      case bool:
        sharedPreferences.setBool(key, value);
        break;
      default:
        throw Exception("invalid value type");
    }
  }
  
 static Future<dynamic> getData ({required String key})async{
   SharedPreferences sharedPreferences =await SharedPreferences.getInstance();
   return sharedPreferences.get(key);
 }

 static Future<bool> removeData({required String key})async{
   SharedPreferences sharedPreferences =await SharedPreferences.getInstance();
   return await sharedPreferences.remove(key);
 }
}