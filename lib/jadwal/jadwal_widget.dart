import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_calendar.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class JadwalWidget extends StatefulWidget {
  const JadwalWidget({Key? key}) : super(key: key);

  @override
  _JadwalWidgetState createState() => _JadwalWidgetState();
}

class _JadwalWidgetState extends State<JadwalWidget>
    with TickerProviderStateMixin {
  final animationsMap = {
    'containerOnActionTriggerAnimation': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: true,
      effects: [
        ScaleEffect(
          curve: Curves.easeInOut,
          delay: 270.ms,
          duration: 600.ms,
          begin: 2,
          end: 1,
        ),
      ],
    ),
    'textOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1.ms),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 400.ms,
          begin: Offset(70, 0),
          end: Offset(0, 0),
        ),
      ],
    ),
    'textOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 200.ms),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 200.ms,
          duration: 400.ms,
          begin: Offset(70, 0),
          end: Offset(0, 0),
        ),
      ],
    ),
    'textOnPageLoadAnimation3': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 400.ms),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 400.ms,
          duration: 400.ms,
          begin: Offset(70, 0),
          end: Offset(0, 0),
        ),
      ],
    ),
  };
  DateTimeRange? calScheduleSelectedDay;
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

    calScheduleSelectedDay = DateTimeRange(
      start: DateTime.now().startOfDay,
      end: DateTime.now().endOfDay,
    );
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
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
          buttonSize: 46,
          icon: Icon(
            Icons.arrow_back_rounded,
            color: FlutterFlowTheme.of(context).tertiaryColor,
            size: 24,
          ),
          onPressed: () async {
            context.pop();
          },
        ),
        title: Text(
          'Jadwal Kuliah',
          style: FlutterFlowTheme.of(context).subtitle2.override(
                fontFamily: 'Inter',
                color: FlutterFlowTheme.of(context).tertiaryColor,
                fontSize: 18,
              ),
        ),
        actions: [],
        centerTitle: false,
        elevation: 0,
      ),
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Card(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              color: FlutterFlowTheme.of(context).primaryBackground,
              elevation: 0,
              child: FlutterFlowCalendar(
                color: FlutterFlowTheme.of(context).tertiaryColor,
                iconColor: FlutterFlowTheme.of(context).tertiaryColor,
                weekFormat: true,
                weekStartsMonday: true,
                onChange: (DateTimeRange? newSelectedDate) {
                  setState(() => calScheduleSelectedDay = newSelectedDate);
                },
                titleStyle: TextStyle(
                  color: FlutterFlowTheme.of(context).tertiaryColor,
                ),
                dayOfWeekStyle: TextStyle(
                  color: FlutterFlowTheme.of(context).tertiaryColor,
                ),
                dateStyle: TextStyle(
                  color: FlutterFlowTheme.of(context).tertiaryColor,
                ),
                selectedDateStyle: TextStyle(
                  color: FlutterFlowTheme.of(context).white,
                ),
                inactiveDateStyle: TextStyle(),
                locale: FFLocalizations.of(context).languageCode,
              ),
            ),
            Container(
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
                padding: EdgeInsetsDirectional.fromSTEB(20, 30, 20, 0),
                child: StreamBuilder<List<JadwalRecord>>(
                  stream: queryJadwalRecord(
                    queryBuilder: (jadwalRecord) => jadwalRecord
                        .where('hari',
                            isEqualTo: dateTimeFormat(
                              'EEEE',
                              calScheduleSelectedDay?.start,
                              locale: FFLocalizations.of(context).languageCode,
                            ))
                        .orderBy('index'),
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
                    List<JadwalRecord> listViewJadwalRecordList =
                        snapshot.data!;
                    return ListView.builder(
                      padding: EdgeInsets.zero,
                      scrollDirection: Axis.vertical,
                      itemCount: listViewJadwalRecordList.length,
                      itemBuilder: (context, listViewIndex) {
                        final listViewJadwalRecord =
                            listViewJadwalRecordList[listViewIndex];
                        return Row(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                              child: Container(
                                width: 16,
                                height: 62,
                                decoration: BoxDecoration(),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 16,
                                      height: 16,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        shape: BoxShape.circle,
                                      ),
                                    ).animateOnActionTrigger(
                                      animationsMap[
                                          'containerOnActionTriggerAnimation']!,
                                    ),
                                    Container(
                                      width: 2,
                                      height: 70,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 0, 5),
                                        child: Text(
                                          valueOrDefault<String>(
                                            listViewJadwalRecord.mk,
                                            'Libur !',
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1
                                              .override(
                                                fontFamily: 'Inter',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryColor,
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                              ),
                                        ).animateOnPageLoad(animationsMap[
                                            'textOnPageLoadAnimation1']!),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        valueOrDefault<String>(
                                          listViewJadwalRecord.jam,
                                          'Jadwal Kosong',
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily: 'Inter',
                                              color: Color(0xCDFFFFFF),
                                            ),
                                      ).animateOnPageLoad(animationsMap[
                                          'textOnPageLoadAnimation2']!),
                                    ],
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 0, 5),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 5, 0, 0),
                                          child: Text(
                                            valueOrDefault<String>(
                                              listViewJadwalRecord.ruang,
                                              'Jadwal Kosong',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1
                                                .override(
                                                  fontFamily: 'Inter',
                                                  color: Color(0xCDFFFFFF),
                                                ),
                                          ).animateOnPageLoad(animationsMap[
                                              'textOnPageLoadAnimation3']!),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Divider(
                                    height: 1,
                                    thickness: 1,
                                    endIndent: 10,
                                    color: FlutterFlowTheme.of(context).white,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
