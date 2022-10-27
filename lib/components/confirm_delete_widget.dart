import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class ConfirmDeleteWidget extends StatefulWidget {
  const ConfirmDeleteWidget({
    Key? key,
    this.namaMateri,
    this.materiRef,
  }) : super(key: key);

  final String? namaMateri;
  final DocumentReference? materiRef;

  @override
  _ConfirmDeleteWidgetState createState() => _ConfirmDeleteWidgetState();
}

class _ConfirmDeleteWidgetState extends State<ConfirmDeleteWidget> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 280,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
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
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Yakin Ingin Menghapus',
              style: FlutterFlowTheme.of(context).bodyText1.override(
                    fontFamily: 'Inter',
                    fontSize: 16,
                  ),
            ),
            Text(
              '${widget.namaMateri}?',
              style: FlutterFlowTheme.of(context).bodyText1.override(
                    fontFamily: 'Inter',
                    fontSize: 16,
                  ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
              child: FFButtonWidget(
                onPressed: () async {
                  logFirebaseEvent('CONFIRM_DELETE_COMP_HAPUS_BTN_ON_TAP');
                  logFirebaseEvent('Button_backend_call');
                  await widget.materiRef!.delete();
                },
                text: 'Hapus',
                options: FFButtonOptions(
                  width: double.infinity,
                  height: 60,
                  color: Color(0xFFFF5963),
                  textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                        fontFamily: 'Lexend Deca',
                        color: FlutterFlowTheme.of(context).primaryText,
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
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
              child: FFButtonWidget(
                onPressed: () async {
                  logFirebaseEvent('CONFIRM_DELETE_COMP_BATAL_BTN_ON_TAP');
                  logFirebaseEvent('Button_close_dialog,_drawer,_etc');
                  Navigator.pop(context);
                },
                text: 'Batal',
                options: FFButtonOptions(
                  width: double.infinity,
                  height: 60,
                  color: FlutterFlowTheme.of(context).primaryColor,
                  textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                        fontFamily: 'Inter',
                        color: FlutterFlowTheme.of(context).primaryText,
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
