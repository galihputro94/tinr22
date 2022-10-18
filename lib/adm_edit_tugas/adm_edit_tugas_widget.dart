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

class AdmEditTugasWidget extends StatefulWidget {
  const AdmEditTugasWidget({
    Key? key,
    this.editTugasRef,
    this.namaTugasEdit,
    this.mkTugasEdit,
    this.deadlineTugasEdit,
    this.ketTugasEdit,
  }) : super(key: key);

  final DocumentReference? editTugasRef;
  final String? namaTugasEdit;
  final String? mkTugasEdit;
  final DateTime? deadlineTugasEdit;
  final String? ketTugasEdit;

  @override
  _AdmEditTugasWidgetState createState() => _AdmEditTugasWidgetState();
}

class _AdmEditTugasWidgetState extends State<AdmEditTugasWidget> {
  DateTime? datePicked;
  String? mkTugasEditValue;
  TextEditingController? namaTugasEditController;
  TextEditingController? deadlineTugasEditController;
  TextEditingController? linkFieldController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    deadlineTugasEditController = TextEditingController(
        text: dateTimeFormat(
      'MMMEd',
      widget.deadlineTugasEdit,
      locale: FFLocalizations.of(context).languageCode,
    ));
    namaTugasEditController = TextEditingController(text: widget.namaTugasEdit);
    linkFieldController = TextEditingController(text: widget.ketTugasEdit);
    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'adm_editTugas'});
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    deadlineTugasEditController?.dispose();
    namaTugasEditController?.dispose();
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
        leading: FlutterFlowIconButton(
          borderRadius: 30,
          borderWidth: 1,
          buttonSize: 60,
          icon: Icon(
            Icons.arrow_back_rounded,
            color: FlutterFlowTheme.of(context).tertiaryColor,
            size: 30,
          ),
          showLoadingIndicator: true,
          onPressed: () async {
            logFirebaseEvent('ADM_EDIT_TUGAS_arrow_back_rounded_ICN_ON');
            logFirebaseEvent('IconButton_navigate_to');

            context.pushNamed('adm_ListTugas');
          },
        ),
        title: Text(
          'Edit Tugas',
          style: FlutterFlowTheme.of(context).title2.override(
                fontFamily: 'Outfit',
                color: FlutterFlowTheme.of(context).tertiaryColor,
                fontSize: 22,
                fontWeight: FontWeight.w600,
              ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 4,
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
                    child: TextFormField(
                      controller: namaTugasEditController,
                      autofocus: true,
                      obscureText: false,
                      decoration: InputDecoration(
                        labelText: 'Nama Tugas',
                        hintText: 'Nama Tugas...',
                        hintStyle:
                            FlutterFlowTheme.of(context).bodyText2.override(
                                  fontFamily: 'Inter',
                                  color: FlutterFlowTheme.of(context).white,
                                ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).tertiaryColor,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).tertiaryColor,
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
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'Inter',
                            color: FlutterFlowTheme.of(context).tertiaryColor,
                          ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
                    child: FlutterFlowDropDown(
                      initialOption: mkTugasEditValue ??= widget.mkTugasEdit,
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
                      onChanged: (val) =>
                          setState(() => mkTugasEditValue = val),
                      width: MediaQuery.of(context).size.width,
                      height: 50,
                      textStyle: FlutterFlowTheme.of(context)
                          .bodyText1
                          .override(
                            fontFamily: 'Inter',
                            color: FlutterFlowTheme.of(context).tertiaryColor,
                          ),
                      hintText: 'Pilih Mata Kuliah',
                      icon: FaIcon(
                        FontAwesomeIcons.caretDown,
                        color: FlutterFlowTheme.of(context).tertiaryColor,
                        size: 15,
                      ),
                      elevation: 2,
                      borderColor: FlutterFlowTheme.of(context).tertiaryColor,
                      borderWidth: 1,
                      borderRadius: 10,
                      margin: EdgeInsetsDirectional.fromSTEB(12, 4, 12, 4),
                      hidesUnderline: true,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
                    child: TextFormField(
                      controller: deadlineTugasEditController,
                      autofocus: true,
                      obscureText: false,
                      decoration: InputDecoration(
                        labelText: 'Deadline Tugas',
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).tertiaryColor,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).tertiaryColor,
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
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'Inter',
                            color: FlutterFlowTheme.of(context).tertiaryColor,
                          ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        logFirebaseEvent(
                            'ADM_EDIT_TUGAS_PAGE_deadlineEdit_ON_TAP');
                        logFirebaseEvent('deadlineEdit_date_time_picker');
                        if (kIsWeb) {
                          final _datePickedDate = await showDatePicker(
                            context: context,
                            initialDate: widget.deadlineTugasEdit!,
                            firstDate: DateTime(1900),
                            lastDate: DateTime(2050),
                          );

                          TimeOfDay? _datePickedTime;
                          if (_datePickedDate != null) {
                            _datePickedTime = await showTimePicker(
                              context: context,
                              initialTime: TimeOfDay.fromDateTime(
                                  widget.deadlineTugasEdit!),
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
                            currentTime: widget.deadlineTugasEdit!,
                            minTime: DateTime(0, 0, 0),
                            locale: LocaleType.values.firstWhere(
                              (l) =>
                                  l.name ==
                                  FFLocalizations.of(context).languageCode,
                              orElse: () => LocaleType.en,
                            ),
                          );
                        }
                      },
                      text: 'Ubah Deadline',
                      icon: FaIcon(
                        FontAwesomeIcons.calendar,
                        color: FlutterFlowTheme.of(context).tertiaryColor,
                        size: 20,
                      ),
                      options: FFButtonOptions(
                        width: double.infinity,
                        height: 50,
                        color: Color(0x00111417),
                        textStyle: FlutterFlowTheme.of(context)
                            .subtitle2
                            .override(
                              fontFamily: 'Inter',
                              color: FlutterFlowTheme.of(context).tertiaryColor,
                            ),
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).tertiaryColor,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(8),
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
                                  fontFamily: 'Inter',
                                  color: FlutterFlowTheme.of(context).white,
                                ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).tertiaryColor,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).tertiaryColor,
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
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'Inter',
                            color: FlutterFlowTheme.of(context).tertiaryColor,
                          ),
                      maxLines: 8,
                      keyboardType: TextInputType.multiline,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        logFirebaseEvent(
                            'ADM_EDIT_TUGAS_PAGE_subMateri_ON_TAP');
                        logFirebaseEvent('subMateri_backend_call');

                        final tugasUpdateData = createTugasRecordData(
                          namaTugas: widget.namaTugasEdit,
                          mkTugas: widget.mkTugasEdit,
                          deadline: datePicked,
                          ketTugas: linkFieldController!.text,
                          isActive: true,
                        );
                        await widget.editTugasRef!.update(tugasUpdateData);
                        logFirebaseEvent('subMateri_navigate_back');
                        context.pop();
                      },
                      text: 'Simpan',
                      options: FFButtonOptions(
                        width: 130,
                        height: 50,
                        color: FlutterFlowTheme.of(context).tertiaryColor,
                        textStyle:
                            FlutterFlowTheme.of(context).subtitle2.override(
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
            ],
          ),
        ),
      ),
    );
  }
}
