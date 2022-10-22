import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class AdmAddMateriWidget extends StatefulWidget {
  const AdmAddMateriWidget({Key? key}) : super(key: key);

  @override
  _AdmAddMateriWidgetState createState() => _AdmAddMateriWidgetState();
}

class _AdmAddMateriWidgetState extends State<AdmAddMateriWidget> {
  String? mkfieldValue;
  TextEditingController? linkFieldController;
  TextEditingController? namaMateriController;
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    linkFieldController = TextEditingController();
    namaMateriController = TextEditingController();
    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'adm_addMateri'});
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    linkFieldController?.dispose();
    namaMateriController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        automaticallyImplyLeading: false,
        title: Visibility(
          visible: valueOrDefault(currentUserDocument?.role, '') == 'admin',
          child: AuthUserStreamWidget(
            child: Text(
              'Tambah Materi',
              style: FlutterFlowTheme.of(context).title2.override(
                    fontFamily: 'Outfit',
                    color: FlutterFlowTheme.of(context).tertiaryColor,
                  ),
            ),
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 16, 0),
            child: FlutterFlowIconButton(
              borderColor: Colors.transparent,
              borderRadius: 30,
              buttonSize: 48,
              icon: Icon(
                Icons.close_rounded,
                color: FlutterFlowTheme.of(context).tertiaryColor,
                size: 30,
              ),
              onPressed: () async {
                logFirebaseEvent('ADM_ADD_MATERI_close_rounded_ICN_ON_TAP');
                logFirebaseEvent('IconButton_navigate_back');
                context.pop();
              },
            ),
          ),
        ],
        centerTitle: false,
        elevation: 0,
      ),
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            StreamBuilder<List<JadwalRecord>>(
              stream: queryJadwalRecord(),
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
                List<JadwalRecord> formTambahMateriJadwalRecordList =
                    snapshot.data!;
                return Container(
                  width: MediaQuery.of(context).size.width,
                  child: Form(
                    key: formKey,
                    autovalidateMode: AutovalidateMode.always,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
                          child: TextFormField(
                            controller: namaMateriController,
                            autofocus: true,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: 'Nama Materi',
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context)
                                      .tertiaryColor,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context)
                                      .tertiaryColor,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xFFC62828),
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xFFC62828),
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            style:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Inter',
                                      color: FlutterFlowTheme.of(context)
                                          .tertiaryColor,
                                    ),
                            validator: (val) {
                              if (val == null || val.isEmpty) {
                                return 'Tidak Boleh Kosong';
                              }

                              return null;
                            },
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
                          child: TextFormField(
                            controller: linkFieldController,
                            autofocus: true,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: 'Link Materi',
                              hintText: 'Masukan Link diawali http',
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context)
                                      .tertiaryColor,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context)
                                      .tertiaryColor,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xFFC62828),
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xFFC62828),
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            style:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Inter',
                                      color: Color(0xC001A8C9),
                                    ),
                            validator: (val) {
                              if (val == null || val.isEmpty) {
                                return 'Tidak Boleh Kosong';
                              }

                              return null;
                            },
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
                          child: FlutterFlowDropDown(
                            options: formTambahMateriJadwalRecordList
                                .map((e) => e.mk!)
                                .toList()
                                .toList(),
                            onChanged: (val) =>
                                setState(() => mkfieldValue = val),
                            width: MediaQuery.of(context).size.width,
                            height: 50,
                            textStyle:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Inter',
                                      color: FlutterFlowTheme.of(context)
                                          .tertiaryColor,
                                    ),
                            hintText: 'Pilih Mata Kuliah',
                            icon: FaIcon(
                              FontAwesomeIcons.caretDown,
                              color: FlutterFlowTheme.of(context).tertiaryColor,
                              size: 15,
                            ),
                            fillColor: Color(0x00111417),
                            elevation: 2,
                            borderColor:
                                FlutterFlowTheme.of(context).tertiaryColor,
                            borderWidth: 1,
                            borderRadius: 10,
                            margin:
                                EdgeInsetsDirectional.fromSTEB(12, 4, 12, 4),
                            hidesUnderline: true,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              logFirebaseEvent(
                                  'ADM_ADD_MATERI_PAGE_subMateri_ON_TAP');
                              logFirebaseEvent('subMateri_validate_form');
                              if (formKey.currentState == null ||
                                  !formKey.currentState!.validate()) {
                                return;
                              }

                              if (mkfieldValue == null) {
                                await showDialog(
                                  context: context,
                                  builder: (alertDialogContext) {
                                    return AlertDialog(
                                      title: Text('Kesalahan'),
                                      content:
                                          Text('Silahkan Pilih Mata Kuliah'),
                                      actions: [
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.pop(alertDialogContext),
                                          child: Text('Ok'),
                                        ),
                                      ],
                                    );
                                  },
                                );
                                return;
                              }

                              logFirebaseEvent('subMateri_backend_call');

                              final materiCreateData = createMateriRecordData(
                                nama: namaMateriController!.text,
                                link: linkFieldController!.text,
                                createdAt: getCurrentTimestamp,
                                mk: mkfieldValue,
                              );
                              await MateriRecord.collection
                                  .doc()
                                  .set(materiCreateData);
                              logFirebaseEvent('subMateri_navigate_back');
                              context.pop();
                            },
                            text: 'Simpan',
                            options: FFButtonOptions(
                              width: 130,
                              height: 50,
                              color: FlutterFlowTheme.of(context).tertiaryColor,
                              textStyle: FlutterFlowTheme.of(context)
                                  .subtitle2
                                  .override(
                                    fontFamily: 'Inter',
                                    color: FlutterFlowTheme.of(context).white,
                                  ),
                              borderSide: BorderSide(
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
