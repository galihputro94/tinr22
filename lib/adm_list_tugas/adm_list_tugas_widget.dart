import '../backend/backend.dart';
import '../components/adm_hapus_tugas_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_toggle_icon.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class AdmListTugasWidget extends StatefulWidget {
  const AdmListTugasWidget({Key? key}) : super(key: key);

  @override
  _AdmListTugasWidgetState createState() => _AdmListTugasWidgetState();
}

class _AdmListTugasWidgetState extends State<AdmListTugasWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'adm_ListTugas'});
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFF01A8C9),
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).darkBG,
        automaticallyImplyLeading: false,
        leading: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
          child: FFButtonWidget(
            onPressed: () async {
              logFirebaseEvent('ADM_LIST_TUGAS_PAGE__BTN_ON_TAP');
              logFirebaseEvent('Button_navigate_back');
              context.pop();
            },
            text: '',
            icon: FaIcon(
              FontAwesomeIcons.arrowLeft,
              size: 20,
            ),
            options: FFButtonOptions(
              width: 130,
              height: 40,
              color: FlutterFlowTheme.of(context).darkBG,
              textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                    fontFamily: 'Inter',
                    color: Colors.white,
                  ),
              borderSide: BorderSide(
                color: Colors.transparent,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
        title: Text(
          'Semua Tugas',
          style: FlutterFlowTheme.of(context).title2.override(
                fontFamily: 'Outfit',
                color: Colors.white,
                fontSize: 22,
              ),
        ),
        actions: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 12, 0),
            child: FlutterFlowIconButton(
              borderColor: Colors.transparent,
              borderRadius: 30,
              borderWidth: 1,
              buttonSize: 60,
              icon: Icon(
                Icons.add,
                color: FlutterFlowTheme.of(context).white,
                size: 30,
              ),
              onPressed: () async {
                logFirebaseEvent('ADM_LIST_TUGAS_PAGE_add_ICN_ON_TAP');
                logFirebaseEvent('IconButton_navigate_to');

                context.pushNamed('add_Tugas');
              },
            ),
          ),
        ],
        centerTitle: false,
        elevation: 4,
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 40,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).darkBG,
                  border: Border.all(
                    color: FlutterFlowTheme.of(context).darkBG,
                  ),
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Tugas Aktif',
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Inter',
                              color: FlutterFlowTheme.of(context).white,
                              fontSize: 16,
                            ),
                      ),
                    ],
                  ),
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
                          color: FlutterFlowTheme.of(context).white,
                          size: 50,
                        ),
                      ),
                    );
                  }
                  List<TugasRecord> listViewTugasRecordList = snapshot.data!;
                  return ListView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: listViewTugasRecordList.length,
                    itemBuilder: (context, listViewIndex) {
                      final listViewTugasRecord =
                          listViewTugasRecordList[listViewIndex];
                      return Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(10, 20, 10, 0),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: 80,
                              decoration: BoxDecoration(
                                color: Color(0xFF01A8C9),
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context).white,
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20, 0, 20, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          listViewTugasRecord.namaTugas!,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1
                                              .override(
                                                fontFamily: 'Inter',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .darkBG,
                                                fontSize: 16,
                                              ),
                                        ),
                                        Text(
                                          listViewTugasRecord.mkTugas!,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1,
                                        ),
                                        Text(
                                          listViewTugasRecord.deadline!
                                              .toString(),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1,
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 10, 0, 10),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Text(
                                            'Status',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1
                                                .override(
                                                  fontFamily: 'Inter',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .white,
                                                ),
                                          ),
                                          ToggleIcon(
                                            onPressed: () async {
                                              final tugasUpdateData = {
                                                'isActive': !listViewTugasRecord
                                                    .isActive!,
                                              };
                                              await listViewTugasRecord
                                                  .reference
                                                  .update(tugasUpdateData);
                                            },
                                            value:
                                                listViewTugasRecord.isActive!,
                                            onIcon: Icon(
                                              Icons.check,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryColor,
                                              size: 25,
                                            ),
                                            offIcon: Icon(
                                              Icons.close_outlined,
                                              color: Color(0xFFFF0000),
                                              size: 25,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Color(0xFF090F13),
                  ),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Tugas Tidak Aktif',
                          style:
                              FlutterFlowTheme.of(context).bodyText1.override(
                                    fontFamily: 'Inter',
                                    color: FlutterFlowTheme.of(context).white,
                                    fontSize: 16,
                                  ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              StreamBuilder<List<TugasRecord>>(
                stream: queryTugasRecord(
                  queryBuilder: (tugasRecord) => tugasRecord
                      .where('isActive', isEqualTo: false)
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
                          color: FlutterFlowTheme.of(context).white,
                          size: 50,
                        ),
                      ),
                    );
                  }
                  List<TugasRecord> listViewTugasRecordList = snapshot.data!;
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
                                  EdgeInsetsDirectional.fromSTEB(10, 20, 10, 0),
                              child: InkWell(
                                onTap: () async {
                                  logFirebaseEvent(
                                      'ADM_LIST_TUGAS_Container_6am1vkg5_ON_TAP');
                                  logFirebaseEvent('Container_navigate_to');

                                  context.pushNamed(
                                    'adm_editTugas',
                                    queryParams: {
                                      'editTugasRef': serializeParam(
                                        listViewTugasRecord.reference,
                                        ParamType.DocumentReference,
                                      ),
                                    }.withoutNulls,
                                  );
                                },
                                onLongPress: () async {
                                  logFirebaseEvent(
                                      'ADM_LIST_TUGAS_Container_6am1vkg5_ON_LON');
                                  logFirebaseEvent('Container_bottom_sheet');
                                  await showModalBottomSheet(
                                    isScrollControlled: true,
                                    backgroundColor: Colors.transparent,
                                    context: context,
                                    builder: (context) {
                                      return Padding(
                                        padding:
                                            MediaQuery.of(context).viewInsets,
                                        child: AdmHapusTugasWidget(
                                          indexTgs:
                                              listViewTugasRecord.reference,
                                        ),
                                      );
                                    },
                                  ).then((value) => setState(() {}));
                                },
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: 80,
                                  decoration: BoxDecoration(
                                    color: Color(0xFF01A8C9),
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                      color: FlutterFlowTheme.of(context).white,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        20, 0, 20, 0),
                                    child: InkWell(
                                      onTap: () async {
                                        logFirebaseEvent(
                                            'ADM_LIST_TUGAS_PAGE_Row_1xqo0h6w_ON_TAP');
                                        logFirebaseEvent('Row_navigate_to');

                                        context.pushNamed(
                                          'adm_editTugas',
                                          queryParams: {
                                            'editTugasRef': serializeParam(
                                              listViewTugasRecord.reference,
                                              ParamType.DocumentReference,
                                            ),
                                            'namaTugasEdit': serializeParam(
                                              listViewTugasRecord.namaTugas,
                                              ParamType.String,
                                            ),
                                            'mkTugasEdit': serializeParam(
                                              listViewTugasRecord.mkTugas,
                                              ParamType.String,
                                            ),
                                            'deadlineTugasEdit': serializeParam(
                                              listViewTugasRecord.deadline,
                                              ParamType.DateTime,
                                            ),
                                            'ketTugasEdit': serializeParam(
                                              listViewTugasRecord.ketTugas,
                                              ParamType.String,
                                            ),
                                          }.withoutNulls,
                                        );
                                      },
                                      onLongPress: () async {
                                        logFirebaseEvent(
                                            'ADM_LIST_TUGAS_Row_1xqo0h6w_ON_LONG_PRES');
                                        logFirebaseEvent('Row_bottom_sheet');
                                        await showModalBottomSheet(
                                          isScrollControlled: true,
                                          backgroundColor: Colors.transparent,
                                          context: context,
                                          builder: (context) {
                                            return Padding(
                                              padding: MediaQuery.of(context)
                                                  .viewInsets,
                                              child: AdmHapusTugasWidget(
                                                indexTgs: listViewTugasRecord
                                                    .reference,
                                              ),
                                            );
                                          },
                                        ).then((value) => setState(() {}));
                                      },
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                listViewTugasRecord.namaTugas!,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .white,
                                                          fontSize: 16,
                                                        ),
                                              ),
                                              Text(
                                                listViewTugasRecord.mkTugas!,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1,
                                              ),
                                              Text(
                                                listViewTugasRecord.deadline!
                                                    .toString(),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1,
                                              ),
                                            ],
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 10, 0, 10),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Text(
                                                  'Status',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .white,
                                                      ),
                                                ),
                                                ToggleIcon(
                                                  onPressed: () async {
                                                    final tugasUpdateData = {
                                                      'isActive':
                                                          !listViewTugasRecord
                                                              .isActive!,
                                                    };
                                                    await listViewTugasRecord
                                                        .reference
                                                        .update(
                                                            tugasUpdateData);
                                                  },
                                                  value: listViewTugasRecord
                                                      .isActive!,
                                                  onIcon: Icon(
                                                    Icons.check,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryColor,
                                                    size: 25,
                                                  ),
                                                  offIcon: Icon(
                                                    Icons.close_outlined,
                                                    color: Color(0xFFFF0000),
                                                    size: 25,
                                                  ),
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
        ),
      ),
    );
  }
}
