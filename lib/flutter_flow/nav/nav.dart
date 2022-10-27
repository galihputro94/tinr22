import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';
import 'package:page_transition/page_transition.dart';
import '../flutter_flow_theme.dart';
import '../../backend/backend.dart';
import '../../auth/firebase_user_provider.dart';

import '../../index.dart';
import '../../main.dart';
import '../lat_lng.dart';
import '../place.dart';
import 'serialization_util.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

class AppStateNotifier extends ChangeNotifier {
  TiNr22FirebaseUser? initialUser;
  TiNr22FirebaseUser? user;
  bool showSplashImage = true;
  String? _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation!;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(TiNr22FirebaseUser newUser) {
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    if (notifyOnAuthChange) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      errorBuilder: (context, _) =>
          appStateNotifier.loggedIn ? NavBarPage() : LoginWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) =>
              appStateNotifier.loggedIn ? NavBarPage() : LoginWidget(),
          routes: [
            FFRoute(
              name: 'createAccount',
              path: 'createAccount',
              builder: (context, params) => CreateAccountWidget(),
            ),
            FFRoute(
              name: 'editProfile',
              path: 'editProfile',
              builder: (context, params) => EditProfileWidget(),
            ),
            FFRoute(
              name: 'login',
              path: 'login',
              builder: (context, params) => LoginWidget(),
            ),
            FFRoute(
              name: 'profilePageOld',
              path: 'profilePageOld',
              requireAuth: true,
              builder: (context, params) => ProfilePageOldWidget(),
            ),
            FFRoute(
              name: 'changePassword',
              path: 'changePassword',
              builder: (context, params) => ChangePasswordWidget(),
            ),
            FFRoute(
              name: 'jadwal',
              path: 'jadwal',
              builder: (context, params) => JadwalWidget(),
            ),
            FFRoute(
              name: 'detailTugas',
              path: 'detailTugas',
              builder: (context, params) => DetailTugasWidget(
                namaTugas: params.getParam('namaTugas', ParamType.String),
                mkTugas: params.getParam('mkTugas', ParamType.String),
                deadline: params.getParam('deadline', ParamType.DateTime),
                isActive: params.getParam('isActive', ParamType.bool),
                ketTugas: params.getParam('ketTugas', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'home',
              path: 'home',
              requireAuth: true,
              builder: (context, params) => params.isEmpty
                  ? NavBarPage(initialPage: 'home')
                  : HomeWidget(),
            ),
            FFRoute(
              name: 'MKFisika',
              path: 'mKFisika',
              builder: (context, params) => MKFisikaWidget(),
            ),
            FFRoute(
              name: 'MKBahasaindonesia',
              path: 'mKBahasaindonesia',
              builder: (context, params) => MKBahasaindonesiaWidget(),
            ),
            FFRoute(
              name: 'MKPengantarSistemDigital',
              path: 'mKPengantarSistemDigital',
              builder: (context, params) => MKPengantarSistemDigitalWidget(),
            ),
            FFRoute(
              name: 'Galery',
              path: 'galery',
              builder: (context, params) => GaleryWidget(),
            ),
            FFRoute(
              name: 'adm_addMateri',
              path: 'admAddMateri',
              builder: (context, params) => AdmAddMateriWidget(),
            ),
            FFRoute(
              name: 'completProfile',
              path: 'completProfile',
              builder: (context, params) => CompletProfileWidget(),
            ),
            FFRoute(
              name: 'adm_ListMateri',
              path: 'admListMateri',
              builder: (context, params) => AdmListMateriWidget(),
            ),
            FFRoute(
              name: 'adm_editMateri',
              path: 'admEditMateri',
              builder: (context, params) => AdmEditMateriWidget(
                namaMateriEdit:
                    params.getParam('namaMateriEdit', ParamType.String),
                namaLinkEdit: params.getParam('namaLinkEdit', ParamType.String),
                mkMateriEdit: params.getParam('mkMateriEdit', ParamType.String),
                editMateriRef: params.getParam('editMateriRef',
                    ParamType.DocumentReference, false, 'materi'),
              ),
            ),
            FFRoute(
              name: 'adm_init',
              path: 'admInit',
              requireAuth: true,
              builder: (context, params) => AdmInitWidget(),
            ),
            FFRoute(
              name: 'add_Tugas',
              path: 'addTugas',
              builder: (context, params) => AddTugasWidget(),
            ),
            FFRoute(
              name: 'listMhs',
              path: 'listMhs',
              builder: (context, params) => ListMhsWidget(),
            ),
            FFRoute(
              name: 'adm_ListTugas',
              path: 'admListTugas',
              builder: (context, params) => AdmListTugasWidget(),
            ),
            FFRoute(
              name: 'MKAgama',
              path: 'mKAgama',
              builder: (context, params) => MKAgamaWidget(),
            ),
            FFRoute(
              name: 'MKKalkulus',
              path: 'mKKalkulus',
              builder: (context, params) => MKKalkulusWidget(),
            ),
            FFRoute(
              name: 'MKDasarInfrastrukturTeknologiInformasi',
              path: 'mKDasarInfrastrukturTeknologiInformasi',
              builder: (context, params) =>
                  MKDasarInfrastrukturTeknologiInformasiWidget(),
            ),
            FFRoute(
              name: 'MKAlogaritmaDanPemograman',
              path: 'mKAlogaritmaDanPemograman',
              builder: (context, params) => MKAlogaritmaDanPemogramanWidget(),
            ),
            FFRoute(
              name: 'adm_editTugas',
              path: 'admEditTugas',
              builder: (context, params) => AdmEditTugasWidget(
                editTugasRef: params.getParam('editTugasRef',
                    ParamType.DocumentReference, false, 'tugas'),
                namaTugasEdit:
                    params.getParam('namaTugasEdit', ParamType.String),
                mkTugasEdit: params.getParam('mkTugasEdit', ParamType.String),
                deadlineTugasEdit:
                    params.getParam('deadlineTugasEdit', ParamType.DateTime),
                ketTugasEdit: params.getParam('ketTugasEdit', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'admManageUser',
              path: 'admManageUser',
              builder: (context, params) => AdmManageUserWidget(),
            ),
            FFRoute(
              name: 'profileMhs',
              path: 'profileMhs',
              builder: (context, params) => ProfileMhsWidget(
                namaMhs: params.getParam('namaMhs', ParamType.String),
                genderMhs: params.getParam('genderMhs', ParamType.String),
                phoneMhs: params.getParam('phoneMhs', ParamType.String),
                avatarMhs: params.getParam('avatarMhs', ParamType.String),
                domisiliMhs: params.getParam('domisiliMhs', ParamType.String),
                jabatanMhs: params.getParam('jabatanMhs', ParamType.String),
                emailMhs: params.getParam('emailMhs', ParamType.String),
                npmMHS: params.getParam('npmMHS', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'MKBahasainggris',
              path: 'mKBahasaInggris',
              builder: (context, params) => MKBahasainggrisWidget(),
            ),
            FFRoute(
              name: 'MKPancasila',
              path: 'mKPancasila',
              builder: (context, params) => MKPancasilaWidget(),
            ),
            FFRoute(
              name: 'UserProfile',
              path: 'userProfile',
              requireAuth: true,
              builder: (context, params) => params.isEmpty
                  ? NavBarPage(initialPage: 'UserProfile')
                  : UserProfileWidget(),
            ),
            FFRoute(
              name: 'infoPage',
              path: 'infoPage',
              builder: (context, params) => InfoPageWidget(),
            ),
            FFRoute(
              name: 'listMK',
              path: 'listMK',
              builder: (context, params) => ListMKWidget(),
            ),
            FFRoute(
              name: 'DetailMK',
              path: 'detailMK',
              builder: (context, params) => DetailMKWidget(
                namaMK: params.getParam('namaMK', ParamType.String),
                dosenMK: params.getParam('dosenMK', ParamType.String),
                jamMK: params.getParam('jamMK', ParamType.String),
                ruangMK: params.getParam('ruangMK', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'adm_addMhs',
              path: 'admAddMhs',
              builder: (context, params) => AdmAddMhsWidget(),
            )
          ].map((r) => r.toRoute(appStateNotifier)).toList(),
        ).toRoute(appStateNotifier),
      ],
      urlPathStrategy: UrlPathStrategy.path,
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> params = const <String, String>{},
    Map<String, String> queryParams = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              params: params,
              queryParams: queryParams,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> params = const <String, String>{},
    Map<String, String> queryParams = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              params: params,
              queryParams: queryParams,
              extra: extra,
            );
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState =>
      (routerDelegate.refreshListenable as AppStateNotifier);
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void setRedirectLocationIfUnset(String location) =>
      (routerDelegate.refreshListenable as AppStateNotifier)
          .updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(params)
    ..addAll(queryParams)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.extraMap.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, [
    bool isList = false,
    String? collectionName,
  ]) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(param, type, isList, collectionName);
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        redirect: (state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.location);
            return '/login';
          }
          return null;
        },
        pageBuilder: (context, state) {
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
              ? Container(
                  color: FlutterFlowTheme.of(context).white,
                  child: Image.asset(
                    'assets/images/I__3_-removebg-preview.png',
                    fit: BoxFit.contain,
                  ),
                )
              : page;

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder: PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).transitionsBuilder,
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => TransitionInfo(hasTransition: false);
}
