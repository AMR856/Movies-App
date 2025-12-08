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
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
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
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Login`
  String get login {
    return Intl.message('Login', name: 'login', desc: '', args: []);
  }

  /// `Email`
  String get email {
    return Intl.message('Email', name: 'email', desc: '', args: []);
  }

  /// `Password`
  String get password {
    return Intl.message('Password', name: 'password', desc: '', args: []);
  }

  /// `Forget Password`
  String get forget_password {
    return Intl.message(
      'Forget Password',
      name: 'forget_password',
      desc: '',
      args: [],
    );
  }

  /// `Don’t Have Account?`
  String get don_have_account {
    return Intl.message(
      'Don’t Have Account?',
      name: 'don_have_account',
      desc: '',
      args: [],
    );
  }

  /// `Create One`
  String get create_one {
    return Intl.message('Create One', name: 'create_one', desc: '', args: []);
  }

  /// `OR`
  String get oR {
    return Intl.message('OR', name: 'oR', desc: '', args: []);
  }

  /// `Login With Google`
  String get login_with_google {
    return Intl.message(
      'Login With Google',
      name: 'login_with_google',
      desc: '',
      args: [],
    );
  }

  /// `Register`
  String get register {
    return Intl.message('Register', name: 'register', desc: '', args: []);
  }

  /// `Avatar`
  String get avatar {
    return Intl.message('Avatar', name: 'avatar', desc: '', args: []);
  }

  /// `Name`
  String get name {
    return Intl.message('Name', name: 'name', desc: '', args: []);
  }

  /// `Confirm Password`
  String get confirm_password {
    return Intl.message(
      'Confirm Password',
      name: 'confirm_password',
      desc: '',
      args: [],
    );
  }

  /// `Phone Number`
  String get phone_number {
    return Intl.message(
      'Phone Number',
      name: 'phone_number',
      desc: '',
      args: [],
    );
  }

  /// `Create Account`
  String get create_account {
    return Intl.message(
      'Create Account',
      name: 'create_account',
      desc: '',
      args: [],
    );
  }

  /// `Already Have Account?`
  String get already_have_account {
    return Intl.message(
      'Already Have Account?',
      name: 'already_have_account',
      desc: '',
      args: [],
    );
  }

  /// `Verify Email`
  String get verify_email {
    return Intl.message(
      'Verify Email',
      name: 'verify_email',
      desc: '',
      args: [],
    );
  }

  /// `See More`
  String get see_more {
    return Intl.message('See More', name: 'see_more', desc: '', args: []);
  }

  /// `Action`
  String get action {
    return Intl.message('Action', name: 'action', desc: '', args: []);
  }

  /// `Adventure`
  String get adventure {
    return Intl.message('Adventure', name: 'adventure', desc: '', args: []);
  }

  /// `Animation`
  String get animation {
    return Intl.message('Animation', name: 'animation', desc: '', args: []);
  }

  /// `Crime`
  String get crime {
    return Intl.message('Crime', name: 'crime', desc: '', args: []);
  }

  /// `Documentary`
  String get documentary {
    return Intl.message('Documentary', name: 'documentary', desc: '', args: []);
  }

  /// `Fantasy`
  String get fantasy {
    return Intl.message('Fantasy', name: 'fantasy', desc: '', args: []);
  }

  /// `History`
  String get history {
    return Intl.message('History', name: 'history', desc: '', args: []);
  }

  /// `Horror`
  String get horror {
    return Intl.message('Horror', name: 'horror', desc: '', args: []);
  }

  /// `Musical`
  String get musical {
    return Intl.message('Musical', name: 'musical', desc: '', args: []);
  }

  /// `Mystery`
  String get mystery {
    return Intl.message('Mystery', name: 'mystery', desc: '', args: []);
  }

  /// `Romance`
  String get romance {
    return Intl.message('Romance', name: 'romance', desc: '', args: []);
  }

  /// `Sci-Fi`
  String get sci {
    return Intl.message('Sci-Fi', name: 'sci', desc: '', args: []);
  }

  /// `Sport`
  String get sport {
    return Intl.message('Sport', name: 'sport', desc: '', args: []);
  }

  /// `Thriller`
  String get thriller {
    return Intl.message('Thriller', name: 'thriller', desc: '', args: []);
  }

  /// `War`
  String get war {
    return Intl.message('War', name: 'war', desc: '', args: []);
  }

  /// `Western`
  String get western {
    return Intl.message('Western', name: 'western', desc: '', args: []);
  }

  /// `Watch`
  String get watch {
    return Intl.message('Watch', name: 'watch', desc: '', args: []);
  }

  /// `Screen Shots`
  String get screen_shots {
    return Intl.message(
      'Screen Shots',
      name: 'screen_shots',
      desc: '',
      args: [],
    );
  }

  /// `Similar`
  String get similar {
    return Intl.message('Similar', name: 'similar', desc: '', args: []);
  }

  /// `Summary`
  String get summary {
    return Intl.message('Summary', name: 'summary', desc: '', args: []);
  }

  /// `Cast`
  String get cast {
    return Intl.message('Cast', name: 'cast', desc: '', args: []);
  }

  /// `Character`
  String get character {
    return Intl.message('Character', name: 'character', desc: '', args: []);
  }

  /// `Genres`
  String get genres {
    return Intl.message('Genres', name: 'genres', desc: '', args: []);
  }

  /// `Search`
  String get search {
    return Intl.message('Search', name: 'search', desc: '', args: []);
  }

  /// `Wish List`
  String get wish_list {
    return Intl.message('Wish List', name: 'wish_list', desc: '', args: []);
  }

  /// `Edit Profile`
  String get edit_profile {
    return Intl.message(
      'Edit Profile',
      name: 'edit_profile',
      desc: '',
      args: [],
    );
  }

  /// `Exit`
  String get exit {
    return Intl.message('Exit', name: 'exit', desc: '', args: []);
  }

  /// `Pick Avatar`
  String get pick_avatar {
    return Intl.message('Pick Avatar', name: 'pick_avatar', desc: '', args: []);
  }

  /// `Reset Password`
  String get reset_password {
    return Intl.message(
      'Reset Password',
      name: 'reset_password',
      desc: '',
      args: [],
    );
  }

  /// `Delete Account`
  String get delete_account {
    return Intl.message(
      'Delete Account',
      name: 'delete_account',
      desc: '',
      args: [],
    );
  }

  /// `Update Profile`
  String get update_profile {
    return Intl.message(
      'Update Profile',
      name: 'update_profile',
      desc: '',
      args: [],
    );
  }

  /// `Update Data`
  String get update_data {
    return Intl.message('Update Data', name: 'update_data', desc: '', args: []);
  }

  /// `Name is Required`
  String get name_is_required {
    return Intl.message(
      'Name is Required',
      name: 'name_is_required',
      desc: '',
      args: [],
    );
  }

  /// `Name should be at least 4 chars`
  String get nameshouldbeatleast4chars {
    return Intl.message(
      'Name should be at least 4 chars',
      name: 'nameshouldbeatleast4chars',
      desc: '',
      args: [],
    );
  }

  /// `Email is required`
  String get emailisrequired {
    return Intl.message(
      'Email is required',
      name: 'emailisrequired',
      desc: '',
      args: [],
    );
  }

  /// `E-mail Bad Format`
  String get e_mailBadFormat {
    return Intl.message(
      'E-mail Bad Format',
      name: 'e_mailBadFormat',
      desc: '',
      args: [],
    );
  }

  /// `Password is required`
  String get passwordisrequired {
    return Intl.message(
      'Password is required',
      name: 'passwordisrequired',
      desc: '',
      args: [],
    );
  }

  /// `Weak Password (Must contain: uppercase, lowercase, number, special char, and 8+ length)`
  String get weakPasswordand8length {
    return Intl.message(
      'Weak Password (Must contain: uppercase, lowercase, number, special char, and 8+ length)',
      name: 'weakPasswordand8length',
      desc: '',
      args: [],
    );
  }

  /// `Phone Number is Required`
  String get phoneNumberisRequired {
    return Intl.message(
      'Phone Number is Required',
      name: 'phoneNumberisRequired',
      desc: '',
      args: [],
    );
  }

  /// `Phone should be at least 8 digits`
  String get phoneshouldbeatleast8digits {
    return Intl.message(
      'Phone should be at least 8 digits',
      name: 'phoneshouldbeatleast8digits',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Password is Required`
  String get confirmPasswordisRequired {
    return Intl.message(
      'Confirm Password is Required',
      name: 'confirmPasswordisRequired',
      desc: '',
      args: [],
    );
  }

  /// `Passwords do not match`
  String get passwordsdonotmatch {
    return Intl.message(
      'Passwords do not match',
      name: 'passwordsdonotmatch',
      desc: '',
      args: [],
    );
  }

  /// `Loading`
  String get loading {
    return Intl.message('Loading', name: 'loading', desc: '', args: []);
  }

  /// `No Favorites Yet`
  String get noFavoritesYet {
    return Intl.message(
      'No Favorites Yet',
      name: 'noFavoritesYet',
      desc: '',
      args: [],
    );
  }

  /// `No History Yet`
  String get noHistoryYet {
    return Intl.message(
      'No History Yet',
      name: 'noHistoryYet',
      desc: '',
      args: [],
    );
  }

  /// `phone`
  String get phone {
    return Intl.message('phone', name: 'phone', desc: '', args: []);
  }

  /// `avatarId`
  String get avatarId {
    return Intl.message('avatarId', name: 'avatarId', desc: '', args: []);
  }

  /// `Profile updated successfully`
  String get profileupdatedsuccessfully {
    return Intl.message(
      'Profile updated successfully',
      name: 'profileupdatedsuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Account deleted successfully`
  String get accountdeletedsuccessfully {
    return Intl.message(
      'Account deleted successfully',
      name: 'accountdeletedsuccessfully',
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
