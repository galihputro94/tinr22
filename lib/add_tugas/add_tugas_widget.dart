import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class AddTugasWidget extends StatefulWidget {
  const AddTugasWidget({Key? key}) : super(key: key);

  @override
  _AddTugasWidgetState createState() => _AddTugasWidgetState();
}

class _AddTugasWidgetState extends State<AddTugasWidget> {
  DateTime? datePicked1;
  TextEditingController? deadlineController;
  DateTime? datePicked2;
  String? mkTugasValue;
  TextEditingController? namaTugasController;
  TextEditingController? linkFieldController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    deadlineController = TextEditingController(text: datePicked2?.toString());
    namaTugasController = TextEditingController();
    linkFieldController = TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    deadlineController?.dispose();
    namaTugasController?.dispose();
    linkFieldController?.dispose();
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
        title: Text(
          'Tambah Tugas',
          style: FlutterFlowTheme.of(context).title2.override(
                fontFamily: 'Overpass',
                color: Colors.white,
                fontSize: 22,
              ),
        ),
        actions: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 16, 0),
            child: FlutterFlowIconButton(
              borderColor: Colors.transparent,
              borderRadius: 30,
              borderWidth: 1,
              buttonSize: 48,
              icon: Icon(
                Icons.close,
                color: Colors.white,
                size: 30,
              ),
              onPressed: () {
                print('IconButton pressed ...');
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
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
                      child: TextFormField(
                        controller: namaTugasController,
                        autofocus: true,
                        obscureText: false,
                        decoration: InputDecoration(
                          labelText: 'Nama Tugas',
                          hintText: 'Nama Tugas...',
                          hintStyle:
                              FlutterFlowTheme.of(context).bodyText2.override(
                                    fontFamily: 'Overpass',
                                    color: FlutterFlowTheme.of(context).white,
                                  ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).white,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).white,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Overpass',
                              color: FlutterFlowTheme.of(context).white,
                            ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
                      child: FlutterFlowDropDown(
                        options: [
                          'Agama',
                          'Pancasila',
                          'Bahasa Inggris',
                          'Algo dan Pemrograman',
                          'Pengantar Sistem Digital',
                          'Fisika',
                          'DITI',
                          'Bahasa Indonesia',
                          'Kalkullus'
                        ],
                        onChanged: (val) => setState(() => mkTugasValue = val),
                        width: MediaQuery.of(context).size.width,
                        height: 50,
                        textStyle:
                            FlutterFlowTheme.of(context).bodyText1.override(
                                  fontFamily: 'Overpass',
                                  color: FlutterFlowTheme.of(context).white,
                                ),
                        hintText: 'Pilih Mata Kuliah',
                        fillColor:
                            FlutterFlowTheme.of(context).primaryBackground,
                        elevation: 2,
                        borderColor: FlutterFlowTheme.of(context).white,
                        borderWidth: 1,
                        borderRadius: 10,
                        margin: EdgeInsetsDirectional.fromSTEB(12, 4, 12, 4),
                        hidesUnderline: true,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
                      child: Container(
                        height: 50,
                        child: Stack(
                          children: [
                            TextFormField(
                              controller: deadlineController,
                              onFieldSubmitted: (_) async {
                                if (kIsWeb) {
                                  final _datePicked1Date = await showDatePicker(
                                    context: context,
                                    initialDate: getCurrentTimestamp,
                                    firstDate: getCurrentTimestamp,
                                    lastDate: DateTime(2050),
                                  );

                                  if (_datePicked1Date != null) {
                                    setState(
                                      () => datePicked1 = DateTime(
                                        _datePicked1Date.year,
                                        _datePicked1Date.month,
                                        _datePicked1Date.day,
                                      ),
                                    );
                                  }
                                } else {
                                  await DatePicker.showDatePicker(
                                    context,
                                    showTitleActions: true,
                                    onConfirm: (date) {
                                      setState(() => datePicked1 = date);
                                    },
                                    currentTime: getCurrentTimestamp,
                                    minTime: getCurrentTimestamp,
                                    locale: LocaleType.values.firstWhere(
                                      (l) =>
                                          l.name ==
                                          FFLocalizations.of(context)
                                              .languageCode,
                                      orElse: () => LocaleType.en,
                                    ),
                                  );
                                }
                              },
                              autofocus: true,
                              readOnly: true,
                              obscureText: false,
                              decoration: InputDecoration(
                                labelText: 'Deadline',
                                hintText: 'Deadline Tugas...',
                                hintStyle: FlutterFlowTheme.of(context)
                                    .bodyText2
                                    .override(
                                      fontFamily: 'Overpass',
                                      color: FlutterFlowTheme.of(context).white,
                                    ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).white,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).white,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Overpass',
                                    color: FlutterFlowTheme.of(context).white,
                                  ),
                              keyboardType: TextInputType.datetime,
                            ),
                            Align(
                              alignment: AlignmentDirectional(0.9, 0),
                              child: FlutterFlowIconButton(
                                borderColor: Colors.transparent,
                                borderRadius: 30,
                                borderWidth: 1,
                                buttonSize: 40,
                                icon: FaIcon(
                                  FontAwesomeIcons.calendar,
                                  color: FlutterFlowTheme.of(context).white,
                                  size: 20,
                                ),
                                onPressed: () async {
                                  if (kIsWeb) {
                                    final _datePicked2Date =
                                        await showDatePicker(
                                      context: context,
                                      initialDate: getCurrentTimestamp,
                                      firstDate: DateTime(1900),
                                      lastDate: DateTime(2050),
                                    );

                                    TimeOfDay? _datePicked2Time;
                                    if (_datePicked2Date != null) {
                                      _datePicked2Time = await showTimePicker(
                                        context: context,
                                        initialTime: TimeOfDay.fromDateTime(
                                            getCurrentTimestamp),
                                      );
                                    }

                                    if (_datePicked2Date != null &&
                                        _datePicked2Time != null) {
                                      setState(
                                        () => datePicked2 = DateTime(
                                          _datePicked2Date.year,
                                          _datePicked2Date.month,
                                          _datePicked2Date.day,
                                          _datePicked2Time!.hour,
                                          _datePicked2Time.minute,
                                        ),
                                      );
                                    }
                                  } else {
                                    await DatePicker.showDateTimePicker(
                                      context,
                                      showTitleActions: true,
                                      onConfirm: (date) {
                                        setState(() => datePicked2 = date);
                                      },
                                      currentTime: getCurrentTimestamp,
                                      minTime: DateTime(0, 0, 0),
                                      locale: LocaleType.values.firstWhere(
                                        (l) =>
                                            l.name ==
                                            FFLocalizations.of(context)
                                                .languageCode,
                                        orElse: () => LocaleType.en,
                                      ),
                                    );
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
                      child: TextFormField(
                        controller: linkFieldController,
                        autofocus: true,
                        obscureText: false,
                        decoration: InputDecoration(
                          labelText: 'Keterangan',
                          hintText: 'Masukan Keterangan Tugas...',
                          hintStyle:
                              FlutterFlowTheme.of(context).bodyText2.override(
                                    fontFamily: 'Overpass',
                                    color: FlutterFlowTheme.of(context).white,
                                  ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).white,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).white,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Overpass',
                              color: FlutterFlowTheme.of(context).white,
                            ),
                        maxLines: 8,
                        keyboardType: TextInputType.multiline,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          final tugasCreateData = createTugasRecordData(
                            namaTugas: namaTugasController!.text,
                            mkTugas: mkTugasValue,
                            ketTugas: linkFieldController!.text,
                            deadline: datePicked2,
                          );
                          await TugasRecord.collection
                              .doc()
                              .set(tugasCreateData);
                          context.pop();
                        },
                        text: 'Simpan',
                        options: FFButtonOptions(
                          width: 130,
                          height: 40,
                          color: FlutterFlowTheme.of(context).black600,
                          textStyle:
                              FlutterFlowTheme.of(context).subtitle2.override(
                                    fontFamily: 'Overpass',
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
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
