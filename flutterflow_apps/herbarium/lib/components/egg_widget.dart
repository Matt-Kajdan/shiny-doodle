import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'egg_model.dart';
export 'egg_model.dart';

class EggWidget extends StatefulWidget {
  const EggWidget({super.key});

  @override
  State<EggWidget> createState() => _EggWidgetState();
}

class _EggWidgetState extends State<EggWidget> {
  late EggModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EggModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOut,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).alternate,
        boxShadow: [
          BoxShadow(
            blurRadius: 4.0,
            color: Color(0x33000000),
            offset: Offset(
              0.0,
              2.0,
            ),
          )
        ],
        borderRadius: BorderRadius.circular(7.0),
        border: Border.all(
          color: FlutterFlowTheme.of(context).tertiary,
          width: 1.0,
        ),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(7.0, 5.0, 7.0, 5.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              FFLocalizations.of(context).getText(
                'mmgf3mgs' /* z dedykacją dla siorki */,
              ),
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    font: GoogleFonts.roboto(
                      fontWeight: FontWeight.w500,
                      fontStyle:
                          FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                    ),
                    color: FlutterFlowTheme.of(context).secondaryText,
                    fontSize: 12.0,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.w500,
                    fontStyle:
                        FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                  ),
            ),
            Text(
              FFLocalizations.of(context).getText(
                'in3svi1u' /* ^_^ */,
              ),
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    font: GoogleFonts.roboto(
                      fontWeight: FontWeight.w500,
                      fontStyle:
                          FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                    ),
                    color: FlutterFlowTheme.of(context).secondaryText,
                    fontSize: 12.0,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.w500,
                    fontStyle:
                        FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                  ),
            ),
          ].divide(SizedBox(width: 7.0)),
        ),
      ),
    );
  }
}
