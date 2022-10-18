import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../backend/firebase_storage/storage.dart';
import '../flutter_flow/flutter_flow_drop_down.dart';
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

class EditProfileWidget extends StatefulWidget {
  const EditProfileWidget({Key? key}) : super(key: key);

  @override
  _EditProfileWidgetState createState() => _EditProfileWidgetState();
}

class _EditProfileWidgetState extends State<EditProfileWidget> {
  bool isMediaUploading = false;
  String uploadedFileUrl = '';

  TextEditingController? editProfileNamaController;
  TextEditingController? editProfileNomorController;
  TextEditingController? editProfileEmailController;
  String? genderEditProfileValue;
  TextEditingController? editProfileDomisiliController;
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    editProfileDomisiliController = TextEditingController(
        text: valueOrDefault(currentUserDocument?.domisili, ''));
    editProfileEmailController = TextEditingController(text: currentUserEmail);
    editProfileNamaController =
        TextEditingController(text: currentUserDisplayName);
    editProfileNomorController =
        TextEditingController(text: currentPhoneNumber);
    logFirebaseEvent('screen_view', parameters: {'screen_name': 'editProfile'});
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    editProfileDomisiliController?.dispose();
    editProfileEmailController?.dispose();
    editProfileNamaController?.dispose();
    editProfileNomorController?.dispose();
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
        leading: InkWell(
          onTap: () async {
            logFirebaseEvent('EDIT_PROFILE_PAGE_Icon_v2verjfb_ON_TAP');
            logFirebaseEvent('Icon_navigate_back');
            context.pop();
          },
          child: Icon(
            Icons.arrow_back_rounded,
            color: FlutterFlowTheme.of(context).primaryText,
            size: 24,
          ),
        ),
        title: Text(
          'Ubah Profil',
          style: FlutterFlowTheme.of(context).title3.override(
                fontFamily: 'Outfit',
                color: FlutterFlowTheme.of(context).primaryText,
              ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(
        child: Form(
          key: formKey,
          autovalidateMode: AutovalidateMode.disabled,
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 1,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).tertiaryColor,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(0),
                        bottomRight: Radius.circular(0),
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 10),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context).alternate,
                                  shape: BoxShape.circle,
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      1, 1, 1, 1),
                                  child: AuthUserStreamWidget(
                                    child: InkWell(
                                      onTap: () async {
                                        logFirebaseEvent(
                                            'EDIT_PROFILE_CircleImage_ta0si24b_ON_TAP');
                                        logFirebaseEvent(
                                            'CircleImage_upload_photo_video');
                                        final selectedMedia =
                                            await selectMediaWithSourceBottomSheet(
                                          context: context,
                                          allowPhoto: true,
                                        );
                                        if (selectedMedia != null &&
                                            selectedMedia.every((m) =>
                                                validateFileFormat(
                                                    m.storagePath, context))) {
                                          setState(
                                              () => isMediaUploading = true);
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
                                            setState(() => uploadedFileUrl =
                                                downloadUrls.first);
                                            showUploadMessage(
                                                context, 'Berhasil!');
                                          } else {
                                            setState(() {});
                                            showUploadMessage(context,
                                                'Gagal mengunggah media');
                                            return;
                                          }
                                        }

                                        logFirebaseEvent(
                                            'CircleImage_backend_call');

                                        final usersUpdateData =
                                            createUsersRecordData(
                                          photoUrl: uploadedFileUrl,
                                        );
                                        await currentUserReference!
                                            .update(usersUpdateData);
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
                                            currentUserPhoto,
                                            'https://www.gravatar.com/avatar/00000000000000000000000000000000?d=mp&f=y',
                                          ),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
                          child: AuthUserStreamWidget(
                            child: TextFormField(
                              controller: editProfileNamaController,
                              obscureText: false,
                              decoration: InputDecoration(
                                labelText: 'Nama Lengkap',
                                hintText: 'Your full name...',
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
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
                                contentPadding: EdgeInsetsDirectional.fromSTEB(
                                    20, 24, 0, 24),
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Lexend Deca',
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                  ),
                            ),
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
                          child: AuthUserStreamWidget(
                            child: TextFormField(
                              controller: editProfileNomorController,
                              obscureText: false,
                              decoration: InputDecoration(
                                labelText: 'Nomor HP',
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
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
                                contentPadding: EdgeInsetsDirectional.fromSTEB(
                                    20, 24, 0, 24),
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Lexend Deca',
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                  ),
                            ),
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
                          child: TextFormField(
                            controller: editProfileEmailController,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: 'Email',
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).alternate,
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).alternate,
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
                            style: FlutterFlowTheme.of(context)
                                .bodyText1
                                .override(
                                  fontFamily: 'Lexend Deca',
                                  color: FlutterFlowTheme.of(context).alternate,
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                ),
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
                          child: AuthUserStreamWidget(
                            child: FlutterFlowDropDown(
                              initialOption: genderEditProfileValue ??=
                                  valueOrDefault(
                                      currentUserDocument?.gender, ''),
                              options: ['Pria', 'Wanita'],
                              onChanged: (val) =>
                                  setState(() => genderEditProfileValue = val),
                              width: MediaQuery.of(context).size.width,
                              height: 60,
                              textStyle: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Inter',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                  ),
                              hintText: 'Jenis Kelamin',
                              icon: FaIcon(
                                FontAwesomeIcons.caretDown,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 15,
                              ),
                              fillColor: FlutterFlowTheme.of(context).alternate,
                              elevation: 2,
                              borderColor: Color(0x00FFFFFF),
                              borderWidth: 2,
                              borderRadius: 8,
                              margin:
                                  EdgeInsetsDirectional.fromSTEB(12, 4, 12, 4),
                              hidesUnderline: true,
                            ),
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
                          child: AuthUserStreamWidget(
                            child: TextFormField(
                              controller: editProfileDomisiliController,
                              obscureText: false,
                              decoration: InputDecoration(
                                labelText: 'Domisili',
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
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
                                contentPadding: EdgeInsetsDirectional.fromSTEB(
                                    20, 24, 0, 24),
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Lexend Deca',
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                  ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(0, 0.05),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
                            child: FFButtonWidget(
                              onPressed: () async {
                                logFirebaseEvent(
                                    'EDIT_PROFILE_PAGE_SIMPAN_BTN_ON_TAP');
                                logFirebaseEvent('Button_validate_form');
                                if (formKey.currentState == null ||
                                    !formKey.currentState!.validate()) {
                                  return;
                                }

                                logFirebaseEvent('Button_backend_call');

                                final usersUpdateData = createUsersRecordData(
                                  displayName: editProfileNamaController!.text,
                                  email: editProfileEmailController!.text,
                                  domisili: editProfileDomisiliController!.text,
                                  uid: editProfileNomorController!.text,
                                  phoneNumber: editProfileNomorController!.text,
                                  gender: genderEditProfileValue,
                                );
                                await currentUserReference!
                                    .update(usersUpdateData);
                                logFirebaseEvent('Button_navigate_back');
                                context.pop();
                              },
                              text: 'Simpan',
                              options: FFButtonOptions(
                                width: 340,
                                height: 60,
                                color: FlutterFlowTheme.of(context).alternate,
                                textStyle: FlutterFlowTheme.of(context)
                                    .subtitle2
                                    .override(
                                      fontFamily: 'Lexend Deca',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal,
                                    ),
                                elevation: 2,
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
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
        ),
      ),
    );
  }
}
