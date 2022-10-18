import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:text_search/text_search.dart';

class ListMKWidget extends StatefulWidget {
  const ListMKWidget({Key? key}) : super(key: key);

  @override
  _ListMKWidgetState createState() => _ListMKWidgetState();
}

class _ListMKWidgetState extends State<ListMKWidget>
    with TickerProviderStateMixin {
  final animationsMap = {
    'containerOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 400.ms,
          begin: 0,
          end: 1,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 400.ms,
          begin: Offset(0, 100),
          end: Offset(0, 0),
        ),
      ],
    ),
  };
  List<MateriRecord> simpleSearchResults = [];
  TextEditingController? pencarianController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'listMK'});
    pencarianController = TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    pencarianController?.dispose();
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
          borderColor: Colors.transparent,
          borderRadius: 30,
          borderWidth: 1,
          buttonSize: 60,
          icon: Icon(
            Icons.arrow_back_rounded,
            color: FlutterFlowTheme.of(context).tertiaryColor,
            size: 30,
          ),
          onPressed: () async {
            logFirebaseEvent('LIST_M_K_arrow_back_rounded_ICN_ON_TAP');
            logFirebaseEvent('IconButton_navigate_back');
            context.pop();
          },
        ),
        title: Text(
          'Semua Materi',
          style: FlutterFlowTheme.of(context).title3.override(
                fontFamily: 'Outfit',
                color: FlutterFlowTheme.of(context).tertiaryColor,
              ),
        ),
        actions: [],
        centerTitle: false,
        elevation: 4,
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16, 15, 16, 10),
                child: TextFormField(
                  controller: pencarianController,
                  onChanged: (_) => EasyDebounce.debounce(
                    'pencarianController',
                    Duration(milliseconds: 2000),
                    () async {
                      logFirebaseEvent(
                          'LIST_M_K_Pencarian_ON_TEXTFIELD_CHANGE');
                      logFirebaseEvent('Pencarian_simple_search');
                      await queryMateriRecordOnce()
                          .then(
                            (records) => simpleSearchResults = TextSearch(
                              records
                                  .map(
                                    (record) => TextSearchItem(
                                        record, [record.nama!, record.mk!]),
                                  )
                                  .toList(),
                            )
                                .search(pencarianController!.text)
                                .map((r) => r.object)
                                .toList(),
                          )
                          .onError((_, __) => simpleSearchResults = [])
                          .whenComplete(() => setState(() {}));
                    },
                  ),
                  autofocus: true,
                  obscureText: false,
                  decoration: InputDecoration(
                    labelText: 'Cari',
                    hintText: 'Mata Kuliah Yang Ingin Dicari',
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).tertiaryColor,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).tertiaryColor,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0x00000000),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0x00000000),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    prefixIcon: Icon(
                      Icons.search_outlined,
                      color: FlutterFlowTheme.of(context).secondaryText,
                    ),
                    suffixIcon: pencarianController!.text.isNotEmpty
                        ? InkWell(
                            onTap: () async {
                              pencarianController?.clear();
                              logFirebaseEvent(
                                  'LIST_M_K_Pencarian_ON_TEXTFIELD_CHANGE');
                              logFirebaseEvent('Pencarian_simple_search');
                              await queryMateriRecordOnce()
                                  .then(
                                    (records) => simpleSearchResults =
                                        TextSearch(
                                      records
                                          .map(
                                            (record) => TextSearchItem(record,
                                                [record.nama!, record.mk!]),
                                          )
                                          .toList(),
                                    )
                                            .search(pencarianController!.text)
                                            .map((r) => r.object)
                                            .toList(),
                                  )
                                  .onError((_, __) => simpleSearchResults = [])
                                  .whenComplete(() => setState(() {}));

                              setState(() {});
                            },
                            child: Icon(
                              Icons.clear,
                              color: FlutterFlowTheme.of(context).secondaryText,
                              size: 22,
                            ),
                          )
                        : null,
                  ),
                  style: FlutterFlowTheme.of(context).bodyText1.override(
                        fontFamily: 'Inter',
                        color: FlutterFlowTheme.of(context).tertiaryColor,
                      ),
                ),
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 1,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).tertiaryColor,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(0),
                      bottomRight: Radius.circular(0),
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(8, 30, 8, 0),
                    child: Builder(
                      builder: (context) {
                        final hasilMateri = simpleSearchResults.toList();
                        return ListView.builder(
                          padding: EdgeInsets.zero,
                          scrollDirection: Axis.vertical,
                          itemCount: hasilMateri.length,
                          itemBuilder: (context, hasilMateriIndex) {
                            final hasilMateriItem =
                                hasilMateri[hasilMateriIndex];
                            return Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(10, 0, 10, 10),
                              child: InkWell(
                                onTap: () async {
                                  logFirebaseEvent(
                                      'LIST_M_K_PAGE_Container_zplb63w1_ON_TAP');
                                  logFirebaseEvent('Container_launch_u_r_l');
                                  await launchURL(hasilMateriItem.link!);
                                },
                                child: Container(
                                  width: 100,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        8, 8, 8, 8),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Expanded(
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    hasilMateriItem.nama!,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .subtitle1
                                                        .override(
                                                          fontFamily: 'Outfit',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .tertiaryColor,
                                                        ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 4, 0, 0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(4,
                                                                      0, 0, 0),
                                                          child: Text(
                                                            hasilMateriItem.mk!,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyText2
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .tertiaryColor,
                                                                ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Card(
                                                clipBehavior:
                                                    Clip.antiAliasWithSaveLayer,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .tertiaryColor,
                                                child: FFButtonWidget(
                                                  onPressed: () {
                                                    print('Button pressed ...');
                                                  },
                                                  text: 'Buka',
                                                  options: FFButtonOptions(
                                                    width: 60,
                                                    height: 35,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .tertiaryColor,
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .subtitle2
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          color: Colors.white,
                                                          fontSize: 12,
                                                        ),
                                                    borderSide: BorderSide(
                                                      color: Colors.transparent,
                                                      width: 1,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ).animateOnPageLoad(animationsMap[
                                  'containerOnPageLoadAnimation']!),
                            );
                          },
                        );
                      },
                    ),
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
