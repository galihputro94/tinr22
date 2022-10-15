import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class GaleryWidget extends StatefulWidget {
  const GaleryWidget({Key? key}) : super(key: key);

  @override
  _GaleryWidgetState createState() => _GaleryWidgetState();
}

class _GaleryWidgetState extends State<GaleryWidget> {
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
      backgroundColor: FlutterFlowTheme.of(context).bg11,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).bg11,
        automaticallyImplyLeading: false,
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
              Html(
                data:
                    '<div data-mc-src=\"3947d6ec-1745-400c-8021-a6ad07c1c65a#instagram\"></div>\n        \n<script \n  src=\"https://cdn2.woxo.tech/a.js#634a123ed6de712ba995bd90\" \n  async data-usrc>\n</script>',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
