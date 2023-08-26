
class AppDeepLinking {
  static String buildLink(String path, {Map<String, dynamic>? query})  {
    final dynamicLink = Uri.https("www.mabanysouq.com",path,query) ;
    return dynamicLink.toString();
  }
}

