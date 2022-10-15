import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../backend/firebase_storage/storage.dart';
import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/upload_media.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class CompletProfileWidget extends StatefulWidget {
  const CompletProfileWidget({Key? key}) : super(key: key);

  @override
  _CompletProfileWidgetState createState() => _CompletProfileWidgetState();
}

class _CompletProfileWidgetState extends State<CompletProfileWidget> {
  bool isMediaUploading = false;
  String uploadedFileUrl = '';

  TextEditingController? yourNameController;
  TextEditingController? phoneNumberController;
  String? dropDownValue;
  TextEditingController? domisiliController;
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    domisiliController = TextEditingController();
    phoneNumberController = TextEditingController(text: '62');
    yourNameController = TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    domisiliController?.dispose();
    phoneNumberController?.dispose();
    yourNameController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).bg11,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).bg11,
        automaticallyImplyLeading: false,
        leading: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30,
          borderWidth: 1,
          buttonSize: 60,
          icon: Icon(
            Icons.arrow_back_rounded,
            color: FlutterFlowTheme.of(context).primaryText,
            size: 30,
          ),
          onPressed: () async {
            context.pushNamed('home');

            context.pushNamed('home');
          },
        ),
        title: Text(
          'Lengkapi Profile',
          style: FlutterFlowTheme.of(context).title2.override(
                fontFamily: 'Outfit',
                color: FlutterFlowTheme.of(context).primaryText,
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
          child: Form(
            key: formKey,
            autovalidateMode: AutovalidateMode.always,
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).primaryText,
                            shape: BoxShape.circle,
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(2, 2, 2, 2),
                            child: InkWell(
                              onTap: () async {
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
                                child: CachedNetworkImage(
                                  imageUrl: valueOrDefault<String>(
                                    uploadedFileUrl,
                                    'https://www.gravatar.com/avatar/00000000000000000000000000000000?d=mp&f=y',
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                    child: Text(
                      'Tap foto untuk menggunggah ',
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'Inter',
                            color: FlutterFlowTheme.of(context).primaryText,
                          ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 16),
                    child: TextFormField(
                      controller: yourNameController,
                      obscureText: false,
                      decoration: InputDecoration(
                        labelText: 'Nama Lengkap...',
                        labelStyle: FlutterFlowTheme.of(context)
                            .bodyText2
                            .override(
                              fontFamily: 'Inter',
                              color: FlutterFlowTheme.of(context).primaryText,
                            ),
                        hintStyle: FlutterFlowTheme.of(context)
                            .bodyText2
                            .override(
                              fontFamily: 'Inter',
                              color: FlutterFlowTheme.of(context).primaryText,
                            ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).lineColor,
                            width: 3,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).lineColor,
                            width: 3,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFFC62828),
                            width: 3,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFFC62828),
                            width: 3,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        contentPadding:
                            EdgeInsetsDirectional.fromSTEB(20, 24, 0, 24),
                      ),
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'Inter',
                            color: FlutterFlowTheme.of(context).primaryColor,
                          ),
                      validator: (val) {
                        if (val == null || val.isEmpty) {
                          return 'Nama Wajib Diisi';
                        }

                        if (val.length < 2) {
                          return 'minimal 4 karakter';
                        }

                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 5),
                    child: TextFormField(
                      controller: phoneNumberController,
                      obscureText: false,
                      decoration: InputDecoration(
                        labelText: 'Nomor Telepon',
                        labelStyle: FlutterFlowTheme.of(context)
                            .bodyText2
                            .override(
                              fontFamily: 'Inter',
                              color: FlutterFlowTheme.of(context).primaryText,
                            ),
                        hintStyle: FlutterFlowTheme.of(context)
                            .bodyText2
                            .override(
                              fontFamily: 'Inter',
                              color: FlutterFlowTheme.of(context).primaryText,
                            ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).lineColor,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).lineColor,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFFC62828),
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFFC62828),
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        contentPadding:
                            EdgeInsetsDirectional.fromSTEB(20, 24, 0, 24),
                      ),
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'Inter',
                            color: FlutterFlowTheme.of(context).white,
                          ),
                      validator: (val) {
                        if (val == null || val.isEmpty) {
                          return 'Nomor Telepon Wajib Diisi';
                        }

                        if (val.length < 4) {
                          return 'Minimal 4 karakter';
                        }

                        if (!RegExp(r"^(\+62|62|0)8[1-9][0-9]{4,10}$")
                            .hasMatch(val)) {
                          return 'Harus Diawali Dengan 62';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 11),
                          child: Text(
                            'Nomor Telepon Harus diawali dengan 62xxx',
                            style:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Inter',
                                      fontSize: 12,
                                    ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 16),
                    child: FlutterFlowDropDown(
                      options: ['Pria', 'Wanita'],
                      onChanged: (val) => setState(() => dropDownValue = val),
                      width: MediaQuery.of(context).size.width,
                      height: 55,
                      textStyle:
                          FlutterFlowTheme.of(context).bodyText1.override(
                                fontFamily: 'Inter',
                                color: FlutterFlowTheme.of(context).white,
                              ),
                      hintText: 'Jenis Kelamin',
                      icon: FaIcon(
                        FontAwesomeIcons.caretDown,
                        color: FlutterFlowTheme.of(context).lineColor,
                        size: 15,
                      ),
                      elevation: 2,
                      borderColor: FlutterFlowTheme.of(context).lineColor,
                      borderWidth: 2,
                      borderRadius: 8,
                      margin: EdgeInsetsDirectional.fromSTEB(12, 4, 12, 4),
                      hidesUnderline: true,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 16),
                    child: TextFormField(
                      controller: domisiliController,
                      obscureText: false,
                      decoration: InputDecoration(
                        labelText: 'Kota Domisili',
                        labelStyle: FlutterFlowTheme.of(context)
                            .bodyText2
                            .override(
                              fontFamily: 'Inter',
                              color: FlutterFlowTheme.of(context).primaryText,
                            ),
                        hintStyle: FlutterFlowTheme.of(context)
                            .bodyText2
                            .override(
                              fontFamily: 'Inter',
                              color: FlutterFlowTheme.of(context).primaryText,
                            ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).lineColor,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).lineColor,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFFC62828),
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFFC62828),
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        contentPadding:
                            EdgeInsetsDirectional.fromSTEB(20, 24, 0, 24),
                      ),
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'Inter',
                            color: FlutterFlowTheme.of(context).primaryText,
                          ),
                      validator: (val) {
                        if (val == null || val.isEmpty) {
                          return 'Domisili Wajib Diisi';
                        }

                        return null;
                      },
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0, 0.05),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          final usersUpdateData = createUsersRecordData(
                            photoUrl: uploadedFileUrl,
                            displayName: yourNameController!.text,
                            phoneNumber: phoneNumberController!.text,
                            gender: dropDownValue,
                            domisili: domisiliController!.text,
                            email: '',
                          );
                          await currentUserReference!.update(usersUpdateData);

                          context.pushNamed(
                            'home',
                            extra: <String, dynamic>{
                              kTransitionInfoKey: TransitionInfo(
                                hasTransition: true,
                                transitionType: PageTransitionType.fade,
                              ),
                            },
                          );
                        },
                        text: 'Simpan',
                        options: FFButtonOptions(
                          width: 270,
                          height: 50,
                          color: FlutterFlowTheme.of(context).lineColor,
                          textStyle: FlutterFlowTheme.of(context)
                              .subtitle1
                              .override(
                                fontFamily: 'Outfit',
                                color: FlutterFlowTheme.of(context).alternate,
                              ),
                          elevation: 2,
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
