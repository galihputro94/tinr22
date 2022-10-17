import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/random_data_util.dart' as random_data;
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
  DateTime? datePicked;
  String? mkTugasValue;
  TextEditingController? namaTugasController;
  TextEditingController? linkFieldController;
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    linkFieldController = TextEditingController();
    namaTugasController = TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    linkFieldController?.dispose();
    namaTugasController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFF01A8C9),
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).darkBG,
        automaticallyImplyLeading: false,
        title: Text(
          'Tambah Tugas',
          style: FlutterFlowTheme.of(context).title2.override(
                fontFamily: 'Outfit',
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
              onPressed: () async {
                context.pushNamed('adm_ListTugas');
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
                StreamBuilder<List<JadwalRecord>>(
                  stream: queryJadwalRecord(
                    singleRecord: true,
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
                    List<JadwalRecord> formTambahTugasJadwalRecordList =
                        snapshot.data!;
                    final formTambahTugasJadwalRecord =
                        formTambahTugasJadwalRecordList.isNotEmpty
                            ? formTambahTugasJadwalRecordList.first
                            : null;
                    return Form(
                      key: formKey,
                      autovalidateMode: AutovalidateMode.disabled,
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
                            child: TextFormField(
                              controller: namaTugasController,
                              autofocus: true,
                              obscureText: false,
                              decoration: InputDecoration(
                                labelText: 'Nama Tugas',
                                hintText: 'Nama Tugas...',
                                hintStyle: FlutterFlowTheme.of(context)
                                    .bodyText2
                                    .override(
                                      fontFamily: 'Inter',
                                      color: FlutterFlowTheme.of(context).white,
                                    ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryColor,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryColor,
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
                                filled: true,
                                fillColor: FlutterFlowTheme.of(context).darkBG,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Inter',
                                    color: FlutterFlowTheme.of(context).white,
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
                            child: StreamBuilder<List<JadwalRecord>>(
                              stream: queryJadwalRecord(),
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
                                List<JadwalRecord> mkTugasJadwalRecordList =
                                    snapshot.data!;
                                return FlutterFlowDropDown(
                                  options: mkTugasJadwalRecordList
                                      .map((e) => e.mk!)
                                      .toList()
                                      .toList(),
                                  onChanged: (val) =>
                                      setState(() => mkTugasValue = val),
                                  width: MediaQuery.of(context).size.width,
                                  height: 50,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Inter',
                                        color:
                                            FlutterFlowTheme.of(context).white,
                                      ),
                                  hintText: 'Pilih Mata Kuliah',
                                  fillColor:
                                      FlutterFlowTheme.of(context).darkBG,
                                  elevation: 2,
                                  borderColor: FlutterFlowTheme.of(context)
                                      .secondaryColor,
                                  borderWidth: 1,
                                  borderRadius: 10,
                                  margin: EdgeInsetsDirectional.fromSTEB(
                                      12, 4, 12, 4),
                                  hidesUnderline: true,
                                );
                              },
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
                            child: FFButtonWidget(
                              onPressed: () async {
                                if (kIsWeb) {
                                  final _datePickedDate = await showDatePicker(
                                    context: context,
                                    initialDate: getCurrentTimestamp,
                                    firstDate: DateTime(1900),
                                    lastDate: DateTime(2050),
                                  );

                                  TimeOfDay? _datePickedTime;
                                  if (_datePickedDate != null) {
                                    _datePickedTime = await showTimePicker(
                                      context: context,
                                      initialTime: TimeOfDay.fromDateTime(
                                          getCurrentTimestamp),
                                    );
                                  }

                                  if (_datePickedDate != null &&
                                      _datePickedTime != null) {
                                    setState(
                                      () => datePicked = DateTime(
                                        _datePickedDate.year,
                                        _datePickedDate.month,
                                        _datePickedDate.day,
                                        _datePickedTime!.hour,
                                        _datePickedTime.minute,
                                      ),
                                    );
                                  }
                                } else {
                                  await DatePicker.showDateTimePicker(
                                    context,
                                    showTitleActions: true,
                                    onConfirm: (date) {
                                      setState(() => datePicked = date);
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
                              text: 'Deadline Tugas',
                              icon: FaIcon(
                                FontAwesomeIcons.calendar,
                                size: 20,
                              ),
                              options: FFButtonOptions(
                                width: double.infinity,
                                height: 50,
                                color: FlutterFlowTheme.of(context).darkBG,
                                textStyle: FlutterFlowTheme.of(context)
                                    .subtitle2
                                    .override(
                                      fontFamily: 'Inter',
                                      color: Colors.white,
                                    ),
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryColor,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
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
                                labelText: 'Keterangan',
                                hintText: 'Masukan Keterangan Tugas...',
                                hintStyle: FlutterFlowTheme.of(context)
                                    .bodyText2
                                    .override(
                                      fontFamily: 'Inter',
                                      color: FlutterFlowTheme.of(context).white,
                                    ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryColor,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryColor,
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
                                filled: true,
                                fillColor: FlutterFlowTheme.of(context).darkBG,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Inter',
                                    color: FlutterFlowTheme.of(context).white,
                                  ),
                              maxLines: 8,
                              keyboardType: TextInputType.multiline,
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
                                EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                            child: FFButtonWidget(
                              onPressed: () async {
                                if (formKey.currentState == null ||
                                    !formKey.currentState!.validate()) {
                                  return;
                                }

                                final tugasCreateData = createTugasRecordData(
                                  namaTugas: namaTugasController!.text,
                                  mkTugas: mkTugasValue,
                                  ketTugas: linkFieldController!.text,
                                  isActive: true,
                                  deadline: datePicked,
                                  indexTugas:
                                      random_data.randomInteger(1, 9645534),
                                  jadwalref:
                                      formTambahTugasJadwalRecord!.reference,
                                );
                                await TugasRecord.collection
                                    .doc()
                                    .set(tugasCreateData);
                                context.pop();
                              },
                              text: 'Simpan',
                              options: FFButtonOptions(
                                width: 130,
                                height: 50,
                                color:
                                    FlutterFlowTheme.of(context).secondaryColor,
                                textStyle: FlutterFlowTheme.of(context)
                                    .subtitle2
                                    .override(
                                      fontFamily: 'Inter',
                                      color:
                                          FlutterFlowTheme.of(context).darkBG,
                                    ),
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryColor,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
