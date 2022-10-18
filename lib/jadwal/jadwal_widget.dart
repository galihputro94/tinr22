import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_calendar.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class JadwalWidget extends StatefulWidget {
  const JadwalWidget({Key? key}) : super(key: key);

  @override
  _JadwalWidgetState createState() => _JadwalWidgetState();
}

class _JadwalWidgetState extends State<JadwalWidget> {
  DateTimeRange? calScheduleSelectedDay;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    calScheduleSelectedDay = DateTimeRange(
      start: DateTime.now().startOfDay,
      end: DateTime.now().endOfDay,
    );
    logFirebaseEvent('screen_view', parameters: {'screen_name': 'jadwal'});
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
            logFirebaseEvent('JADWAL_arrow_back_rounded_ICN_ON_TAP');
            logFirebaseEvent('IconButton_navigate_back');
            context.pop();
          },
        ),
        title: Text(
          'Jadwal Kuliah',
          style: FlutterFlowTheme.of(context).subtitle2.override(
                fontFamily: 'Inter',
                color: FlutterFlowTheme.of(context).tertiaryColor,
                fontSize: 18,
                fontWeight: FontWeight.bold,
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
                  fontWeight: FontWeight.bold,
                ),
                dayOfWeekStyle: TextStyle(
                  color: FlutterFlowTheme.of(context).tertiaryColor,
                  fontWeight: FontWeight.bold,
                ),
                dateStyle: TextStyle(
                  color: FlutterFlowTheme.of(context).tertiaryColor,
                  fontWeight: FontWeight.bold,
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
                padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 100,
                            height: 16,
                            decoration: BoxDecoration(
                              color:
                                  FlutterFlowTheme.of(context).secondaryColor,
                              borderRadius: BorderRadius.circular(30),
                              shape: BoxShape.rectangle,
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      18, 0, 0, 0),
                                  child: Text(
                                    'Jadwal Kelas',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Poppins',
                                          color: Colors.black,
                                          fontSize: 10,
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 16,
                            decoration: BoxDecoration(
                              color:
                                  FlutterFlowTheme.of(context).secondaryColor,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(5, 1, 5, 1),
                              child: Text(
                                dateTimeFormat(
                                  'MMMMEEEEd',
                                  calScheduleSelectedDay!.start,
                                  locale:
                                      FFLocalizations.of(context).languageCode,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Poppins',
                                      color:
                                          FlutterFlowTheme.of(context).darkBG,
                                      fontSize: 10,
                                    ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                      child: StreamBuilder<List<JadwalRecord>>(
                        stream: queryJadwalRecord(
                          queryBuilder: (jadwalRecord) => jadwalRecord
                              .where('hari',
                                  isEqualTo: dateTimeFormat(
                                    'EEEE',
                                    calScheduleSelectedDay?.start,
                                    locale: FFLocalizations.of(context)
                                        .languageCode,
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
                            shrinkWrap: true,
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
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 10, 0),
                                    child: Container(
                                      width: 16,
                                      height: 70,
                                      decoration: BoxDecoration(),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            width: 2,
                                            height: 60,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .white,
                                            ),
                                          ),
                                          Container(
                                            width: 16,
                                            height: 16,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .white,
                                              shape: BoxShape.circle,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.8,
                                    height: 70,
                                    decoration: BoxDecoration(),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 0, 1),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 10, 0, 0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 7, 5, 0),
                                                  child: Icon(
                                                    Icons.watch_later,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .white,
                                                    size: 16,
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 7, 0, 0),
                                                  child: Text(
                                                    valueOrDefault<String>(
                                                      listViewJadwalRecord.jam,
                                                      'Jadwal Kosong',
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color:
                                                              Color(0xCDFFFFFF),
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 0, 5, 0),
                                                child: Icon(
                                                  Icons.location_on,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .white,
                                                  size: 16,
                                                ),
                                              ),
                                              Text(
                                                valueOrDefault<String>(
                                                  listViewJadwalRecord.ruang,
                                                  'Jadwal Kosong',
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color:
                                                              Color(0xCDFFFFFF),
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                              ),
                                            ],
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 4, 0, 0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 0, 5, 0),
                                                  child: Icon(
                                                    Icons.ballot,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryColor,
                                                    size: 16,
                                                  ),
                                                ),
                                                Text(
                                                  valueOrDefault<String>(
                                                    listViewJadwalRecord.mk,
                                                    'Libur !',
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryColor,
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
