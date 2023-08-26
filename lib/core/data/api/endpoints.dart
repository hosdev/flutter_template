class ENDPOINTS {
  //ToDO: Add base url
  static const String baseURL = "test.test.com";
  static const String protocol = "https";

  static String get login => "api/v1/login";
  static String get loginBySocial => "api/v1/loginByProvider";
  static String get register => "api/v1/register";
  static String get myProfile => "api/v1/user-info";
  static String get updateProfile => "api/v1/user-info-update";
  static String get updateEducationalProfile => "api/change_account_type";
  static String get forgotPassSendEmail => "api/send-email-verification-code";
  static String get onboarding => "api/v1/onboarding-screens";
  static String get forgotPassSendCode => "";
  static String get forgotPassChange => "api/password-reset";

  static String get homeFeatured => "api/v1/latest-property";
  static String get mostViewed => "api/v1/get-most-watched-properties";
  static String get forRentProps => "api/v1/get-rent-properties";
  static String get forSellProps => "api/v1/get-sale-properties";
  static String get reels => "api/v1/property-reels";
  static String get homeBanners => "api/v1/banners";
  static String get myCourses => "api/v1/user-courses";
  static String get favorite => "api/v1/favorite-property-by-category";
  static String get favoriteAll => "api/v1/favorite-property-by-user";
  static String get favoriteAdd => "api/v1/favorite-property";
  static String get privacy => "api/v1/term-and-condition";
  static String get terms => "api/v1/privacy-policy";
  static String get aboutUs => "api/v1/about-us";
  static String get helps => "api/v1/helps";
  static String get contact => "api/v1/contact-us";
  static String get partner => "api/v1/partner";
  static String get categories => "api/v1/categories";
  static String get notification => "api/v1/get-notification-by-user";
  static String get propertyByCategory => "api/v1/property-by-category";
  static String get filterProperty => "api/v1/filter-property";
  static String get myProperty => "api/v1/my-property";
  static String get deleteProperty => "api/v1/delete-property";
  static String get propertyById => "api/v1/property-by-id";
  static String get propertiesByUserId => "api/v1/properties-by_user-id";
  static String get userById => "api/v1/user-profile-by-id";

  static String get questionsByCategory => "api/v1/questions-by-category";
  static String get featuresOfProperty => "api/v1/features";
  static String get nearbyPlacesProperty => "api/v1/nearby-places";
  static String get paymentWayProperty => "api/v1/property-payment-method";
  static String get cities => "api/v1/cities";
  static String get area => "api/v1/areas-by-city";
  static String get createProperty => "api/v1/add-property";
  static String get updateProperty => "api/v1/edit-property";
  static String get addImageToProperty => "api/v1/add-single-image-property";
  static String get addReelToProperty => "api/v1/add_reel_property";
  static String get deleteImageProperty => "api/v1/delete-image-property";
  static String get deleteReel => "api/v1/delete-reel-property";
}
