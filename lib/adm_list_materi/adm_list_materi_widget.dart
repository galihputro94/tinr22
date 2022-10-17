import '../backend/backend.dart';
import '../components/confirm_delete_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class AdmListMateriWidget extends StatefulWidget {
  const AdmListMateriWidget({Key? key}) : super(key: key);

  @override
  _AdmListMateriWidgetState createState() => _AdmListMateriWidgetState();
}

class _AdmListMateriWidgetState extends State<AdmListMateriWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();

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
          'Semua Materi',
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
                context.pushNamed('adm_addMateri');
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
                  color: Color(0xFF090F13),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                    topLeft: Radius.circular(0),
                    topRight: Radius.circular(0),
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
                        'Materi Aktif',
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
              StreamBuilder<List<MateriRecord>>(
                stream: queryMateriRecord(),
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
                  List<MateriRecord> listViewMateriRecordList = snapshot.data!;
                  return ListView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: listViewMateriRecordList.length,
                    itemBuilder: (context, listViewIndex) {
                      final listViewMateriRecord =
                          listViewMateriRecordList[listViewIndex];
                      return Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(10, 20, 10, 0),
                            child: InkWell(
                              onTap: () async {
                                context.pushNamed('adm_editMateri');
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                height: 80,
                                decoration: BoxDecoration(
                                  color: Color(0xFF01A8C9),
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color: FlutterFlowTheme.of(context).darkBG,
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20, 0, 20, 0),
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
                                            listViewMateriRecord.nama!,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1
                                                .override(
                                                  fontFamily: 'Inter',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .white,
                                                  fontSize: 16,
                                                ),
                                          ),
                                          Text(
                                            listViewMateriRecord.mk!,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1
                                                .override(
                                                  fontFamily: 'Inter',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .white,
                                                ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          FlutterFlowIconButton(
                                            borderColor: Color(0xFF01A8C9),
                                            borderRadius: 30,
                                            borderWidth: 1,
                                            buttonSize: 40,
                                            fillColor: Color(0xFF01A8C9),
                                            icon: FaIcon(
                                              FontAwesomeIcons.solidEdit,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .white,
                                              size: 20,
                                            ),
                                            showLoadingIndicator: true,
                                            onPressed: () async {
                                              context.pushNamed(
                                                'adm_editMateri',
                                                queryParams: {
                                                  'namaMateriEdit':
                                                      serializeParam(
                                                    listViewMateriRecord.nama,
                                                    ParamType.String,
                                                  ),
                                                  'namaLinkEdit':
                                                      serializeParam(
                                                    listViewMateriRecord.link,
                                                    ParamType.String,
                                                  ),
                                                  'mkMateriEdit':
                                                      serializeParam(
                                                    listViewMateriRecord.mk,
                                                    ParamType.String,
                                                  ),
                                                  'editMateriRef':
                                                      serializeParam(
                                                    listViewMateriRecord
                                                        .reference,
                                                    ParamType.DocumentReference,
                                                  ),
                                                }.withoutNulls,
                                              );
                                            },
                                          ),
                                          FlutterFlowIconButton(
                                            borderColor: Colors.transparent,
                                            borderRadius: 30,
                                            borderWidth: 1,
                                            buttonSize: 40,
                                            icon: Icon(
                                              Icons.delete_forever_rounded,
                                              color: Color(0xFFFF3232),
                                              size: 20,
                                            ),
                                            onPressed: () async {
                                              await showModalBottomSheet(
                                                isScrollControlled: true,
                                                backgroundColor:
                                                    Colors.transparent,
                                                context: context,
                                                builder: (context) {
                                                  return Padding(
                                                    padding:
                                                        MediaQuery.of(context)
                                                            .viewInsets,
                                                    child: ConfirmDeleteWidget(
                                                      namaMateri:
                                                          listViewMateriRecord
                                                              .nama,
                                                      materiRef:
                                                          listViewMateriRecord
                                                              .reference,
                                                    ),
                                                  );
                                                },
                                              ).then(
                                                  (value) => setState(() {}));
                                            },
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
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
            ],
          ),
        ),
      ),
    );
  }
}
