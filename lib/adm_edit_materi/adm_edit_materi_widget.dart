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

class AdmEditMateriWidget extends StatefulWidget {
  const AdmEditMateriWidget({
    Key? key,
    this.namaMateriEdit,
    this.namaLinkEdit,
    this.mkMateriEdit,
    this.editMateriRef,
  }) : super(key: key);

  final String? namaMateriEdit;
  final String? namaLinkEdit;
  final String? mkMateriEdit;
  final DocumentReference? editMateriRef;

  @override
  _AdmEditMateriWidgetState createState() => _AdmEditMateriWidgetState();
}

class _AdmEditMateriWidgetState extends State<AdmEditMateriWidget> {
  String? mkMateriEditValue;
  TextEditingController? namaLinkEditController;
  TextEditingController? namaMateriEditController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    namaLinkEditController = TextEditingController(text: widget.namaLinkEdit);
    namaMateriEditController =
        TextEditingController(text: widget.namaMateriEdit);
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    namaLinkEditController?.dispose();
    namaMateriEditController?.dispose();
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
        leading: FlutterFlowIconButton(
          borderColor: FlutterFlowTheme.of(context).darkBG,
          borderRadius: 30,
          borderWidth: 1,
          buttonSize: 60,
          fillColor: FlutterFlowTheme.of(context).darkBG,
          icon: Icon(
            Icons.arrow_back_rounded,
            color: FlutterFlowTheme.of(context).white,
            size: 30,
          ),
          onPressed: () async {
            context.pushNamed('adm_ListMateri');
          },
        ),
        title: Text(
          'Edit Materi',
          style: FlutterFlowTheme.of(context).title2.override(
                fontFamily: 'Outfit',
                color: FlutterFlowTheme.of(context).white,
                fontSize: 22,
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
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
                child: TextFormField(
                  controller: namaMateriEditController,
                  autofocus: true,
                  obscureText: false,
                  decoration: InputDecoration(
                    labelText: 'Nama Materi',
                    hintText: 'Nama Materi...',
                    hintStyle: FlutterFlowTheme.of(context).bodyText2.override(
                          fontFamily: 'Inter',
                          color: FlutterFlowTheme.of(context).white,
                        ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).secondaryColor,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).secondaryColor,
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
                  style: FlutterFlowTheme.of(context).bodyText1.override(
                        fontFamily: 'Inter',
                        color: FlutterFlowTheme.of(context).white,
                      ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
                child: TextFormField(
                  controller: namaLinkEditController,
                  autofocus: true,
                  obscureText: false,
                  decoration: InputDecoration(
                    labelText: 'Link Materi',
                    hintText: 'Masukan Link diawali http',
                    hintStyle: FlutterFlowTheme.of(context).bodyText2.override(
                          fontFamily: 'Inter',
                          color: FlutterFlowTheme.of(context).white,
                        ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).secondaryColor,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).secondaryColor,
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
                  style: FlutterFlowTheme.of(context).bodyText1.override(
                        fontFamily: 'Inter',
                        color: FlutterFlowTheme.of(context).white,
                      ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
                child: FlutterFlowDropDown(
                  initialOption: mkMateriEditValue ??= widget.mkMateriEdit,
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
                  onChanged: (val) => setState(() => mkMateriEditValue = val),
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  textStyle: FlutterFlowTheme.of(context).bodyText1.override(
                        fontFamily: 'Inter',
                        color: FlutterFlowTheme.of(context).white,
                      ),
                  hintText: 'Pilih Mata Kuliah',
                  icon: FaIcon(
                    FontAwesomeIcons.caretDown,
                    color: FlutterFlowTheme.of(context).white,
                    size: 15,
                  ),
                  fillColor: FlutterFlowTheme.of(context).darkBG,
                  elevation: 2,
                  borderColor: FlutterFlowTheme.of(context).secondaryColor,
                  borderWidth: 1,
                  borderRadius: 10,
                  margin: EdgeInsetsDirectional.fromSTEB(12, 4, 12, 4),
                  hidesUnderline: true,
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                child: FFButtonWidget(
                  onPressed: () async {
                    final materiUpdateData = createMateriRecordData(
                      nama: namaMateriEditController!.text,
                      link: namaLinkEditController!.text,
                      mk: mkMateriEditValue,
                    );
                    await widget.editMateriRef!.update(materiUpdateData);
                    context.pop();
                  },
                  text: 'Simpan',
                  options: FFButtonOptions(
                    width: 130,
                    height: 50,
                    color: Color(0xFFFFF176),
                    textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                          fontFamily: 'Inter',
                          color: FlutterFlowTheme.of(context).darkBG,
                        ),
                    borderSide: BorderSide(
                      color: Color(0xFFFFF176),
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(8),
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
