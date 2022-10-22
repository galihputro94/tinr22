import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class ListMhsWidget extends StatefulWidget {
  const ListMhsWidget({Key? key}) : super(key: key);

  @override
  _ListMhsWidgetState createState() => _ListMhsWidgetState();
}

class _ListMhsWidgetState extends State<ListMhsWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    logFirebaseEvent('screen_view', parameters: {'screen_name': 'listMhs'});
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).tertiaryColor,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).tertiaryColor,
        automaticallyImplyLeading: false,
        leading: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30,
          borderWidth: 1,
          buttonSize: 54,
          icon: Icon(
            Icons.arrow_back_rounded,
            color: FlutterFlowTheme.of(context).white,
            size: 24,
          ),
          onPressed: () async {
            logFirebaseEvent('LIST_MHS_arrow_back_rounded_ICN_ON_TAP');
            logFirebaseEvent('IconButton_navigate_to');

            context.pushNamed('home');

            logFirebaseEvent('IconButton_navigate_to');

            context.pushNamed('home');
          },
        ),
        title: Text(
          'Daftar Mahasiswa',
          style: FlutterFlowTheme.of(context).title3.override(
                fontFamily: 'Outfit',
                color: FlutterFlowTheme.of(context).white,
              ),
        ),
        actions: [],
        centerTitle: false,
        elevation: 0,
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
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
                padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(24, 0, 0, 0),
                        child: Text(
                          'Pejabat Kelas',
                          style: FlutterFlowTheme.of(context)
                              .bodyText2
                              .override(
                                fontFamily: 'Inter',
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: 170,
                        decoration: BoxDecoration(),
                        child: StreamBuilder<List<UsersRecord>>(
                          stream: queryUsersRecord(
                            queryBuilder: (usersRecord) => usersRecord
                                .where('pejabat', isEqualTo: true)
                                .orderBy('indexJabatan'),
                          ),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return Center(
                                child: SizedBox(
                                  width: 50,
                                  height: 50,
                                  child: SpinKitDualRing(
                                    color: FlutterFlowTheme.of(context).white,
                                    size: 50,
                                  ),
                                ),
                              );
                            }
                            List<UsersRecord> listViewUsersRecordList =
                                snapshot.data!;
                            return ListView.builder(
                              padding: EdgeInsets.zero,
                              primary: false,
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: listViewUsersRecordList.length,
                              itemBuilder: (context, listViewIndex) {
                                final listViewUsersRecord =
                                    listViewUsersRecordList[listViewIndex];
                                return Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10, 12, 0, 12),
                                  child: InkWell(
                                    onTap: () async {
                                      logFirebaseEvent(
                                          'LIST_MHS_PAGE_Container_ewva4blk_ON_TAP');
                                      logFirebaseEvent('Container_navigate_to');

                                      context.pushNamed(
                                        'profileMhs',
                                        queryParams: {
                                          'namaMhs': serializeParam(
                                            listViewUsersRecord.displayName,
                                            ParamType.String,
                                          ),
                                          'genderMhs': serializeParam(
                                            listViewUsersRecord.gender,
                                            ParamType.String,
                                          ),
                                          'phoneMhs': serializeParam(
                                            listViewUsersRecord.phoneNumber,
                                            ParamType.String,
                                          ),
                                          'avatarMhs': serializeParam(
                                            listViewUsersRecord.photoUrl,
                                            ParamType.String,
                                          ),
                                          'domisiliMhs': serializeParam(
                                            listViewUsersRecord.domisili,
                                            ParamType.String,
                                          ),
                                          'jabatanMhs': serializeParam(
                                            listViewUsersRecord.jabatan,
                                            ParamType.String,
                                          ),
                                          'emailMhs': serializeParam(
                                            listViewUsersRecord.email,
                                            ParamType.String,
                                          ),
                                          'npmMHS': serializeParam(
                                            listViewUsersRecord.npm?.toString(),
                                            ParamType.String,
                                          ),
                                        }.withoutNulls,
                                        extra: <String, dynamic>{
                                          kTransitionInfoKey: TransitionInfo(
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
                                      width: 160,
                                      height: 100,
                                      decoration: BoxDecoration(
                                        color: Color(0xFF7FE2FE),
                                        boxShadow: [
                                          BoxShadow(
                                            blurRadius: 4,
                                            color: Color(0x34090F13),
                                            offset: Offset(0, 2),
                                          )
                                        ],
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            12, 12, 12, 12),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                              child: Image.network(
                                                listViewUsersRecord.photoUrl!,
                                                width: 60,
                                                height: 60,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(5, 8, 5, 0),
                                              child: Text(
                                                listViewUsersRecord.displayName!
                                                    .maybeHandleOverflow(
                                                        maxChars: 12),
                                                maxLines: 1,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .darkBG,
                                                          fontSize: 14,
                                                        ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 4, 0, 0),
                                              child: Text(
                                                listViewUsersRecord.jabatan!,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText2
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          color:
                                                              Color(0xB2111417),
                                                          fontSize: 12,
                                                        ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(24, 10, 0, 0),
                        child: Text(
                          'Semua Mahasiswa',
                          style: FlutterFlowTheme.of(context)
                              .bodyText2
                              .override(
                                fontFamily: 'Inter',
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 44),
                        child: StreamBuilder<List<UsersRecord>>(
                          stream: queryUsersRecord(
                            queryBuilder: (usersRecord) =>
                                usersRecord.orderBy('display_name'),
                          ),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return Center(
                                child: SizedBox(
                                  width: 40,
                                  height: 40,
                                  child: CircularProgressIndicator(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryColor,
                                  ),
                                ),
                              );
                            }
                            List<UsersRecord> listViewUsersRecordList = snapshot
                                .data!
                                .where((u) => u.uid != currentUserUid)
                                .toList();
                            return ListView.builder(
                              padding: EdgeInsets.zero,
                              primary: false,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: listViewUsersRecordList.length,
                              itemBuilder: (context, listViewIndex) {
                                final listViewUsersRecord =
                                    listViewUsersRecordList[listViewIndex];
                                return Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 1, 0, 0),
                                  child: Material(
                                    color: Colors.transparent,
                                    elevation: 4,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(0),
                                    ),
                                    child: Container(
                                      width: double.infinity,
                                      height: 60,
                                      decoration: BoxDecoration(
                                        color: Color(0xFF7FE2FE),
                                        boxShadow: [
                                          BoxShadow(
                                            blurRadius: 4,
                                            color: Color(0x32000000),
                                            offset: Offset(0, 2),
                                          )
                                        ],
                                        borderRadius: BorderRadius.circular(0),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            8, 5, 8, 5),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Container(
                                              width: 40,
                                              height: 40,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                borderRadius:
                                                    BorderRadius.circular(50),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(1, 1, 1, 1),
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(26),
                                                  child: Image.network(
                                                    valueOrDefault<String>(
                                                      listViewUsersRecord
                                                          .photoUrl,
                                                      'https://www.gravatar.com/avatar/00000000000000000000000000000000?d=mp&f=y',
                                                    ),
                                                    width: 40,
                                                    height: 40,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(12, 0, 0, 0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 0, 0, 8),
                                                      child: Text(
                                                        listViewUsersRecord
                                                            .displayName!
                                                            .maybeHandleOverflow(
                                                                maxChars: 25),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
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
                                                    ),
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Text(
                                                          listViewUsersRecord
                                                              .jabatan!,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText2
                                                              .override(
                                                                fontFamily:
                                                                    'Inter',
                                                                color: Color(
                                                                    0xBF111417),
                                                              ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            FFButtonWidget(
                                              onPressed: () async {
                                                logFirebaseEvent(
                                                    'LIST_MHS_PAGE_LIHAT_BTN_ON_TAP');
                                                logFirebaseEvent(
                                                    'Button_navigate_to');

                                                context.pushNamed(
                                                  'profileMhs',
                                                  queryParams: {
                                                    'namaMhs': serializeParam(
                                                      listViewUsersRecord
                                                          .displayName,
                                                      ParamType.String,
                                                    ),
                                                    'genderMhs': serializeParam(
                                                      listViewUsersRecord
                                                          .gender,
                                                      ParamType.String,
                                                    ),
                                                    'phoneMhs': serializeParam(
                                                      listViewUsersRecord
                                                          .phoneNumber,
                                                      ParamType.String,
                                                    ),
                                                    'avatarMhs': serializeParam(
                                                      listViewUsersRecord
                                                          .photoUrl,
                                                      ParamType.String,
                                                    ),
                                                    'domisiliMhs':
                                                        serializeParam(
                                                      listViewUsersRecord
                                                          .domisili,
                                                      ParamType.String,
                                                    ),
                                                    'jabatanMhs':
                                                        serializeParam(
                                                      listViewUsersRecord
                                                          .jabatan,
                                                      ParamType.String,
                                                    ),
                                                    'emailMhs': serializeParam(
                                                      listViewUsersRecord.email,
                                                      ParamType.String,
                                                    ),
                                                    'npmMHS': serializeParam(
                                                      listViewUsersRecord.npm
                                                          ?.toString(),
                                                      ParamType.String,
                                                    ),
                                                  }.withoutNulls,
                                                  extra: <String, dynamic>{
                                                    kTransitionInfoKey:
                                                        TransitionInfo(
                                                      hasTransition: true,
                                                      transitionType:
                                                          PageTransitionType
                                                              .fade,
                                                      duration: Duration(
                                                          milliseconds: 500),
                                                    ),
                                                  },
                                                );
                                              },
                                              text: 'Lihat',
                                              options: FFButtonOptions(
                                                width: 70,
                                                height: 36,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .tertiaryColor,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily: 'Outfit',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .white,
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                                borderSide: BorderSide(
                                                  color: Colors.transparent,
                                                  width: 1,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            );
                          },
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
    );
  }
}
