import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class AdmHapusTugasWidget extends StatefulWidget {
  const AdmHapusTugasWidget({
    Key? key,
    this.indexTgs,
  }) : super(key: key);

  final DocumentReference? indexTgs;

  @override
  _AdmHapusTugasWidgetState createState() => _AdmHapusTugasWidgetState();
}

class _AdmHapusTugasWidgetState extends State<AdmHapusTugasWidget> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 270,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryBackground,
        boxShadow: [
          BoxShadow(
            blurRadius: 5,
            color: Color(0x3B1D2429),
            offset: Offset(0, -3),
          )
        ],
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0),
          bottomRight: Radius.circular(0),
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
        shape: BoxShape.rectangle,
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
              child: FFButtonWidget(
                onPressed: () async {
                  logFirebaseEvent('ADM_HAPUS_TUGAS_HAPUS_TUGAS_BTN_ON_TAP');
                  logFirebaseEvent('Button_backend_call');
                  await widget.indexTgs!.delete();
                  logFirebaseEvent('Button_wait__delay');
                  await Future.delayed(const Duration(milliseconds: 1000));
                  logFirebaseEvent('Button_close_dialog,_drawer,_etc');
                  Navigator.pop(context);
                },
                text: 'Hapus Tugas',
                options: FFButtonOptions(
                  width: double.infinity,
                  height: 60,
                  color: Color(0xFFFF3232),
                  textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                        fontFamily: 'Inter',
                        color: FlutterFlowTheme.of(context).white,
                      ),
                  borderSide: BorderSide(
                    color: Colors.transparent,
                    width: 1,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
              child: FFButtonWidget(
                onPressed: () async {
                  logFirebaseEvent('ADM_HAPUS_TUGAS_COMP_BATAL_BTN_ON_TAP');
                  logFirebaseEvent('Button_close_dialog,_drawer,_etc');
                  Navigator.pop(context);
                },
                text: 'Batal',
                options: FFButtonOptions(
                  width: double.infinity,
                  height: 60,
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                        fontFamily: 'Lexend Deca',
                        color: FlutterFlowTheme.of(context).secondaryText,
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                      ),
                  borderSide: BorderSide(
                    color: Colors.transparent,
                    width: 1,
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
