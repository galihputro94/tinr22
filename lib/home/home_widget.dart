import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    logFirebaseEvent('screen_view', parameters: {'screen_name': 'home'});
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).tertiaryColor,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).bg11,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 5,
                      color: Color(0x230E151B),
                      offset: Offset(0, 4),
                    )
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: 100,
                decoration: BoxDecoration(
                  color: Color(0xFF01A8C9),
                  borderRadius: BorderRadius.circular(0),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 25, 0, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20, 0, 10, 0),
                                child: Container(
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        2, 2, 2, 2),
                                    child: AuthUserStreamWidget(
                                      child: InkWell(
                                        onTap: () async {
                                          logFirebaseEvent(
                                              'HOME_PAGE_userAvatar_ON_TAP');
                                          logFirebaseEvent(
                                              'userAvatar_navigate_to');

                                          context.pushNamed(
                                            'UserProfile',
                                            extra: <String, dynamic>{
                                              kTransitionInfoKey:
                                                  TransitionInfo(
                                                hasTransition: true,
                                                transitionType:
                                                    PageTransitionType.fade,
                                                duration:
                                                    Duration(milliseconds: 500),
                                              ),
                                            },
                                          );
                                        },
                                        child: Container(
                                          width: 40,
                                          height: 40,
                                          clipBehavior: Clip.antiAlias,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                          ),
                                          child: Image.network(
                                            valueOrDefault<String>(
                                              currentUserPhoto,
                                              'https://github.com/tinr22/appasset/raw/main/00000000000000000000000000000000.png',
                                            ),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        2, 2, 2, 2),
                                    child: AuthUserStreamWidget(
                                      child: Text(
                                        currentUserDisplayName
                                            .maybeHandleOverflow(maxChars: 25),
                                        style: FlutterFlowTheme.of(context)
                                            .title1
                                            .override(
                                              fontFamily: 'Outfit',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              fontSize: 20,
                                              fontWeight: FontWeight.w600,
                                            ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        2, 2, 2, 2),
                                    child: AuthUserStreamWidget(
                                      child: Text(
                                        valueOrDefault(
                                                currentUserDocument?.npm, 0)
                                            .toString()
                                            .maybeHandleOverflow(maxChars: 25),
                                        style: FlutterFlowTheme.of(context)
                                            .title1
                                            .override(
                                              fontFamily: 'Outfit',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryColor,
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600,
                                            ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                            child: FlutterFlowIconButton(
                              borderColor: Colors.transparent,
                              borderRadius: 50,
                              borderWidth: 1,
                              buttonSize: 60,
                              icon: Icon(
                                Icons.info_sharp,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 30,
                              ),
                              onPressed: () async {
                                logFirebaseEvent(
                                    'HOME_PAGE_info_sharp_ICN_ON_TAP');
                                logFirebaseEvent('IconButton_navigate_to');

                                context.pushNamed(
                                  'infoPage',
                                  extra: <String, dynamic>{
                                    kTransitionInfoKey: TransitionInfo(
                                      hasTransition: true,
                                      transitionType: PageTransitionType.fade,
                                      duration: Duration(milliseconds: 500),
                                    ),
                                  },
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 1,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).primaryBackground,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(0),
                    bottomRight: Radius.circular(0),
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 12),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          width: double.infinity,
                          height: 200,
                          decoration: BoxDecoration(),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                            child: GridView(
                              padding: EdgeInsets.zero,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 4,
                                crossAxisSpacing: 5,
                                mainAxisSpacing: 5,
                                childAspectRatio: 1,
                              ),
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              children: [
                                Container(
                                  width: 50,
                                  height: 50,
                                  decoration: BoxDecoration(),
                                  child: InkWell(
                                    onTap: () async {
                                      logFirebaseEvent(
                                          'HOME_PAGE_Column_y2nom5wb_ON_TAP');
                                      logFirebaseEvent('Column_navigate_to');

                                      context.pushNamed('listMhs');
                                    },
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        FaIcon(
                                          FontAwesomeIcons.users,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          size: 30,
                                        ),
                                        Text(
                                          'Mahasiswa',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1
                                              .override(
                                                fontFamily: 'Inter',
                                                fontSize: 11,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8, 8, 8, 8),
                                  child: Container(
                                    width: 50,
                                    height: 50,
                                    decoration: BoxDecoration(),
                                    child: InkWell(
                                      onTap: () async {
                                        logFirebaseEvent(
                                            'HOME_PAGE_Column_66grns23_ON_TAP');
                                        logFirebaseEvent('Column_navigate_to');

                                        context.pushNamed('jadwal');
                                      },
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          FaIcon(
                                            FontAwesomeIcons.calendarDay,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            size: 30,
                                          ),
                                          Text(
                                            'Jadwal',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1
                                                .override(
                                                  fontFamily: 'Inter',
                                                  fontSize: 11,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8, 8, 8, 8),
                                  child: Container(
                                    width: 50,
                                    height: 50,
                                    decoration: BoxDecoration(),
                                    child: InkWell(
                                      onTap: () async {
                                        logFirebaseEvent(
                                            'HOME_PAGE_Column_wnc3fa4t_ON_TAP');
                                        logFirebaseEvent('Column_navigate_to');

                                        context.pushNamed('listMK');
                                      },
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          FaIcon(
                                            FontAwesomeIcons.book,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            size: 30,
                                          ),
                                          Text(
                                            'Materi',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1
                                                .override(
                                                  fontFamily: 'Inter',
                                                  fontSize: 11,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8, 8, 8, 8),
                                  child: Container(
                                    width: 50,
                                    height: 50,
                                    decoration: BoxDecoration(),
                                    child: InkWell(
                                      onTap: () async {
                                        logFirebaseEvent(
                                            'HOME_PAGE_Column_c6qlvxjt_ON_TAP');
                                        logFirebaseEvent('Column_navigate_to');

                                        context.pushNamed('Galery');
                                      },
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          FaIcon(
                                            FontAwesomeIcons.photoVideo,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            size: 30,
                                          ),
                                          Text(
                                            'Dokumentasi',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1
                                                .override(
                                                  fontFamily: 'Inter',
                                                  fontSize: 11,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 16, 0),
                                    child: FaIcon(
                                      FontAwesomeIcons.solidBell,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      size: 24,
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      'Tugas Aktif',
                                      style: FlutterFlowTheme.of(context)
                                          .title1
                                          .override(
                                            fontFamily: 'Poppins',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            fontSize: 20,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            StreamBuilder<List<TugasRecord>>(
                              stream: queryTugasRecord(
                                queryBuilder: (tugasRecord) => tugasRecord
                                    .where('isActive', isEqualTo: true)
                                    .orderBy('deadline'),
                              ),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: SizedBox(
                                      width: 50,
                                      height: 50,
                                      child: SpinKitDualRing(
                                        color:
                                            FlutterFlowTheme.of(context).white,
                                        size: 50,
                                      ),
                                    ),
                                  );
                                }
                                List<TugasRecord> listViewTugasRecordList =
                                    snapshot.data!;
                                return ListView.builder(
                                  padding: EdgeInsets.zero,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount: listViewTugasRecordList.length,
                                  itemBuilder: (context, listViewIndex) {
                                    final listViewTugasRecord =
                                        listViewTugasRecordList[listViewIndex];
                                    return SingleChildScrollView(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    10, 20, 10, 0),
                                            child: InkWell(
                                              onTap: () async {
                                                logFirebaseEvent(
                                                    'HOME_PAGE_Container_kz48d6dv_ON_TAP');
                                                logFirebaseEvent(
                                                    'Container_navigate_to');

                                                context.pushNamed(
                                                  'detailTugas',
                                                  queryParams: {
                                                    'namaTugas': serializeParam(
                                                      listViewTugasRecord
                                                          .namaTugas,
                                                      ParamType.String,
                                                    ),
                                                    'mkTugas': serializeParam(
                                                      listViewTugasRecord
                                                          .mkTugas,
                                                      ParamType.String,
                                                    ),
                                                    'deadline': serializeParam(
                                                      listViewTugasRecord
                                                          .deadline,
                                                      ParamType.DateTime,
                                                    ),
                                                    'isActive': serializeParam(
                                                      listViewTugasRecord
                                                          .isActive,
                                                      ParamType.bool,
                                                    ),
                                                    'ketTugas': serializeParam(
                                                      listViewTugasRecord
                                                          .ketTugas,
                                                      ParamType.String,
                                                    ),
                                                  }.withoutNulls,
                                                );
                                              },
                                              child: Container(
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                height: 80,
                                                decoration: BoxDecoration(
                                                  color: Color(0xFF7FE2FE),
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(20, 0, 20, 0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            listViewTugasRecord
                                                                .namaTugas!,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .darkBG,
                                                                  fontSize: 16,
                                                                ),
                                                          ),
                                                          Text(
                                                            listViewTugasRecord
                                                                .mkTugas!,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .darkBG,
                                                                ),
                                                          ),
                                                          Text(
                                                            listViewTugasRecord
                                                                .deadline!
                                                                .toString(),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .darkBG,
                                                                ),
                                                          ),
                                                        ],
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(10,
                                                                    10, 10, 10),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Icon(
                                                              Icons.book,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .darkBG,
                                                              size: 30,
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
