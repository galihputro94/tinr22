import '../auth/auth_util.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class CreateAccountWidget extends StatefulWidget {
  const CreateAccountWidget({Key? key}) : super(key: key);

  @override
  _CreateAccountWidgetState createState() => _CreateAccountWidgetState();
}

class _CreateAccountWidgetState extends State<CreateAccountWidget> {
  TextEditingController? emailAddressController;
  TextEditingController? passwordController;

  late bool passwordVisibility;
  TextEditingController? password2Controller;

  late bool password2Visibility;
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    emailAddressController = TextEditingController();
    passwordController = TextEditingController();
    passwordVisibility = false;
    password2Controller = TextEditingController();
    password2Visibility = false;
    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'createAccount'});
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    emailAddressController?.dispose();
    passwordController?.dispose();
    password2Controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).white,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 1,
            decoration: BoxDecoration(),
            child: Align(
              alignment: AlignmentDirectional(0, 1),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.2,
                        decoration: BoxDecoration(),
                        child: Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(10, 10, 10, 0),
                          child: Image.asset(
                            'assets/images/Untitled_(Presentation_(169)).png',
                            width: MediaQuery.of(context).size.width * 0.5,
                            height: 100,
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.8,
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
                              Form(
                                key: formKey,
                                autovalidateMode: AutovalidateMode.disabled,
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          20, 16, 20, 0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Expanded(
                                            child: AutoSizeText(
                                              'Buat Akun Baru',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .title1
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        fontSize: 20,
                                                      ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          20, 16, 20, 0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            child: TextFormField(
                                              controller:
                                                  emailAddressController,
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                labelText: 'Email',
                                                hintText: 'Masukan Email',
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryColor,
                                                    width: 2,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryColor,
                                                    width: 2,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                                errorBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0xFFC62828),
                                                    width: 2,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                                focusedErrorBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0xFFC62828),
                                                    width: 2,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                                contentPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            16, 24, 0, 24),
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                      ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          20, 16, 20, 0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            child: TextFormField(
                                              controller: passwordController,
                                              obscureText: !passwordVisibility,
                                              decoration: InputDecoration(
                                                labelText: 'Kata Sandi',
                                                labelStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                        ),
                                                hintText: 'Masukan Kata Sandi',
                                                hintStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                        ),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryColor,
                                                    width: 2,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryColor,
                                                    width: 2,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                                errorBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0xFFC62828),
                                                    width: 2,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                                focusedErrorBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0xFFC62828),
                                                    width: 2,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                                contentPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            16, 24, 0, 24),
                                                suffixIcon: InkWell(
                                                  onTap: () => setState(
                                                    () => passwordVisibility =
                                                        !passwordVisibility,
                                                  ),
                                                  focusNode: FocusNode(
                                                      skipTraversal: true),
                                                  child: Icon(
                                                    passwordVisibility
                                                        ? Icons
                                                            .visibility_outlined
                                                        : Icons
                                                            .visibility_off_outlined,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryColor,
                                                    size: 22,
                                                  ),
                                                ),
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryColor,
                                                      ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          20, 16, 20, 0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            child: TextFormField(
                                              controller: password2Controller,
                                              obscureText: !password2Visibility,
                                              decoration: InputDecoration(
                                                labelText: 'Konfirmasi Sandi',
                                                labelStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                        ),
                                                hintText:
                                                    'Masukan Ulang Kata Sandi',
                                                hintStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                        ),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryColor,
                                                    width: 2,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryColor,
                                                    width: 2,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                                errorBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0xFFC62828),
                                                    width: 2,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                                focusedErrorBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0xFFC62828),
                                                    width: 2,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                                contentPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            16, 24, 0, 24),
                                                suffixIcon: InkWell(
                                                  onTap: () => setState(
                                                    () => password2Visibility =
                                                        !password2Visibility,
                                                  ),
                                                  focusNode: FocusNode(
                                                      skipTraversal: true),
                                                  child: Icon(
                                                    password2Visibility
                                                        ? Icons
                                                            .visibility_outlined
                                                        : Icons
                                                            .visibility_off_outlined,
                                                    color: Color(0xFFE0E3E7),
                                                    size: 22,
                                                  ),
                                                ),
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                      ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          20, 12, 20, 16),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          FFButtonWidget(
                                            onPressed: () async {
                                              logFirebaseEvent(
                                                  'CREATE_ACCOUNT_PAGE_ButtonLogin_ON_TAP');
                                              logFirebaseEvent(
                                                  'ButtonLogin_validate_form');
                                              if (formKey.currentState ==
                                                      null ||
                                                  !formKey.currentState!
                                                      .validate()) {
                                                return;
                                              }

                                              logFirebaseEvent(
                                                  'ButtonLogin_auth');
                                              GoRouter.of(context)
                                                  .prepareAuthEvent();
                                              if (passwordController?.text !=
                                                  password2Controller?.text) {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  SnackBar(
                                                    content: Text(
                                                      'Kata sandi tidak sama',
                                                    ),
                                                  ),
                                                );
                                                return;
                                              }

                                              final user =
                                                  await createAccountWithEmail(
                                                context,
                                                emailAddressController!.text,
                                                passwordController!.text,
                                              );
                                              if (user == null) {
                                                return;
                                              }

                                              logFirebaseEvent(
                                                  'ButtonLogin_navigate_to');

                                              context.pushNamedAuth(
                                                  'completProfile', mounted);
                                            },
                                            text: 'Daftar',
                                            options: FFButtonOptions(
                                              width: 170,
                                              height: 50,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .tertiaryColor,
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .subtitle2
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        color: Colors.white,
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                              elevation: 2,
                                              borderSide: BorderSide(
                                                color: Colors.transparent,
                                                width: 1,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Divider(
                                      height: 2,
                                      thickness: 2,
                                      indent: 20,
                                      endIndent: 20,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryColor,
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 12, 0, 24),
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          logFirebaseEvent(
                                              'CREATE_ACCOUNT_ButtonCreateAccount_ON_TA');
                                          logFirebaseEvent(
                                              'ButtonCreateAccount_navigate_to');

                                          context.pushNamed(
                                            'login',
                                            extra: <String, dynamic>{
                                              kTransitionInfoKey:
                                                  TransitionInfo(
                                                hasTransition: true,
                                                transitionType:
                                                    PageTransitionType.fade,
                                                duration:
                                                    Duration(milliseconds: 500),
                                              ),
                                            },
                                          );
                                        },
                                        text: 'Masuk',
                                        options: FFButtonOptions(
                                          width: 170,
                                          height: 40,
                                          color: Color(0xFF3535FF),
                                          textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .subtitle2
                                                  .override(
                                                    fontFamily: 'Inter',
                                                    color: Colors.white,
                                                  ),
                                          elevation: 0,
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(12),
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
                    ],
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
