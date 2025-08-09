import '/auth/firebase_auth/auth_util.dart';
import '/components/dialog_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'settings_model.dart';
export 'settings_model.dart';

class SettingsWidget extends StatefulWidget {
  const SettingsWidget({super.key});

  static String routeName = 'settings';
  static String routePath = '/settings';

  @override
  State<SettingsWidget> createState() => _SettingsWidgetState();
}

class _SettingsWidgetState extends State<SettingsWidget> {
  late SettingsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SettingsModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(50.0, 85.0, 50.0, 35.0),
                child: Text(
                  FFLocalizations.of(context).getText(
                    'fifjjvhh' /* Settings */,
                  ),
                  style: FlutterFlowTheme.of(context).headlineLarge.override(
                        font: GoogleFonts.plusJakartaSans(
                          fontWeight: FontWeight.w800,
                          fontStyle: FlutterFlowTheme.of(context)
                              .headlineLarge
                              .fontStyle,
                        ),
                        color: FlutterFlowTheme.of(context).secondaryText,
                        fontSize: 30.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w800,
                        fontStyle: FlutterFlowTheme.of(context)
                            .headlineLarge
                            .fontStyle,
                      ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 2.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      FFLocalizations.of(context).getText(
                        '0l6fw75z' /* User interface */,
                      ),
                      style: FlutterFlowTheme.of(context).labelLarge.override(
                            font: GoogleFonts.roboto(
                              fontWeight: FlutterFlowTheme.of(context)
                                  .labelLarge
                                  .fontWeight,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .labelLarge
                                  .fontStyle,
                            ),
                            letterSpacing: 0.0,
                            fontWeight: FlutterFlowTheme.of(context)
                                .labelLarge
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .labelLarge
                                .fontStyle,
                          ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 0.0),
                      child: Material(
                        color: Colors.transparent,
                        child: SwitchListTile.adaptive(
                          value: _model.switchListTileValue1 ??=
                              FFAppState().polishNames,
                          onChanged: (newValue) async {
                            safeSetState(
                                () => _model.switchListTileValue1 = newValue);
                            if (newValue) {
                              FFAppState().polishNames = true;
                              FFAppState().update(() {});
                            } else {
                              FFAppState().polishNames = false;
                              FFAppState().update(() {});
                            }
                          },
                          title: Text(
                            FFLocalizations.of(context).getText(
                              '3p1u9vhx' /* Primary plant name language */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .titleMedium
                                .override(
                                  font: GoogleFonts.roboto(
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .fontStyle,
                                  ),
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .titleMedium
                                      .fontStyle,
                                  lineHeight: 1.0,
                                ),
                          ),
                          subtitle: Text(
                            FFAppState().polishNames
                                ? FFLocalizations.of(context).getVariableText(
                                    enText: 'Polish',
                                    plText: 'polski',
                                  )
                                : FFLocalizations.of(context).getVariableText(
                                    enText: 'English',
                                    plText: 'angielski',
                                  ),
                            style: FlutterFlowTheme.of(context)
                                .labelLarge
                                .override(
                                  font: GoogleFonts.roboto(
                                    fontWeight: FontWeight.normal,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .labelLarge
                                        .fontStyle,
                                  ),
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.normal,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .labelLarge
                                      .fontStyle,
                                ),
                          ),
                          tileColor:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          activeColor:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          activeTrackColor:
                              FlutterFlowTheme.of(context).primary,
                          dense: false,
                          controlAffinity: ListTileControlAffinity.trailing,
                          contentPadding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 5.0, 20.0, 5.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 0.0),
                      child: Material(
                        color: Colors.transparent,
                        child: SwitchListTile.adaptive(
                          value: _model.switchListTileValue2 ??=
                              FFAppState().addBtnOnTop,
                          onChanged: (newValue) async {
                            safeSetState(
                                () => _model.switchListTileValue2 = newValue);
                            if (newValue) {
                              FFAppState().addBtnOnTop = true;
                              FFAppState().update(() {});
                            } else {
                              FFAppState().addBtnOnTop = false;
                              FFAppState().update(() {});
                            }
                          },
                          title: Text(
                            FFLocalizations.of(context).getText(
                              'lrplrugk' /* Floating new plant button */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .titleMedium
                                .override(
                                  font: GoogleFonts.roboto(
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .fontStyle,
                                  ),
                                  fontSize: 18.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .titleMedium
                                      .fontStyle,
                                  lineHeight: 1.0,
                                ),
                          ),
                          subtitle: Text(
                            FFLocalizations.of(context).getVariableText(
                              enText: 'Or at the bottom of the list ',
                              plText: 'Lub na dole listy',
                            ),
                            style: FlutterFlowTheme.of(context)
                                .labelLarge
                                .override(
                                  font: GoogleFonts.roboto(
                                    fontWeight: FontWeight.normal,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .labelLarge
                                        .fontStyle,
                                  ),
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.normal,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .labelLarge
                                      .fontStyle,
                                ),
                          ),
                          tileColor:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          activeColor:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          activeTrackColor:
                              FlutterFlowTheme.of(context).primary,
                          dense: false,
                          controlAffinity: ListTileControlAffinity.trailing,
                          contentPadding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 5.0, 20.0, 5.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 0.0),
                      child: Material(
                        color: Colors.transparent,
                        child: SwitchListTile.adaptive(
                          value: _model.switchListTileValue3 ??=
                              FFAppState().greenTitles,
                          onChanged: (newValue) async {
                            safeSetState(
                                () => _model.switchListTileValue3 = newValue);
                            if (newValue) {
                              FFAppState().greenTitles = true;
                              FFAppState().update(() {});
                            } else {
                              FFAppState().greenTitles = false;
                              FFAppState().update(() {});
                            }
                          },
                          title: Text(
                            FFLocalizations.of(context).getText(
                              'xgxd0h6h' /* Green plant card titles */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .titleMedium
                                .override(
                                  font: GoogleFonts.roboto(
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .fontStyle,
                                  ),
                                  fontSize: 18.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .titleMedium
                                      .fontStyle,
                                  lineHeight: 1.0,
                                ),
                          ),
                          tileColor:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          activeColor:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          activeTrackColor:
                              FlutterFlowTheme.of(context).primary,
                          dense: false,
                          controlAffinity: ListTileControlAffinity.trailing,
                          contentPadding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 13.0, 20.0, 13.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                        ),
                      ),
                    ),
                  ].divide(SizedBox(height: 10.0)),
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    FFLocalizations.of(context).getText(
                      'naf7fm80' /* Functionality */,
                    ),
                    style: FlutterFlowTheme.of(context).labelLarge.override(
                          font: GoogleFonts.roboto(
                            fontWeight: FlutterFlowTheme.of(context)
                                .labelLarge
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .labelLarge
                                .fontStyle,
                          ),
                          letterSpacing: 0.0,
                          fontWeight: FlutterFlowTheme.of(context)
                              .labelLarge
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).labelLarge.fontStyle,
                        ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 0.0),
                    child: Material(
                      color: Colors.transparent,
                      child: SwitchListTile.adaptive(
                        value: _model.switchListTileValue4 ??=
                            FFAppState().mapHabitat,
                        onChanged: (newValue) async {
                          safeSetState(
                              () => _model.switchListTileValue4 = newValue);
                          if (newValue) {
                            FFAppState().mapHabitat = true;
                            FFAppState().update(() {});
                          } else {
                            FFAppState().mapHabitat = false;
                            FFAppState().update(() {});
                          }
                        },
                        title: Text(
                          FFLocalizations.of(context).getText(
                            'b3ya6rws' /* Map-based habitat */,
                          ),
                          style:
                              FlutterFlowTheme.of(context).titleMedium.override(
                                    font: GoogleFonts.roboto(
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .fontStyle,
                                    ),
                                    fontSize: 18.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .fontStyle,
                                    lineHeight: 1.0,
                                  ),
                        ),
                        subtitle: Text(
                          FFLocalizations.of(context).getVariableText(
                            enText: 'Or desctiptive',
                            plText: 'Lub opisowe',
                          ),
                          style:
                              FlutterFlowTheme.of(context).labelLarge.override(
                                    font: GoogleFonts.roboto(
                                      fontWeight: FontWeight.normal,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .labelLarge
                                          .fontStyle,
                                    ),
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.normal,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .labelLarge
                                        .fontStyle,
                                  ),
                        ),
                        tileColor:
                            FlutterFlowTheme.of(context).secondaryBackground,
                        activeColor:
                            FlutterFlowTheme.of(context).secondaryBackground,
                        activeTrackColor: FlutterFlowTheme.of(context).primary,
                        dense: false,
                        controlAffinity: ListTileControlAffinity.trailing,
                        contentPadding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 5.0, 20.0, 5.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                      ),
                    ),
                  ),
                ].divide(SizedBox(height: 15.0)),
              ),
              Align(
                alignment: AlignmentDirectional(0.0, 1.0),
                child: Builder(
                  builder: (context) => InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onLongPress: () async {
                      var _shouldSetState = false;
                      HapticFeedback.heavyImpact();
                      await showDialog(
                        barrierColor: FlutterFlowTheme.of(context).barrier,
                        context: context,
                        builder: (dialogContext) {
                          return Dialog(
                            elevation: 0,
                            insetPadding: EdgeInsets.zero,
                            backgroundColor: Colors.transparent,
                            alignment: AlignmentDirectional(0.0, 0.0)
                                .resolve(Directionality.of(context)),
                            child: GestureDetector(
                              onTap: () {
                                FocusScope.of(dialogContext).unfocus();
                                FocusManager.instance.primaryFocus?.unfocus();
                              },
                              child: DialogWidget(
                                message: FFLocalizations.of(context).getText(
                                  'zz3tenwo' /* Are you sure you want to log o... */,
                                ),
                              ),
                            ),
                          );
                        },
                      ).then((value) =>
                          safeSetState(() => _model.logoutDialog = value));

                      _shouldSetState = true;
                      if (_model.logoutDialog!) {
                        GoRouter.of(context).prepareAuthEvent();
                        await authManager.signOut();
                        GoRouter.of(context).clearRedirectLocation();
                      } else {
                        if (_shouldSetState) safeSetState(() {});
                        return;
                      }

                      context.goNamedAuth(
                          LoginWidget.routeName, context.mounted);

                      if (_shouldSetState) safeSetState(() {});
                    },
                    child: FlutterFlowIconButton(
                      borderColor: Colors.transparent,
                      borderRadius: 25.0,
                      buttonSize: 100.0,
                      fillColor: Colors.transparent,
                      icon: Icon(
                        Icons.key_rounded,
                        color: FlutterFlowTheme.of(context).tertiary,
                        size: 50.0,
                      ),
                      onPressed: () {
                        print('IconButton pressed ...');
                      },
                    ),
                  ),
                ),
              ),
            ].divide(SizedBox(height: 25.0)),
          ),
        ),
      ),
    );
  }
}
