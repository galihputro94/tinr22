import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../backend/firebase_storage/storage.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/upload_media.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class MKFisikaWidget extends StatefulWidget {
  const MKFisikaWidget({Key? key}) : super(key: key);

  @override
  _MKFisikaWidgetState createState() => _MKFisikaWidgetState();
}

class _MKFisikaWidgetState extends State<MKFisikaWidget> {
  bool isMediaUploading = false;
  String uploadedFileUrl = '';

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    logFirebaseEvent('screen_view', parameters: {'screen_name': 'MKFisika'});
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFF01A8C9),
      appBar: AppBar(
        backgroundColor: Color(0xFF01A8C9),
        automaticallyImplyLeading: false,
        leading: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30,
          borderWidth: 1,
          buttonSize: 60,
          icon: Icon(
            Icons.arrow_back_rounded,
            color: FlutterFlowTheme.of(context).darkBG,
            size: 30,
          ),
          onPressed: () async {
            logFirebaseEvent('M_K_FISIKA_arrow_back_rounded_ICN_ON_TAP');
            logFirebaseEvent('IconButton_navigate_to');

            context.pushNamed('home');

            logFirebaseEvent('IconButton_navigate_to');

            context.pushNamed('home');
          },
        ),
        title: Text(
          'Fisika',
          style: FlutterFlowTheme.of(context).title2.override(
                fontFamily: 'Outfit',
                color: FlutterFlowTheme.of(context).darkBG,
                fontSize: 18,
              ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 4,
      ),
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 5),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 150,
                decoration: BoxDecoration(
                  color: Color(0xFF01A8C9),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                    topLeft: Radius.circular(0),
                    topRight: Radius.circular(0),
                  ),
                  border: Border.all(
                    color: Color(0xFF01A8C9),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          color: Color(0xFFDBE2E7),
                          shape: BoxShape.circle,
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(2, 2, 2, 2),
                          child: AuthUserStreamWidget(
                            child: InkWell(
                              onTap: () async {
                                logFirebaseEvent(
                                    'M_K_FISIKA_CircleImage_jsrdwdkc_ON_TAP');
                                logFirebaseEvent(
                                    'CircleImage_upload_photo_video');
                                final selectedMedia = await selectMedia(
                                  mediaSource: MediaSource.photoGallery,
                                  multiImage: false,
                                );
                                if (selectedMedia != null &&
                                    selectedMedia.every((m) =>
                                        validateFileFormat(
                                            m.storagePath, context))) {
                                  setState(() => isMediaUploading = true);
                                  var downloadUrls = <String>[];
                                  try {
                                    showUploadMessage(
                                      context,
                                      'Mengunggah Berkas...',
                                      showLoading: true,
                                    );
                                    downloadUrls = (await Future.wait(
                                      selectedMedia.map(
                                        (m) async => await uploadData(
                                            m.storagePath, m.bytes),
                                      ),
                                    ))
                                        .where((u) => u != null)
                                        .map((u) => u!)
                                        .toList();
                                  } finally {
                                    ScaffoldMessenger.of(context)
                                        .hideCurrentSnackBar();
                                    isMediaUploading = false;
                                  }
                                  if (downloadUrls.length ==
                                      selectedMedia.length) {
                                    setState(() =>
                                        uploadedFileUrl = downloadUrls.first);
                                    showUploadMessage(context, 'Berhasil!');
                                  } else {
                                    setState(() {});
                                    showUploadMessage(
                                        context, 'Gagal mengunggah media');
                                    return;
                                  }
                                }
                              },
                              child: Container(
                                width: 90,
                                height: 90,
                                clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                ),
                                child: Image.asset(
                                  'assets/images/00000000000000000000000000000000.png',
                                  fit: BoxFit.fitWidth,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                        child: Text(
                          'Dosen Pembimbing\nFirdaus, S.Pd',
                          textAlign: TextAlign.center,
                          style: FlutterFlowTheme.of(context).title3.override(
                                fontFamily: 'Outfit',
                                color: FlutterFlowTheme.of(context).white,
                                fontSize: 25,
                                fontWeight: FontWeight.w500,
                              ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Divider(
              height: 5,
              thickness: 5,
              indent: 5,
              endIndent: 5,
              color: FlutterFlowTheme.of(context).white,
            ),
            StreamBuilder<List<MateriRecord>>(
              stream: queryMateriRecord(
                queryBuilder: (materiRecord) =>
                    materiRecord.where('mk', isEqualTo: 'Fisika'),
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
                List<MateriRecord> listViewMateriRecordList = snapshot.data!;
                return ListView.builder(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: listViewMateriRecordList.length,
                  itemBuilder: (context, listViewIndex) {
                    final listViewMateriRecord =
                        listViewMateriRecordList[listViewIndex];
                    return Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(10, 4, 10, 5),
                      child: InkWell(
                        onTap: () async {
                          logFirebaseEvent(
                              'M_K_FISIKA_Container_6ijkykia_ON_TAP');
                          logFirebaseEvent('Container_launch_u_r_l');
                          await launchURL(listViewMateriRecord.link!);
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 50,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).white,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color:
                                  FlutterFlowTheme.of(context).secondaryColor,
                            ),
                          ),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 12, 0, 0),
                                    child: Text(
                                      listViewMateriRecord.nama!,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Inter',
                                            color: FlutterFlowTheme.of(context)
                                                .darkBG,
                                            fontSize: 18,
                                          ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 2),
                                  child: FlutterFlowIconButton(
                                    borderColor: Colors.transparent,
                                    borderRadius: 30,
                                    borderWidth: 1,
                                    buttonSize: 60,
                                    icon: Icon(
                                      Icons.book,
                                      color:
                                          FlutterFlowTheme.of(context).darkBG,
                                      size: 30,
                                    ),
                                    onPressed: () {
                                      print('IconButton pressed ...');
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
