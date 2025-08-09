import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'reorder_model.dart';
export 'reorder_model.dart';

class ReorderWidget extends StatefulWidget {
  const ReorderWidget({
    super.key,
    required this.plantDocs,
  });

  final List<PlantsRecord>? plantDocs;

  static String routeName = 'reorder';
  static String routePath = '/reorder';

  @override
  State<ReorderWidget> createState() => _ReorderWidgetState();
}

class _ReorderWidgetState extends State<ReorderWidget> {
  late ReorderModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ReorderModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.localListItems = widget.plantDocs!.toList().cast<PlantsRecord>();
      safeSetState(() {});
    });

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
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: double.infinity,
                height: 150.0,
                child: Stack(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  children: [
                    Align(
                      alignment: AlignmentDirectional(-1.0, 0.0),
                      child: FlutterFlowIconButton(
                        borderColor: Colors.transparent,
                        borderRadius: 35.0,
                        borderWidth: 1.0,
                        buttonSize: 60.0,
                        fillColor:
                            FlutterFlowTheme.of(context).primaryBackground,
                        icon: Icon(
                          Icons.chevron_left_rounded,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 35.0,
                        ),
                        onPressed: () async {
                          context.goNamed(HomeWidget.routeName);
                        },
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Text(
                        FFLocalizations.of(context).getText(
                          'vdyqvkq2' /* Change order */,
                        ),
                        style:
                            FlutterFlowTheme.of(context).titleMedium.override(
                                  font: GoogleFonts.plusJakartaSans(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .fontStyle,
                                  ),
                                  fontSize: 20.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .titleMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .titleMedium
                                      .fontStyle,
                                ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(1.0, 0.0),
                      child: FlutterFlowIconButton(
                        borderColor: Colors.transparent,
                        borderRadius: 35.0,
                        borderWidth: 1.0,
                        buttonSize: 60.0,
                        fillColor:
                            FlutterFlowTheme.of(context).primaryBackground,
                        disabledIconColor:
                            FlutterFlowTheme.of(context).tertiary,
                        icon: FaIcon(
                          FontAwesomeIcons.check,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 22.0,
                        ),
                        onPressed: !_model.listChanged
                            ? null
                            : () async {
                                await actions.reorderFirebaseItems(
                                  _model.localListItems.toList(),
                                );

                                context.goNamed(HomeWidget.routeName);
                              },
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.0, 1.0),
                      child: Padding(
                        padding: EdgeInsets.all(6.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).alternate,
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                15.0, 5.0, 15.0, 5.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.info_outline_rounded,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  size: 14.0,
                                ),
                                Text(
                                  FFLocalizations.of(context).getText(
                                    '7cldnv30' /* Hold and drag to move places */,
                                  ),
                                  textAlign: TextAlign.center,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.roboto(
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        letterSpacing: 0.0,
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                ),
                              ].divide(SizedBox(width: 7.0)),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              if (widget.plantDocs!.length > 0)
                Flexible(
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 25.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).alternate,
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            0.0, 25.0, 0.0, 25.0),
                        child: Builder(
                          builder: (context) {
                            final docList = _model.localListItems.toList();

                            return ReorderableListView.builder(
                              padding: EdgeInsets.zero,
                              primary: false,
                              proxyDecorator: (Widget child, int index,
                                      Animation<double> animation) =>
                                  Material(
                                      color: Colors.transparent, child: child),
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: docList.length,
                              itemBuilder: (context, docListIndex) {
                                final docListItem = docList[docListIndex];
                                return Container(
                                  key: ValueKey(docListItem.reference.path),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 1.0, 0.0, 1.0),
                                    child: Container(
                                      width: double.infinity,
                                      constraints: BoxConstraints(
                                        minHeight: 80.0,
                                      ),
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        borderRadius:
                                            BorderRadius.circular(0.0),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            15.0, 15.0, 15.0, 15.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            if (docListItem.images.isNotEmpty)
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(15.0),
                                                child: CachedNetworkImage(
                                                  fadeInDuration: Duration(
                                                      milliseconds: 200),
                                                  fadeOutDuration: Duration(
                                                      milliseconds: 200),
                                                  imageUrl: docListItem
                                                      .images.firstOrNull!,
                                                  width: 50.0,
                                                  height: 50.0,
                                                  fit: BoxFit.cover,
                                                  memCacheWidth: 200,
                                                  memCacheHeight: 200,
                                                ),
                                              ),
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  resolvePlantDisplayName(
                                                    docListItem,
                                                    preferPolish:
                                                        FFAppState()
                                                            .polishNames,
                                                  ),
                                                  style:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .headlineSmall
                                                          .override(
                                                            font: GoogleFonts
                                                                .plusJakartaSans(
                                                              fontWeight: FlutterFlowTheme
                                                                      .of(context)
                                                                  .headlineSmall
                                                                  .fontWeight,
                                                              fontStyle: FlutterFlowTheme
                                                                      .of(context)
                                                                  .headlineSmall
                                                                  .fontStyle,
                                                            ),
                                                            color: FFAppState()
                                                                    .greenTitles
                                                                ? FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary
                                                                : FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineSmall
                                                                    .fontWeight,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineSmall
                                                                    .fontStyle,
                                                          ),
                                                ),
                                                if ((docListItem.nameLatin !=
                                                            '') &&
                                                    ((docListItem
                                                                    .nameCommon !=
                                                                '') &&
                                                        (docListItem
                                                                    .namePolish !=
                                                                '')))
                                                  Text(
                                                    docListItem.nameLatin,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .labelMedium
                                                        .override(
                                                          font: GoogleFonts
                                                              .roboto(
                                                            fontWeight:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .fontWeight,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .fontStyle,
                                                          ),
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .fontStyle,
                                                        ),
                                                  ),
                                              ],
                                            ),
                                          ].divide(SizedBox(width: 15.0)),
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                              onReorder: (int reorderableOldIndex,
                                  int reorderableNewIndex) async {
                                _model.updatedList = await actions.reorderItems(
                                  _model.localListItems.toList(),
                                  reorderableOldIndex,
                                  reorderableNewIndex,
                                );
                                _model.localListItems = _model.updatedList!
                                    .toList()
                                    .cast<PlantsRecord>();
                                _model.listChanged = true;
                                safeSetState(() {});

                                safeSetState(() {});
                              },
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ),
            ].divide(SizedBox(height: 15.0)),
          ),
        ),
      ),
    );
  }
}
