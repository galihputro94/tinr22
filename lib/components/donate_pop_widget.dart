import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class DonatePopWidget extends StatefulWidget {
  const DonatePopWidget({Key? key}) : super(key: key);

  @override
  _DonatePopWidgetState createState() => _DonatePopWidgetState();
}

class _DonatePopWidgetState extends State<DonatePopWidget> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryBackground,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/qr.png',
            width: 150,
            height: 150,
            fit: BoxFit.contain,
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
            child: FFButtonWidget(
              onPressed: () async {
                logFirebaseEvent('DONATE_POP_COMP_SAWERIA_BTN_ON_TAP');
                logFirebaseEvent('Button_launch_u_r_l');
                await launchURL('https://saweria.co/tinr22');
              },
              text: 'Saweria',
              icon: FaIcon(
                FontAwesomeIcons.handHoldingUsd,
                size: 15,
              ),
              options: FFButtonOptions(
                width: 130,
                height: 40,
                color: FlutterFlowTheme.of(context).tertiaryColor,
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
        ],
      ),
    );
  }
}
