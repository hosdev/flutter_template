// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Sign in with password`
  String get signInWithPassword {
    return Intl.message(
      'Sign in with password',
      name: 'signInWithPassword',
      desc: '',
      args: [],
    );
  }

  /// `Welcome Back!`
  String get welcomeBack {
    return Intl.message(
      'Welcome Back!',
      name: 'welcomeBack',
      desc: '',
      args: [],
    );
  }

  /// `Email or Phone Number`
  String get phoneNumberOrEmailAddress {
    return Intl.message(
      'Email or Phone Number',
      name: 'phoneNumberOrEmailAddress',
      desc: '',
      args: [],
    );
  }

  /// `The email field is required`
  String get emailIsRequired {
    return Intl.message(
      'The email field is required',
      name: 'emailIsRequired',
      desc: '',
      args: [],
    );
  }

  /// `The password field is required`
  String get passwordIsRequired {
    return Intl.message(
      'The password field is required',
      name: 'passwordIsRequired',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Sign up to app`
  String get signUpToApp {
    return Intl.message(
      'Sign up to app',
      name: 'signUpToApp',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Phone Number`
  String get phoneNumber {
    return Intl.message(
      'Phone Number',
      name: 'phoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `The phone number field is required`
  String get phoneIsRequired {
    return Intl.message(
      'The phone number field is required',
      name: 'phoneIsRequired',
      desc: '',
      args: [],
    );
  }

  /// `Your Account Type`
  String get yourAccountType {
    return Intl.message(
      'Your Account Type',
      name: 'yourAccountType',
      desc: '',
      args: [],
    );
  }

  /// `Expected To Graduate On`
  String get expectedToGraduateOn {
    return Intl.message(
      'Expected To Graduate On',
      name: 'expectedToGraduateOn',
      desc: '',
      args: [],
    );
  }

  /// `Add Expected To Graduate Date`
  String get addExpectedToGraduateDate {
    return Intl.message(
      'Add Expected To Graduate Date',
      name: 'addExpectedToGraduateDate',
      desc: '',
      args: [],
    );
  }

  /// `Take a picture of the University ID card on both sides.`
  String get takePictureUniversityCardBothSides {
    return Intl.message(
      'Take a picture of the University ID card on both sides.',
      name: 'takePictureUniversityCardBothSides',
      desc: '',
      args: [],
    );
  }

  /// `First face of the ID card`
  String get firstIdFace {
    return Intl.message(
      'First face of the ID card',
      name: 'firstIdFace',
      desc: '',
      args: [],
    );
  }

  /// `Second face of the ID card`
  String get secondIdFace {
    return Intl.message(
      'Second face of the ID card',
      name: 'secondIdFace',
      desc: '',
      args: [],
    );
  }

  /// `By signing in, you are agreeing with the terms & conditions of the services in the app`
  String get iAgreeWithTermsAndConditions {
    return Intl.message(
      'By signing in, you are agreeing with the terms & conditions of the services in the app',
      name: 'iAgreeWithTermsAndConditions',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up`
  String get signUp {
    return Intl.message(
      'Sign Up',
      name: 'signUp',
      desc: '',
      args: [],
    );
  }

  /// `Do you have an account?`
  String get doYouHaveAnAccount {
    return Intl.message(
      'Do you have an account?',
      name: 'doYouHaveAnAccount',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `First Name`
  String get firstName {
    return Intl.message(
      'First Name',
      name: 'firstName',
      desc: '',
      args: [],
    );
  }

  /// `Last Name`
  String get lastName {
    return Intl.message(
      'Last Name',
      name: 'lastName',
      desc: '',
      args: [],
    );
  }

  /// `Please answer`
  String get pleaseAnswer {
    return Intl.message(
      'Please answer',
      name: 'pleaseAnswer',
      desc: '',
      args: [],
    );
  }

  /// `Register`
  String get register {
    return Intl.message(
      'Register',
      name: 'register',
      desc: '',
      args: [],
    );
  }

  /// `Favorite`
  String get favorite {
    return Intl.message(
      'Favorite',
      name: 'favorite',
      desc: '',
      args: [],
    );
  }

  /// `Discover`
  String get discover {
    return Intl.message(
      'Discover',
      name: 'discover',
      desc: '',
      args: [],
    );
  }

  /// `Account`
  String get account {
    return Intl.message(
      'Account',
      name: 'account',
      desc: '',
      args: [],
    );
  }

  /// `Account Info`
  String get accountInfo {
    return Intl.message(
      'Account Info',
      name: 'accountInfo',
      desc: '',
      args: [],
    );
  }

  /// `Discover Promotions`
  String get discoverPromotions {
    return Intl.message(
      'Discover Promotions',
      name: 'discoverPromotions',
      desc: '',
      args: [],
    );
  }

  /// `Favorite Brands`
  String get favoriteBrands {
    return Intl.message(
      'Favorite Brands',
      name: 'favoriteBrands',
      desc: '',
      args: [],
    );
  }

  /// `Courses`
  String get courses {
    return Intl.message(
      'Courses',
      name: 'courses',
      desc: '',
      args: [],
    );
  }

  /// `See All`
  String get seeAll {
    return Intl.message(
      'See All',
      name: 'seeAll',
      desc: '',
      args: [],
    );
  }

  /// `Only for Students`
  String get onlyForStudents {
    return Intl.message(
      'Only for Students',
      name: 'onlyForStudents',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get search {
    return Intl.message(
      'Search',
      name: 'search',
      desc: '',
      args: [],
    );
  }

  /// `Visit Website`
  String get visitWebsite {
    return Intl.message(
      'Visit Website',
      name: 'visitWebsite',
      desc: '',
      args: [],
    );
  }

  /// `More offers by`
  String get moreOffersBy {
    return Intl.message(
      'More offers by',
      name: 'moreOffersBy',
      desc: '',
      args: [],
    );
  }

  /// `Terms & Conditions`
  String get termsConditions {
    return Intl.message(
      'Terms & Conditions',
      name: 'termsConditions',
      desc: '',
      args: [],
    );
  }

  /// `Student Account`
  String get studentAccount {
    return Intl.message(
      'Student Account',
      name: 'studentAccount',
      desc: '',
      args: [],
    );
  }

  /// `Graduated Account`
  String get graduatedAccount {
    return Intl.message(
      'Graduated Account',
      name: 'graduatedAccount',
      desc: '',
      args: [],
    );
  }

  /// `My Profile`
  String get myProfile {
    return Intl.message(
      'My Profile',
      name: 'myProfile',
      desc: '',
      args: [],
    );
  }

  /// `Support`
  String get support {
    return Intl.message(
      'Support',
      name: 'support',
      desc: '',
      args: [],
    );
  }

  /// `Used Vouchers`
  String get usedVouchers {
    return Intl.message(
      'Used Vouchers',
      name: 'usedVouchers',
      desc: '',
      args: [],
    );
  }

  /// `Category Preferences`
  String get categoryPreferences {
    return Intl.message(
      'Category Preferences',
      name: 'categoryPreferences',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get logout {
    return Intl.message(
      'Logout',
      name: 'logout',
      desc: '',
      args: [],
    );
  }

  /// `Verified until`
  String get verifiedUntil {
    return Intl.message(
      'Verified until',
      name: 'verifiedUntil',
      desc: '',
      args: [],
    );
  }

  /// `Edit Profile`
  String get editProfile {
    return Intl.message(
      'Edit Profile',
      name: 'editProfile',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get save {
    return Intl.message(
      'Save',
      name: 'save',
      desc: '',
      args: [],
    );
  }

  /// `Edit Profile Information`
  String get editProfileInformation {
    return Intl.message(
      'Edit Profile Information',
      name: 'editProfileInformation',
      desc: '',
      args: [],
    );
  }

  /// `Edit Educational Information`
  String get editEducationalInformation {
    return Intl.message(
      'Edit Educational Information',
      name: 'editEducationalInformation',
      desc: '',
      args: [],
    );
  }

  /// `Reset To Defaults`
  String get resetToDefaults {
    return Intl.message(
      'Reset To Defaults',
      name: 'resetToDefaults',
      desc: '',
      args: [],
    );
  }

  /// `Education Information`
  String get educationInformation {
    return Intl.message(
      'Education Information',
      name: 'educationInformation',
      desc: '',
      args: [],
    );
  }

  /// `Your student account will be expired by {date}, if you are still studying please verify.`
  String accountStudentExpiredNote(Object date) {
    return Intl.message(
      'Your student account will be expired by $date, if you are still studying please verify.',
      name: 'accountStudentExpiredNote',
      desc: '',
      args: [date],
    );
  }

  /// `Passwords do not match`
  String get passwordsDoNotMatch {
    return Intl.message(
      'Passwords do not match',
      name: 'passwordsDoNotMatch',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message(
      'Home',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `Forgot your password?`
  String get forgotYourPassword {
    return Intl.message(
      'Forgot your password?',
      name: 'forgotYourPassword',
      desc: '',
      args: [],
    );
  }

  /// `Don't have an account?`
  String get dontHaveAnAccount {
    return Intl.message(
      'Don\'t have an account?',
      name: 'dontHaveAnAccount',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get next {
    return Intl.message(
      'Next',
      name: 'next',
      desc: '',
      args: [],
    );
  }

  /// `Logo`
  String get logo {
    return Intl.message(
      'Logo',
      name: 'logo',
      desc: '',
      args: [],
    );
  }

  /// `Submit`
  String get submit {
    return Intl.message(
      'Submit',
      name: 'submit',
      desc: '',
      args: [],
    );
  }

  /// `Phone`
  String get phone {
    return Intl.message(
      'Phone',
      name: 'phone',
      desc: '',
      args: [],
    );
  }

  /// `Apply`
  String get apply {
    return Intl.message(
      'Apply',
      name: 'apply',
      desc: '',
      args: [],
    );
  }

  /// `Date`
  String get date {
    return Intl.message(
      'Date',
      name: 'date',
      desc: '',
      args: [],
    );
  }

  /// `Student`
  String get student {
    return Intl.message(
      'Student',
      name: 'student',
      desc: '',
      args: [],
    );
  }

  /// `Graduate`
  String get graduate {
    return Intl.message(
      'Graduate',
      name: 'graduate',
      desc: '',
      args: [],
    );
  }

  /// `Repeat Password`
  String get repeatPassword {
    return Intl.message(
      'Repeat Password',
      name: 'repeatPassword',
      desc: '',
      args: [],
    );
  }

  /// `Change Language`
  String get changeLanguage {
    return Intl.message(
      'Change Language',
      name: 'changeLanguage',
      desc: '',
      args: [],
    );
  }

  /// `Close`
  String get close {
    return Intl.message(
      'Close',
      name: 'close',
      desc: '',
      args: [],
    );
  }

  /// `Join Now`
  String get joinNow {
    return Intl.message(
      'Join Now',
      name: 'joinNow',
      desc: '',
      args: [],
    );
  }

  /// `Let’s you in`
  String get introMessage {
    return Intl.message(
      'Let’s you in',
      name: 'introMessage',
      desc: '',
      args: [],
    );
  }

  /// `Please login to continue`
  String get loginToContinue {
    return Intl.message(
      'Please login to continue',
      name: 'loginToContinue',
      desc: '',
      args: [],
    );
  }

  /// `Do you want to logout?`
  String get doYouWantToLogout {
    return Intl.message(
      'Do you want to logout?',
      name: 'doYouWantToLogout',
      desc: '',
      args: [],
    );
  }

  /// `Please set an address in settings page`
  String get setAnAddressInSettingPage {
    return Intl.message(
      'Please set an address in settings page',
      name: 'setAnAddressInSettingPage',
      desc: '',
      args: [],
    );
  }

  /// `Received money`
  String get receivedMoney {
    return Intl.message(
      'Received money',
      name: 'receivedMoney',
      desc: '',
      args: [],
    );
  }

  /// `Debit`
  String get debit {
    return Intl.message(
      'Debit',
      name: 'debit',
      desc: '',
      args: [],
    );
  }

  /// `Transaction detail`
  String get transactionDetail {
    return Intl.message(
      'Transaction detail',
      name: 'transactionDetail',
      desc: '',
      args: [],
    );
  }

  /// `Payment successful`
  String get paymentSuccessful {
    return Intl.message(
      'Payment successful',
      name: 'paymentSuccessful',
      desc: '',
      args: [],
    );
  }

  /// `Time`
  String get time {
    return Intl.message(
      'Time',
      name: 'time',
      desc: '',
      args: [],
    );
  }

  /// `Transaction fee`
  String get transactionFee {
    return Intl.message(
      'Transaction fee',
      name: 'transactionFee',
      desc: '',
      args: [],
    );
  }

  /// `Free of charge`
  String get freeOfCharge {
    return Intl.message(
      'Free of charge',
      name: 'freeOfCharge',
      desc: '',
      args: [],
    );
  }

  /// `Wallet balance`
  String get walletBalance {
    return Intl.message(
      'Wallet balance',
      name: 'walletBalance',
      desc: '',
      args: [],
    );
  }

  /// `More information`
  String get moreInformation {
    return Intl.message(
      'More information',
      name: 'moreInformation',
      desc: '',
      args: [],
    );
  }

  /// `Wallet name`
  String get walletName {
    return Intl.message(
      'Wallet name',
      name: 'walletName',
      desc: '',
      args: [],
    );
  }

  /// `note`
  String get noteMessage {
    return Intl.message(
      'note',
      name: 'noteMessage',
      desc: '',
      args: [],
    );
  }

  /// `Send back`
  String get sendBack {
    return Intl.message(
      'Send back',
      name: 'sendBack',
      desc: '',
      args: [],
    );
  }

  /// `No Printers`
  String get noPrinters {
    return Intl.message(
      'No Printers',
      name: 'noPrinters',
      desc: '',
      args: [],
    );
  }

  /// `Select`
  String get select {
    return Intl.message(
      'Select',
      name: 'select',
      desc: '',
      args: [],
    );
  }

  /// `Checking...`
  String get checking {
    return Intl.message(
      'Checking...',
      name: 'checking',
      desc: '',
      args: [],
    );
  }

  /// `Printing...`
  String get printing {
    return Intl.message(
      'Printing...',
      name: 'printing',
      desc: '',
      args: [],
    );
  }

  /// `Turn On Bluetooth`
  String get turnOnBle {
    return Intl.message(
      'Turn On Bluetooth',
      name: 'turnOnBle',
      desc: '',
      args: [],
    );
  }

  /// `Date Time`
  String get dateTime {
    return Intl.message(
      'Date Time',
      name: 'dateTime',
      desc: '',
      args: [],
    );
  }

  /// `Order Number`
  String get orderNumber {
    return Intl.message(
      'Order Number',
      name: 'orderNumber',
      desc: '',
      args: [],
    );
  }

  /// `Print Receipt`
  String get printReceipt {
    return Intl.message(
      'Print Receipt',
      name: 'printReceipt',
      desc: '',
      args: [],
    );
  }

  /// `Printer Selection`
  String get printerSelection {
    return Intl.message(
      'Printer Selection',
      name: 'printerSelection',
      desc: '',
      args: [],
    );
  }

  /// `The printer not found`
  String get printerNotFound {
    return Intl.message(
      'The printer not found',
      name: 'printerNotFound',
      desc: '',
      args: [],
    );
  }

  /// `Item`
  String get item {
    return Intl.message(
      'Item',
      name: 'item',
      desc: '',
      args: [],
    );
  }

  /// `Printer`
  String get printer {
    return Intl.message(
      'Printer',
      name: 'printer',
      desc: '',
      args: [],
    );
  }

  /// `Change Printer`
  String get changePrinter {
    return Intl.message(
      'Change Printer',
      name: 'changePrinter',
      desc: '',
      args: [],
    );
  }

  /// `Select Printer`
  String get selectPrinter {
    return Intl.message(
      'Select Printer',
      name: 'selectPrinter',
      desc: '',
      args: [],
    );
  }

  /// `Bluetooth has not been enabled`
  String get bleHasNotBeenEnabled {
    return Intl.message(
      'Bluetooth has not been enabled',
      name: 'bleHasNotBeenEnabled',
      desc: '',
      args: [],
    );
  }

  /// `Attribute already exists`
  String get attributeAlreadyExists {
    return Intl.message(
      'Attribute already exists',
      name: 'attributeAlreadyExists',
      desc: '',
      args: [],
    );
  }

  /// `Delete all`
  String get deleteAll {
    return Intl.message(
      'Delete all',
      name: 'deleteAll',
      desc: '',
      args: [],
    );
  }

  /// `Create all variants`
  String get createVariants {
    return Intl.message(
      'Create all variants',
      name: 'createVariants',
      desc: '',
      args: [],
    );
  }

  /// `Any {attribute}`
  String anyAttr(Object attribute) {
    return Intl.message(
      'Any $attribute',
      name: 'anyAttr',
      desc: '',
      args: [attribute],
    );
  }

  /// `New variation`
  String get newVariation {
    return Intl.message(
      'New variation',
      name: 'newVariation',
      desc: '',
      args: [],
    );
  }

  /// `Your product is under review`
  String get yourProductIsUnderReview {
    return Intl.message(
      'Your product is under review',
      name: 'yourProductIsUnderReview',
      desc: '',
      args: [],
    );
  }

  /// `Order Confirmation`
  String get orderConfirmation {
    return Intl.message(
      'Order Confirmation',
      name: 'orderConfirmation',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure to create the order?`
  String get orderConfirmationMsg {
    return Intl.message(
      'Are you sure to create the order?',
      name: 'orderConfirmationMsg',
      desc: '',
      args: [],
    );
  }

  /// `This product is not support`
  String get thisProductNotSupport {
    return Intl.message(
      'This product is not support',
      name: 'thisProductNotSupport',
      desc: '',
      args: [],
    );
  }

  /// `Please select at least 1 option for each active attribute`
  String get pleaseSelectAttr {
    return Intl.message(
      'Please select at least 1 option for each active attribute',
      name: 'pleaseSelectAttr',
      desc: '',
      args: [],
    );
  }

  /// `Your application is under review.`
  String get yourApplicationIsUnderReview {
    return Intl.message(
      'Your application is under review.',
      name: 'yourApplicationIsUnderReview',
      desc: '',
      args: [],
    );
  }

  /// `Chinese (simplified)`
  String get chineseSimplified {
    return Intl.message(
      'Chinese (simplified)',
      name: 'chineseSimplified',
      desc: '',
      args: [],
    );
  }

  /// `Chinese (traditional)`
  String get chineseTraditional {
    return Intl.message(
      'Chinese (traditional)',
      name: 'chineseTraditional',
      desc: '',
      args: [],
    );
  }

  /// `Receiver`
  String get receiver {
    return Intl.message(
      'Receiver',
      name: 'receiver',
      desc: '',
      args: [],
    );
  }

  /// `Burmese`
  String get burmese {
    return Intl.message(
      'Burmese',
      name: 'burmese',
      desc: '',
      args: [],
    );
  }

  /// `Albanian`
  String get albanian {
    return Intl.message(
      'Albanian',
      name: 'albanian',
      desc: '',
      args: [],
    );
  }

  /// `Product type variable needs at least one variant`
  String get productNeedAtLeastOneVariation {
    return Intl.message(
      'Product type variable needs at least one variant',
      name: 'productNeedAtLeastOneVariation',
      desc: '',
      args: [],
    );
  }

  /// `Product type simple needs the name and regular price`
  String get productNeedNameAndPrice {
    return Intl.message(
      'Product type simple needs the name and regular price',
      name: 'productNeedNameAndPrice',
      desc: '',
      args: [],
    );
  }

  /// `Sort by`
  String get sortBy {
    return Intl.message(
      'Sort by',
      name: 'sortBy',
      desc: '',
      args: [],
    );
  }

  /// `Date: Latest`
  String get dateLatest {
    return Intl.message(
      'Date: Latest',
      name: 'dateLatest',
      desc: '',
      args: [],
    );
  }

  /// `Date: Oldest`
  String get dateOldest {
    return Intl.message(
      'Date: Oldest',
      name: 'dateOldest',
      desc: '',
      args: [],
    );
  }

  /// `Price: Low to High`
  String get priceLowToHigh {
    return Intl.message(
      'Price: Low to High',
      name: 'priceLowToHigh',
      desc: '',
      args: [],
    );
  }

  /// `Price: High to Low`
  String get priceHighToLow {
    return Intl.message(
      'Price: High to Low',
      name: 'priceHighToLow',
      desc: '',
      args: [],
    );
  }

  /// `Loading link...`
  String get loadingLink {
    return Intl.message(
      'Loading link...',
      name: 'loadingLink',
      desc: '',
      args: [],
    );
  }

  /// `Can not load this link`
  String get canNotLoadThisLink {
    return Intl.message(
      'Can not load this link',
      name: 'canNotLoadThisLink',
      desc: '',
      args: [],
    );
  }

  /// `Image Network`
  String get imageNetwork {
    return Intl.message(
      'Image Network',
      name: 'imageNetwork',
      desc: '',
      args: [],
    );
  }

  /// `Paste your image url`
  String get pasteYourImageUrl {
    return Intl.message(
      'Paste your image url',
      name: 'pasteYourImageUrl',
      desc: '',
      args: [],
    );
  }

  /// `Use this Image`
  String get useThisImage {
    return Intl.message(
      'Use this Image',
      name: 'useThisImage',
      desc: '',
      args: [],
    );
  }

  /// `Failed to load image`
  String get failedToLoadImage {
    return Intl.message(
      'Failed to load image',
      name: 'failedToLoadImage',
      desc: '',
      args: [],
    );
  }

  /// `Select Governorate`
  String get select_governorate {
    return Intl.message(
      'Select Governorate',
      name: 'select_governorate',
      desc: '',
      args: [],
    );
  }

  /// `Enter your work field`
  String get enter_your_work_field {
    return Intl.message(
      'Enter your work field',
      name: 'enter_your_work_field',
      desc: '',
      args: [],
    );
  }

  /// `Work Field`
  String get work_field {
    return Intl.message(
      'Work Field',
      name: 'work_field',
      desc: '',
      args: [],
    );
  }

  /// `Company Name`
  String get companyName {
    return Intl.message(
      'Company Name',
      name: 'companyName',
      desc: '',
      args: [],
    );
  }

  /// `Enter your Company Name`
  String get enterYourCompanyName {
    return Intl.message(
      'Enter your Company Name',
      name: 'enterYourCompanyName',
      desc: '',
      args: [],
    );
  }

  /// `My Location`
  String get myLocation {
    return Intl.message(
      'My Location',
      name: 'myLocation',
      desc: '',
      args: [],
    );
  }

  /// `Select Country`
  String get selectCountry {
    return Intl.message(
      'Select Country',
      name: 'selectCountry',
      desc: '',
      args: [],
    );
  }

  /// `Select Zone`
  String get selectZone {
    return Intl.message(
      'Select Zone',
      name: 'selectZone',
      desc: '',
      args: [],
    );
  }

  /// `Pick your location`
  String get ickYourLocation {
    return Intl.message(
      'Pick your location',
      name: 'ickYourLocation',
      desc: '',
      args: [],
    );
  }

  /// `Your request has been successfully submitted; and you will receive a notification from us accepting your request.`
  String get traderWaitingMessage {
    return Intl.message(
      'Your request has been successfully submitted; and you will receive a notification from us accepting your request.',
      name: 'traderWaitingMessage',
      desc: '',
      args: [],
    );
  }

  /// `An email with a password has been sent to your email address.`
  String get resetPasswordMessage {
    return Intl.message(
      'An email with a password has been sent to your email address.',
      name: 'resetPasswordMessage',
      desc: '',
      args: [],
    );
  }

  /// `Shipping Note`
  String get shippingNote {
    return Intl.message(
      'Shipping Note',
      name: 'shippingNote',
      desc: '',
      args: [],
    );
  }

  /// ` is required`
  String get isRequired {
    return Intl.message(
      ' is required',
      name: 'isRequired',
      desc: '',
      args: [],
    );
  }

  /// `My Orders`
  String get myOrders {
    return Intl.message(
      'My Orders',
      name: 'myOrders',
      desc: '',
      args: [],
    );
  }

  /// `Please select your city`
  String get pleaseSelectYourCity {
    return Intl.message(
      'Please select your city',
      name: 'pleaseSelectYourCity',
      desc: '',
      args: [],
    );
  }

  /// `select your city`
  String get selectYourCity {
    return Intl.message(
      'select your city',
      name: 'selectYourCity',
      desc: '',
      args: [],
    );
  }

  /// `Please select your country`
  String get pleaseSelectYourCountry {
    return Intl.message(
      'Please select your country',
      name: 'pleaseSelectYourCountry',
      desc: '',
      args: [],
    );
  }

  /// `select your country`
  String get selectYourCountry {
    return Intl.message(
      'select your country',
      name: 'selectYourCountry',
      desc: '',
      args: [],
    );
  }

  /// `Logout confirmation`
  String get confirmLogout {
    return Intl.message(
      'Logout confirmation',
      name: 'confirmLogout',
      desc: '',
      args: [],
    );
  }

  /// `Which language do you prefer?`
  String get changeLanguageDescription {
    return Intl.message(
      'Which language do you prefer?',
      name: 'changeLanguageDescription',
      desc: '',
      args: [],
    );
  }

  /// `Ordered successfully`
  String get orderedSuccessfully {
    return Intl.message(
      'Ordered successfully',
      name: 'orderedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Submit a complaint`
  String get submitComplaint {
    return Intl.message(
      'Submit a complaint',
      name: 'submitComplaint',
      desc: '',
      args: [],
    );
  }

  /// `your complaint sent successfully`
  String get yourComplaintSentSuccessfully {
    return Intl.message(
      'your complaint sent successfully',
      name: 'yourComplaintSentSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Ready For Shipping`
  String get readyForShipping {
    return Intl.message(
      'Ready For Shipping',
      name: 'readyForShipping',
      desc: '',
      args: [],
    );
  }

  /// `Delete account`
  String get deleteAccount {
    return Intl.message(
      'Delete account',
      name: 'deleteAccount',
      desc: '',
      args: [],
    );
  }

  /// `Your account will be permanently deleted`
  String get confirmDeleteMsg {
    return Intl.message(
      'Your account will be permanently deleted',
      name: 'confirmDeleteMsg',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your phone number and password`
  String get plzEnterPhonePass {
    return Intl.message(
      'Please enter your phone number and password',
      name: 'plzEnterPhonePass',
      desc: '',
      args: [],
    );
  }

  /// `Loyalty Program`
  String get loyaltyProgram {
    return Intl.message(
      'Loyalty Program',
      name: 'loyaltyProgram',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your phone number to change your password`
  String get plzEnterPhoneToChangePass {
    return Intl.message(
      'Please enter your phone number to change your password',
      name: 'plzEnterPhoneToChangePass',
      desc: '',
      args: [],
    );
  }

  /// `You will receive an OTP to change your password on this number`
  String get otpMessage {
    return Intl.message(
      'You will receive an OTP to change your password on this number',
      name: 'otpMessage',
      desc: '',
      args: [],
    );
  }

  /// `Password reset successfully`
  String get passwordResetSuccessfully {
    return Intl.message(
      'Password reset successfully',
      name: 'passwordResetSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `My Total Gifts`
  String get myTotalGifts {
    return Intl.message(
      'My Total Gifts',
      name: 'myTotalGifts',
      desc: '',
      args: [],
    );
  }

  /// `My Total Stamps`
  String get myTotalStamps {
    return Intl.message(
      'My Total Stamps',
      name: 'myTotalStamps',
      desc: '',
      args: [],
    );
  }

  /// `Statistics`
  String get statistics {
    return Intl.message(
      'Statistics',
      name: 'statistics',
      desc: '',
      args: [],
    );
  }

  /// `Report Issue`
  String get reportIssue {
    return Intl.message(
      'Report Issue',
      name: 'reportIssue',
      desc: '',
      args: [],
    );
  }

  /// `Employee Phone Number`
  String get employeePhoneNumber {
    return Intl.message(
      'Employee Phone Number',
      name: 'employeePhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Employee Name`
  String get employeeName {
    return Intl.message(
      'Employee Name',
      name: 'employeeName',
      desc: '',
      args: [],
    );
  }

  /// `Users`
  String get users {
    return Intl.message(
      'Users',
      name: 'users',
      desc: '',
      args: [],
    );
  }

  /// `Stamps`
  String get stamps {
    return Intl.message(
      'Stamps',
      name: 'stamps',
      desc: '',
      args: [],
    );
  }

  /// `Gifts`
  String get gifts {
    return Intl.message(
      'Gifts',
      name: 'gifts',
      desc: '',
      args: [],
    );
  }

  /// `Please enter phone number, to filter by`
  String get filterByPhone {
    return Intl.message(
      'Please enter phone number, to filter by',
      name: 'filterByPhone',
      desc: '',
      args: [],
    );
  }

  /// `Scan Form`
  String get scanForm {
    return Intl.message(
      'Scan Form',
      name: 'scanForm',
      desc: '',
      args: [],
    );
  }

  /// `Scanned Code Data`
  String get scannedCodeData {
    return Intl.message(
      'Scanned Code Data',
      name: 'scannedCodeData',
      desc: '',
      args: [],
    );
  }

  /// `Stamp Name`
  String get stampName {
    return Intl.message(
      'Stamp Name',
      name: 'stampName',
      desc: '',
      args: [],
    );
  }

  /// `Customer Name`
  String get customerName {
    return Intl.message(
      'Customer Name',
      name: 'customerName',
      desc: '',
      args: [],
    );
  }

  /// `Add the reference`
  String get addTheReference {
    return Intl.message(
      'Add the reference',
      name: 'addTheReference',
      desc: '',
      args: [],
    );
  }

  /// `Invoice Number`
  String get invoiceNumber {
    return Intl.message(
      'Invoice Number',
      name: 'invoiceNumber',
      desc: '',
      args: [],
    );
  }

  /// `Upload Image`
  String get uploadImage {
    return Intl.message(
      'Upload Image',
      name: 'uploadImage',
      desc: '',
      args: [],
    );
  }

  /// `Old Password`
  String get oldPass {
    return Intl.message(
      'Old Password',
      name: 'oldPass',
      desc: '',
      args: [],
    );
  }

  /// `Selected`
  String get selected {
    return Intl.message(
      'Selected',
      name: 'selected',
      desc: '',
      args: [],
    );
  }

  /// `Scan Code`
  String get scanCode {
    return Intl.message(
      'Scan Code',
      name: 'scanCode',
      desc: '',
      args: [],
    );
  }

  /// `Change Password`
  String get changePassword {
    return Intl.message(
      'Change Password',
      name: 'changePassword',
      desc: '',
      args: [],
    );
  }

  /// `Number of Stamps`
  String get numOfStamps {
    return Intl.message(
      'Number of Stamps',
      name: 'numOfStamps',
      desc: '',
      args: [],
    );
  }

  /// `The scanned code is taken from the card`
  String get scanCodeTakenFrom {
    return Intl.message(
      'The scanned code is taken from the card',
      name: 'scanCodeTakenFrom',
      desc: '',
      args: [],
    );
  }

  /// `Phone Number Verification`
  String get phoneNumberVerification {
    return Intl.message(
      'Phone Number Verification',
      name: 'phoneNumberVerification',
      desc: '',
      args: [],
    );
  }

  /// `Enter the code sent to`
  String get enterSendedCode {
    return Intl.message(
      'Enter the code sent to',
      name: 'enterSendedCode',
      desc: '',
      args: [],
    );
  }

  /// `New Password`
  String get newPassword {
    return Intl.message(
      'New Password',
      name: 'newPassword',
      desc: '',
      args: [],
    );
  }

  /// `Reset Password`
  String get resetPassword {
    return Intl.message(
      'Reset Password',
      name: 'resetPassword',
      desc: '',
      args: [],
    );
  }

  /// `Reset Your Password`
  String get resetYourPassword {
    return Intl.message(
      'Reset Your Password',
      name: 'resetYourPassword',
      desc: '',
      args: [],
    );
  }

  /// `You didn't add any brands to your favorites yet.`
  String get emptyFav {
    return Intl.message(
      'You didn\'t add any brands to your favorites yet.',
      name: 'emptyFav',
      desc: '',
      args: [],
    );
  }

  /// `Full Name`
  String get fullName {
    return Intl.message(
      'Full Name',
      name: 'fullName',
      desc: '',
      args: [],
    );
  }

  /// `Name Is Required`
  String get nameIsRequired {
    return Intl.message(
      'Name Is Required',
      name: 'nameIsRequired',
      desc: '',
      args: [],
    );
  }

  /// `No Result`
  String get noResult {
    return Intl.message(
      'No Result',
      name: 'noResult',
      desc: '',
      args: [],
    );
  }

  /// `All Categories`
  String get allCategories {
    return Intl.message(
      'All Categories',
      name: 'allCategories',
      desc: '',
      args: [],
    );
  }

  /// `View Code`
  String get viewCode {
    return Intl.message(
      'View Code',
      name: 'viewCode',
      desc: '',
      args: [],
    );
  }

  /// `Valid Till`
  String get validTill {
    return Intl.message(
      'Valid Till',
      name: 'validTill',
      desc: '',
      args: [],
    );
  }

  /// `Coupon Code`
  String get couponCode {
    return Intl.message(
      'Coupon Code',
      name: 'couponCode',
      desc: '',
      args: [],
    );
  }

  /// `Remaining Time`
  String get remainingTime {
    return Intl.message(
      'Remaining Time',
      name: 'remainingTime',
      desc: '',
      args: [],
    );
  }

  /// `The code was expired`
  String get codeIsExpired {
    return Intl.message(
      'The code was expired',
      name: 'codeIsExpired',
      desc: '',
      args: [],
    );
  }

  /// `Place Of Study`
  String get placeOfStudy {
    return Intl.message(
      'Place Of Study',
      name: 'placeOfStudy',
      desc: '',
      args: [],
    );
  }

  /// `place of study is required`
  String get placeOfStudyReq {
    return Intl.message(
      'place of study is required',
      name: 'placeOfStudyReq',
      desc: '',
      args: [],
    );
  }

  /// `Continue as guest`
  String get continueGuest {
    return Intl.message(
      'Continue as guest',
      name: 'continueGuest',
      desc: '',
      args: [],
    );
  }

  /// `This field is required`
  String get fieldRequired {
    return Intl.message(
      'This field is required',
      name: 'fieldRequired',
      desc: '',
      args: [],
    );
  }

  /// `Created at`
  String get createdAt {
    return Intl.message(
      'Created at',
      name: 'createdAt',
      desc: '',
      args: [],
    );
  }

  /// `Owner`
  String get owner {
    return Intl.message(
      'Owner',
      name: 'owner',
      desc: '',
      args: [],
    );
  }

  /// `Facilities`
  String get facilities {
    return Intl.message(
      'Facilities',
      name: 'facilities',
      desc: '',
      args: [],
    );
  }

  /// `View all`
  String get viewAll {
    return Intl.message(
      'View all',
      name: 'viewAll',
      desc: '',
      args: [],
    );
  }

  /// `Location`
  String get location {
    return Intl.message(
      'Location',
      name: 'location',
      desc: '',
      args: [],
    );
  }

  /// `Explore`
  String get explore {
    return Intl.message(
      'Explore',
      name: 'explore',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get profile {
    return Intl.message(
      'Profile',
      name: 'profile',
      desc: '',
      args: [],
    );
  }

  /// `Add Post`
  String get addPost {
    return Intl.message(
      'Add Post',
      name: 'addPost',
      desc: '',
      args: [],
    );
  }

  /// `Guest User`
  String get guestUser {
    return Intl.message(
      'Guest User',
      name: 'guestUser',
      desc: '',
      args: [],
    );
  }

  /// `We can’t find a match for what you’re looking for.`
  String get weCantFindAMatchForWhatYoureLookingFor {
    return Intl.message(
      'We can’t find a match for what you’re looking for.',
      name: 'weCantFindAMatchForWhatYoureLookingFor',
      desc: '',
      args: [],
    );
  }

  /// `Filter`
  String get filter {
    return Intl.message(
      'Filter',
      name: 'filter',
      desc: '',
      args: [],
    );
  }

  /// `Sort`
  String get sort {
    return Intl.message(
      'Sort',
      name: 'sort',
      desc: '',
      args: [],
    );
  }

  /// `Categories`
  String get categories {
    return Intl.message(
      'Categories',
      name: 'categories',
      desc: '',
      args: [],
    );
  }

  /// `Type of property`
  String get typeOfProperty {
    return Intl.message(
      'Type of property',
      name: 'typeOfProperty',
      desc: '',
      args: [],
    );
  }

  /// `Price Range`
  String get priceRange {
    return Intl.message(
      'Price Range',
      name: 'priceRange',
      desc: '',
      args: [],
    );
  }

  /// `City`
  String get city {
    return Intl.message(
      'City',
      name: 'city',
      desc: '',
      args: [],
    );
  }

  /// `Area`
  String get area {
    return Intl.message(
      'Area',
      name: 'area',
      desc: '',
      args: [],
    );
  }

  /// `Apply Filters`
  String get applyFilters {
    return Intl.message(
      'Apply Filters',
      name: 'applyFilters',
      desc: '',
      args: [],
    );
  }

  /// `Clear Filters`
  String get clearFilters {
    return Intl.message(
      'Clear Filters',
      name: 'clearFilters',
      desc: '',
      args: [],
    );
  }

  /// `Gallery`
  String get gallery {
    return Intl.message(
      'Gallery',
      name: 'gallery',
      desc: '',
      args: [],
    );
  }

  /// `Property Info`
  String get propertyInfo {
    return Intl.message(
      'Property Info',
      name: 'propertyInfo',
      desc: '',
      args: [],
    );
  }

  /// `Featured`
  String get featured {
    return Intl.message(
      'Featured',
      name: 'featured',
      desc: '',
      args: [],
    );
  }

  /// `Notifications`
  String get notifications {
    return Intl.message(
      'Notifications',
      name: 'notifications',
      desc: '',
      args: [],
    );
  }

  /// `Back`
  String get back {
    return Intl.message(
      'Back',
      name: 'back',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to stop adding?`
  String get areYouSureYouWantToStopAdding {
    return Intl.message(
      'Are you sure you want to stop adding?',
      name: 'areYouSureYouWantToStopAdding',
      desc: '',
      args: [],
    );
  }

  /// `You will lose all the progress`
  String get youWillLoseAllTheProgress {
    return Intl.message(
      'You will lose all the progress',
      name: 'youWillLoseAllTheProgress',
      desc: '',
      args: [],
    );
  }

  /// `Continue Adding`
  String get continueAdding {
    return Intl.message(
      'Continue Adding',
      name: 'continueAdding',
      desc: '',
      args: [],
    );
  }

  /// `What kind of the property you have?`
  String get whatKindOfThePropertyYouHave {
    return Intl.message(
      'What kind of the property you have?',
      name: 'whatKindOfThePropertyYouHave',
      desc: '',
      args: [],
    );
  }

  /// `What are your property specifications?`
  String get whatAreYourPropertySpecifications {
    return Intl.message(
      'What are your property specifications?',
      name: 'whatAreYourPropertySpecifications',
      desc: '',
      args: [],
    );
  }

  /// `What are your property main features?`
  String get whatAreYourPropertyMainFeatures {
    return Intl.message(
      'What are your property main features?',
      name: 'whatAreYourPropertyMainFeatures',
      desc: '',
      args: [],
    );
  }

  /// `What is the city of your property?`
  String get whatIsTheCityOfYourProperty {
    return Intl.message(
      'What is the city of your property?',
      name: 'whatIsTheCityOfYourProperty',
      desc: '',
      args: [],
    );
  }

  /// `Add the location of your property`
  String get addTheLocationOfYourProperty {
    return Intl.message(
      'Add the location of your property',
      name: 'addTheLocationOfYourProperty',
      desc: '',
      args: [],
    );
  }

  /// `Property address`
  String get propertyAddress {
    return Intl.message(
      'Property address',
      name: 'propertyAddress',
      desc: '',
      args: [],
    );
  }

  /// `Add photos of your property`
  String get addPhotosOfYourProperty {
    return Intl.message(
      'Add photos of your property',
      name: 'addPhotosOfYourProperty',
      desc: '',
      args: [],
    );
  }

  /// `Main Image`
  String get mainImage {
    return Intl.message(
      'Main Image',
      name: 'mainImage',
      desc: '',
      args: [],
    );
  }

  /// `Main Video`
  String get mainVideo {
    return Intl.message(
      'Main Video',
      name: 'mainVideo',
      desc: '',
      args: [],
    );
  }

  /// `Add Image`
  String get addImage {
    return Intl.message(
      'Add Image',
      name: 'addImage',
      desc: '',
      args: [],
    );
  }

  /// `Add information about your property`
  String get addInformationAboutYourProperty {
    return Intl.message(
      'Add information about your property',
      name: 'addInformationAboutYourProperty',
      desc: '',
      args: [],
    );
  }

  /// `Advertisement title`
  String get advertisementTitle {
    return Intl.message(
      'Advertisement title',
      name: 'advertisementTitle',
      desc: '',
      args: [],
    );
  }

  /// `Advertisement title (English)`
  String get advertisementTitleEnglish {
    return Intl.message(
      'Advertisement title (English)',
      name: 'advertisementTitleEnglish',
      desc: '',
      args: [],
    );
  }

  /// `Advertisement description`
  String get advertisementDescription {
    return Intl.message(
      'Advertisement description',
      name: 'advertisementDescription',
      desc: '',
      args: [],
    );
  }

  /// `Advertisement description (English)`
  String get advertisementDescriptionEnglish {
    return Intl.message(
      'Advertisement description (English)',
      name: 'advertisementDescriptionEnglish',
      desc: '',
      args: [],
    );
  }

  /// `Price`
  String get price {
    return Intl.message(
      'Price',
      name: 'price',
      desc: '',
      args: [],
    );
  }

  /// `Is mortgaged`
  String get isMortgaged {
    return Intl.message(
      'Is mortgaged',
      name: 'isMortgaged',
      desc: '',
      args: [],
    );
  }

  /// `Are you owner of the property`
  String get areYouOwnerOfTheProperty {
    return Intl.message(
      'Are you owner of the property',
      name: 'areYouOwnerOfTheProperty',
      desc: '',
      args: [],
    );
  }

  /// `My Properties`
  String get myProperties {
    return Intl.message(
      'My Properties',
      name: 'myProperties',
      desc: '',
      args: [],
    );
  }

  /// `Subscription`
  String get subscription {
    return Intl.message(
      'Subscription',
      name: 'subscription',
      desc: '',
      args: [],
    );
  }

  /// `Country & language`
  String get countryLanguage {
    return Intl.message(
      'Country & language',
      name: 'countryLanguage',
      desc: '',
      args: [],
    );
  }

  /// `Dark Theme`
  String get darkTheme {
    return Intl.message(
      'Dark Theme',
      name: 'darkTheme',
      desc: '',
      args: [],
    );
  }

  /// `Become a partner`
  String get becomeAPartner {
    return Intl.message(
      'Become a partner',
      name: 'becomeAPartner',
      desc: '',
      args: [],
    );
  }

  /// `Invite a friend`
  String get inviteAFriend {
    return Intl.message(
      'Invite a friend',
      name: 'inviteAFriend',
      desc: '',
      args: [],
    );
  }

  /// `Contacts us`
  String get contactsUs {
    return Intl.message(
      'Contacts us',
      name: 'contactsUs',
      desc: '',
      args: [],
    );
  }

  /// `FAQ`
  String get faq {
    return Intl.message(
      'FAQ',
      name: 'faq',
      desc: '',
      args: [],
    );
  }

  /// `Terms of use`
  String get termsOfUse {
    return Intl.message(
      'Terms of use',
      name: 'termsOfUse',
      desc: '',
      args: [],
    );
  }

  /// `Privacy Policy`
  String get privacyPolicy {
    return Intl.message(
      'Privacy Policy',
      name: 'privacyPolicy',
      desc: '',
      args: [],
    );
  }

  /// `About Us`
  String get aboutUs {
    return Intl.message(
      'About Us',
      name: 'aboutUs',
      desc: '',
      args: [],
    );
  }

  /// `Sign out`
  String get signOut {
    return Intl.message(
      'Sign out',
      name: 'signOut',
      desc: '',
      args: [],
    );
  }

  /// `You don't have any properties\nPress + button to create new one`
  String get youDontHaveAnyPropertiesnpressButtonToCreateNewOne {
    return Intl.message(
      'You don\'t have any properties\nPress + button to create new one',
      name: 'youDontHaveAnyPropertiesnpressButtonToCreateNewOne',
      desc: '',
      args: [],
    );
  }

  /// `Properties`
  String get properties {
    return Intl.message(
      'Properties',
      name: 'properties',
      desc: '',
      args: [],
    );
  }

  /// `Property Management`
  String get propertyManagement {
    return Intl.message(
      'Property Management',
      name: 'propertyManagement',
      desc: '',
      args: [],
    );
  }

  /// `Edit property details`
  String get editPropertyDetails {
    return Intl.message(
      'Edit property details',
      name: 'editPropertyDetails',
      desc: '',
      args: [],
    );
  }

  /// `View property details`
  String get viewPropertyDetails {
    return Intl.message(
      'View property details',
      name: 'viewPropertyDetails',
      desc: '',
      args: [],
    );
  }

  /// `Delete property`
  String get deleteProperty {
    return Intl.message(
      'Delete property',
      name: 'deleteProperty',
      desc: '',
      args: [],
    );
  }

  /// `Company / store name`
  String get companyStoreName {
    return Intl.message(
      'Company / store name',
      name: 'companyStoreName',
      desc: '',
      args: [],
    );
  }

  /// `Update Property`
  String get updateProperty {
    return Intl.message(
      'Update Property',
      name: 'updateProperty',
      desc: '',
      args: [],
    );
  }

  /// `Property Category`
  String get propertyCategory {
    return Intl.message(
      'Property Category',
      name: 'propertyCategory',
      desc: '',
      args: [],
    );
  }

  /// `Property Information`
  String get propertyInformation {
    return Intl.message(
      'Property Information',
      name: 'propertyInformation',
      desc: '',
      args: [],
    );
  }

  /// `Property Features`
  String get propertyFeatures {
    return Intl.message(
      'Property Features',
      name: 'propertyFeatures',
      desc: '',
      args: [],
    );
  }

  /// `Property City`
  String get propertyCity {
    return Intl.message(
      'Property City',
      name: 'propertyCity',
      desc: '',
      args: [],
    );
  }

  /// `Property Area`
  String get propertyArea {
    return Intl.message(
      'Property Area',
      name: 'propertyArea',
      desc: '',
      args: [],
    );
  }

  /// `Media & Images`
  String get mediaImages {
    return Intl.message(
      'Media & Images',
      name: 'mediaImages',
      desc: '',
      args: [],
    );
  }

  /// `General Information`
  String get generalInformation {
    return Intl.message(
      'General Information',
      name: 'generalInformation',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to go back?`
  String get areYouSureYouWantToGoBack {
    return Intl.message(
      'Are you sure you want to go back?',
      name: 'areYouSureYouWantToGoBack',
      desc: '',
      args: [],
    );
  }

  /// `Continue Editing`
  String get continueEditing {
    return Intl.message(
      'Continue Editing',
      name: 'continueEditing',
      desc: '',
      args: [],
    );
  }

  /// `What is the area of your property?`
  String get whatIsTheAreaOfYourProperty {
    return Intl.message(
      'What is the area of your property?',
      name: 'whatIsTheAreaOfYourProperty',
      desc: '',
      args: [],
    );
  }

  /// `Done`
  String get done {
    return Intl.message(
      'Done',
      name: 'done',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to delete this image?`
  String get areYouSureYouWantToDeleteThisImage {
    return Intl.message(
      'Are you sure you want to delete this image?',
      name: 'areYouSureYouWantToDeleteThisImage',
      desc: '',
      args: [],
    );
  }

  /// `Delete`
  String get delete {
    return Intl.message(
      'Delete',
      name: 'delete',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Congratulations!`
  String get congratulations {
    return Intl.message(
      'Congratulations!',
      name: 'congratulations',
      desc: '',
      args: [],
    );
  }

  /// `Oops, Failed!`
  String get oopsFailed {
    return Intl.message(
      'Oops, Failed!',
      name: 'oopsFailed',
      desc: '',
      args: [],
    );
  }

  /// `Your property advertise will activate as soon as possible, you can check the status on the Setting -> My properties`
  String get yourPropertyAdvertiseWillActivateAsSoonAsPossible {
    return Intl.message(
      'Your property advertise will activate as soon as possible, you can check the status on the Setting -> My properties',
      name: 'yourPropertyAdvertiseWillActivateAsSoonAsPossible',
      desc: '',
      args: [],
    );
  }

  /// `The process failed. Please check your internet connection then try again.`
  String get theProcessFailedPlease {
    return Intl.message(
      'The process failed. Please check your internet connection then try again.',
      name: 'theProcessFailedPlease',
      desc: '',
      args: [],
    );
  }

  /// `Message`
  String get message {
    return Intl.message(
      'Message',
      name: 'message',
      desc: '',
      args: [],
    );
  }

  /// `Company / User name`
  String get companyUserName {
    return Intl.message(
      'Company / User name',
      name: 'companyUserName',
      desc: '',
      args: [],
    );
  }

  /// `Add a screenshot / file`
  String get addAScreenshotFile {
    return Intl.message(
      'Add a screenshot / file',
      name: 'addAScreenshotFile',
      desc: '',
      args: [],
    );
  }

  /// `Describe your issue or detail your question`
  String get describeYourIssueOrDetailYourQuestion {
    return Intl.message(
      'Describe your issue or detail your question',
      name: 'describeYourIssueOrDetailYourQuestion',
      desc: '',
      args: [],
    );
  }

  /// `Follow Us`
  String get followUs {
    return Intl.message(
      'Follow Us',
      name: 'followUs',
      desc: '',
      args: [],
    );
  }

  /// `My account`
  String get myAccount {
    return Intl.message(
      'My account',
      name: 'myAccount',
      desc: '',
      args: [],
    );
  }

  /// `Address`
  String get address {
    return Intl.message(
      'Address',
      name: 'address',
      desc: '',
      args: [],
    );
  }

  /// `Gender`
  String get gender {
    return Intl.message(
      'Gender',
      name: 'gender',
      desc: '',
      args: [],
    );
  }

  /// `Birth date`
  String get birthDate {
    return Intl.message(
      'Birth date',
      name: 'birthDate',
      desc: '',
      args: [],
    );
  }

  /// `Update`
  String get update {
    return Intl.message(
      'Update',
      name: 'update',
      desc: '',
      args: [],
    );
  }

  /// `Or`
  String get or {
    return Intl.message(
      'Or',
      name: 'or',
      desc: '',
      args: [],
    );
  }

  /// `Get Started`
  String get getStarted {
    return Intl.message(
      'Get Started',
      name: 'getStarted',
      desc: '',
      args: [],
    );
  }

  /// `Mortgaged`
  String get mortgaged {
    return Intl.message(
      'Mortgaged',
      name: 'mortgaged',
      desc: '',
      args: [],
    );
  }

  /// `Not Mortgaged`
  String get notMortgaged {
    return Intl.message(
      'Not Mortgaged',
      name: 'notMortgaged',
      desc: '',
      args: [],
    );
  }

  /// `Not Owner`
  String get notOwner {
    return Intl.message(
      'Not Owner',
      name: 'notOwner',
      desc: '',
      args: [],
    );
  }

  /// `App Theme`
  String get appTheme {
    return Intl.message(
      'App Theme',
      name: 'appTheme',
      desc: '',
      args: [],
    );
  }

  /// `Login with Facebook`
  String get loginWithFacebook {
    return Intl.message(
      'Login with Facebook',
      name: 'loginWithFacebook',
      desc: '',
      args: [],
    );
  }

  /// `Login with Google`
  String get loginWithGoogle {
    return Intl.message(
      'Login with Google',
      name: 'loginWithGoogle',
      desc: '',
      args: [],
    );
  }

  /// `or continue with`
  String get orContinueWith {
    return Intl.message(
      'or continue with',
      name: 'orContinueWith',
      desc: '',
      args: [],
    );
  }

  /// `Recommended`
  String get recommended {
    return Intl.message(
      'Recommended',
      name: 'recommended',
      desc: '',
      args: [],
    );
  }

  /// `Write here...`
  String get writeHere {
    return Intl.message(
      'Write here...',
      name: 'writeHere',
      desc: '',
      args: [],
    );
  }

  /// `We’re here to help!`
  String get wereHereToHelp {
    return Intl.message(
      'We’re here to help!',
      name: 'wereHereToHelp',
      desc: '',
      args: [],
    );
  }

  /// `What can we help you with? You can quickly find the answer to your question here.`
  String get whatCanWeHelpYouWithYouCanQuicklyFind {
    return Intl.message(
      'What can we help you with? You can quickly find the answer to your question here.',
      name: 'whatCanWeHelpYouWithYouCanQuicklyFind',
      desc: '',
      args: [],
    );
  }

  /// `Optional`
  String get optional {
    return Intl.message(
      'Optional',
      name: 'optional',
      desc: '',
      args: [],
    );
  }

  /// `Required`
  String get required {
    return Intl.message(
      'Required',
      name: 'required',
      desc: '',
      args: [],
    );
  }

  /// `You don't have any properties in the favorite`
  String get youDontHaveAnyPropertiesInTheFavorite {
    return Intl.message(
      'You don\'t have any properties in the favorite',
      name: 'youDontHaveAnyPropertiesInTheFavorite',
      desc: '',
      args: [],
    );
  }

  /// `View way`
  String get viewWay {
    return Intl.message(
      'View way',
      name: 'viewWay',
      desc: '',
      args: [],
    );
  }

  /// `Views`
  String get views {
    return Intl.message(
      'Views',
      name: 'views',
      desc: '',
      args: [],
    );
  }

  /// `What are the nearby places of your property?`
  String get whatAreTheNearbyPlacesOfYourProperty {
    return Intl.message(
      'What are the nearby places of your property?',
      name: 'whatAreTheNearbyPlacesOfYourProperty',
      desc: '',
      args: [],
    );
  }

  /// `Nearby Places`
  String get nearbyPlaces {
    return Intl.message(
      'Nearby Places',
      name: 'nearbyPlaces',
      desc: '',
      args: [],
    );
  }

  /// `Grid`
  String get grid {
    return Intl.message(
      'Grid',
      name: 'grid',
      desc: '',
      args: [],
    );
  }

  /// `List`
  String get list {
    return Intl.message(
      'List',
      name: 'list',
      desc: '',
      args: [],
    );
  }

  /// `Post Date`
  String get postDate {
    return Intl.message(
      'Post Date',
      name: 'postDate',
      desc: '',
      args: [],
    );
  }

  /// `Advertiser`
  String get advertiser {
    return Intl.message(
      'Advertiser',
      name: 'advertiser',
      desc: '',
      args: [],
    );
  }

  /// `Female`
  String get female {
    return Intl.message(
      'Female',
      name: 'female',
      desc: '',
      args: [],
    );
  }

  /// `Male`
  String get male {
    return Intl.message(
      'Male',
      name: 'male',
      desc: '',
      args: [],
    );
  }

  /// `For Rent`
  String get forRent {
    return Intl.message(
      'For Rent',
      name: 'forRent',
      desc: '',
      args: [],
    );
  }

  /// `For Sale`
  String get forSale {
    return Intl.message(
      'For Sale',
      name: 'forSale',
      desc: '',
      args: [],
    );
  }

  /// `Please select a location`
  String get pleaseSelectALocation {
    return Intl.message(
      'Please select a location',
      name: 'pleaseSelectALocation',
      desc: '',
      args: [],
    );
  }

  /// `Tap to select this location`
  String get tapSelectLocation {
    return Intl.message(
      'Tap to select this location',
      name: 'tapSelectLocation',
      desc: '',
      args: [],
    );
  }

  /// `Location was determine`
  String get locationWasDetermine {
    return Intl.message(
      'Location was determine',
      name: 'locationWasDetermine',
      desc: '',
      args: [],
    );
  }

  /// `Pick location`
  String get pickLocation {
    return Intl.message(
      'Pick location',
      name: 'pickLocation',
      desc: '',
      args: [],
    );
  }

  /// `Payment way`
  String get paymentWay {
    return Intl.message(
      'Payment way',
      name: 'paymentWay',
      desc: '',
      args: [],
    );
  }

  /// `Show location on map`
  String get showLocationOnMap {
    return Intl.message(
      'Show location on map',
      name: 'showLocationOnMap',
      desc: '',
      args: [],
    );
  }

  /// `This will help you to reach more views for your post`
  String get thisWillHelpYouToReachMoreViewsForYour {
    return Intl.message(
      'This will help you to reach more views for your post',
      name: 'thisWillHelpYouToReachMoreViewsForYour',
      desc: '',
      args: [],
    );
  }

  /// `Add a reel video`
  String get addAReelVideo {
    return Intl.message(
      'Add a reel video',
      name: 'addAReelVideo',
      desc: '',
      args: [],
    );
  }

  /// `The video is preferably longitudinal`
  String get theVideoIsPreferablyLongitudinal {
    return Intl.message(
      'The video is preferably longitudinal',
      name: 'theVideoIsPreferablyLongitudinal',
      desc: '',
      args: [],
    );
  }

  /// `A 30-second video can be added`
  String get a30secondVideoCanBeAdded {
    return Intl.message(
      'A 30-second video can be added',
      name: 'a30secondVideoCanBeAdded',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to delete this video?`
  String get areYouSureYouWantToDeleteThisVideo {
    return Intl.message(
      'Are you sure you want to delete this video?',
      name: 'areYouSureYouWantToDeleteThisVideo',
      desc: '',
      args: [],
    );
  }

  /// `Cover image`
  String get coverImage {
    return Intl.message(
      'Cover image',
      name: 'coverImage',
      desc: '',
      args: [],
    );
  }

  /// `Contact`
  String get contact {
    return Intl.message(
      'Contact',
      name: 'contact',
      desc: '',
      args: [],
    );
  }

  /// `Share`
  String get share {
    return Intl.message(
      'Share',
      name: 'share',
      desc: '',
      args: [],
    );
  }

  /// `Directions`
  String get directions {
    return Intl.message(
      'Directions',
      name: 'directions',
      desc: '',
      args: [],
    );
  }

  /// `Contact Info`
  String get contactInfo {
    return Intl.message(
      'Contact Info',
      name: 'contactInfo',
      desc: '',
      args: [],
    );
  }

  /// `Login with Email`
  String get loginWithEmail {
    return Intl.message(
      'Login with Email',
      name: 'loginWithEmail',
      desc: '',
      args: [],
    );
  }

  /// `Log into your account`
  String get logIntoYourAccount {
    return Intl.message(
      'Log into your account',
      name: 'logIntoYourAccount',
      desc: '',
      args: [],
    );
  }

  /// `Most viewed`
  String get mostViewed {
    return Intl.message(
      'Most viewed',
      name: 'mostViewed',
      desc: '',
      args: [],
    );
  }

  /// `Properties for rent`
  String get propertiesForRent {
    return Intl.message(
      'Properties for rent',
      name: 'propertiesForRent',
      desc: '',
      args: [],
    );
  }

  /// `Properties for sell`
  String get propertiesForSell {
    return Intl.message(
      'Properties for sell',
      name: 'propertiesForSell',
      desc: '',
      args: [],
    );
  }

  /// `Not Found`
  String get notFound {
    return Intl.message(
      'Not Found',
      name: 'notFound',
      desc: '',
      args: [],
    );
  }

  /// `Sorry, the keyword you entered cannot be found, please check again or search with another keyword.`
  String get sorryTheKeywordYouEnteredCannotBeFoundPleaseCheck {
    return Intl.message(
      'Sorry, the keyword you entered cannot be found, please check again or search with another keyword.',
      name: 'sorryTheKeywordYouEnteredCannotBeFoundPleaseCheck',
      desc: '',
      args: [],
    );
  }

  /// `Sign-in now to get access to all features`
  String get signinNowToGetAccessToAllFeatures {
    return Intl.message(
      'Sign-in now to get access to all features',
      name: 'signinNowToGetAccessToAllFeatures',
      desc: '',
      args: [],
    );
  }

  /// `My Courses`
  String get myCourses {
    return Intl.message(
      'My Courses',
      name: 'myCourses',
      desc: '',
      args: [],
    );
  }

  /// `Get more`
  String get getMore {
    return Intl.message(
      'Get more',
      name: 'getMore',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
