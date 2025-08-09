import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'home_model.dart';
export 'home_model.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  static String routeName = 'home';
  static String routePath = '/home';

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  late HomeModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomeModel());

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

    return StreamBuilder<List<PlantsRecord>>(
      stream: queryPlantsRecord(
        queryBuilder: (plantsRecord) => plantsRecord.orderBy('order'),
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        List<PlantsRecord> homePlantsRecordList = snapshot.data!;

        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Stack(
              children: [
                ListView(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          50.0, 85.0, 50.0, 60.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.asset(
                              'assets/images/icon.png',
                              height: 32.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 3.0),
                            child: Text(
                              FFLocalizations.of(context).getText(
                                's728av8u' /* Herbarium */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .displaySmall
                                  .override(
                                    font: GoogleFonts.plusJakartaSans(
                                      fontWeight: FontWeight.w800,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .displaySmall
                                          .fontStyle,
                                    ),
                                    color: FlutterFlowTheme.of(context).primary,
                                    fontSize: 30.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w800,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .displaySmall
                                        .fontStyle,
                                  ),
                            ),
                          ),
                        ].divide(SizedBox(width: 15.0)),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          15.0, 0.0, 15.0, 100.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Builder(
                            builder: (context) {
                              final plants = homePlantsRecordList.toList();

                              return Column(
                                mainAxisSize: MainAxisSize.max,
                                children:
                                    List.generate(plants.length, (plantsIndex) {
                                  final plantsItem = plants[plantsIndex];
                                  return Container(
                                    width: double.infinity,
                                    constraints: BoxConstraints(
                                      minHeight: 50.0,
                                    ),
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      borderRadius: BorderRadius.circular(25.0),
                                    ),
                                    child: Container(
                                      width: double.infinity,
                                      color: Color(0x00000000),
                                      child: ExpandableNotifier(
                                        initialExpanded: false,
                                        child: ExpandablePanel(
                                          header: Container(),
                                          collapsed: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    15.0, 15.0, 15.0, 15.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                if (plantsItem
                                                    .images.isNotEmpty)
                                                  ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15.0),
                                                    child: CachedNetworkImage(
                                                      fadeInDuration: Duration(
                                                          milliseconds: 200),
                                                      fadeOutDuration: Duration(
                                                          milliseconds: 200),
                                                      imageUrl: plantsItem
                                                          .images.firstOrNull!,
                                                      width: 50.0,
                                                      height: 50.0,
                                                      fit: BoxFit.cover,
                                                      memCacheWidth: 200,
                                                      memCacheHeight: 200,
                                                    ),
                                                  ),
                                                Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      FFAppState().polishNames
                                                          ? () {
                                                              if ((plantsItem
                                                                              .nameCommon ==
                                                                          '') &&
                                                                  (plantsItem
                                                                              .namePolish ==
                                                                          '')) {
                                                                return plantsItem
                                                                    .nameLatin;
                                                              } else if (plantsItem
                                                                          .namePolish ==
                                                                      '') {
                                                                return plantsItem
                                                                    .nameCommon;
                                                              } else {
                                                                return plantsItem
                                                                    .namePolish;
                                                              }
                                                            }()
                                                          : ((plantsItem
                                                                              .nameCommon ==
                                                                          '') &&
                                                                  (plantsItem
                                                                              .namePolish ==
                                                                          '')
                                                              ? plantsItem
                                                                  .nameLatin
                                                              : plantsItem
                                                                  .nameCommon),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .headlineSmall
                                                              .override(
                                                                font: GoogleFonts
                                                                    .plusJakartaSans(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineSmall
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineSmall
                                                                      .fontStyle,
                                                                ),
                                                                color: FFAppState().greenTitles
                                                                    ? FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary
                                                                    : FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineSmall
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineSmall
                                                                    .fontStyle,
                                                              ),
                                                    ),
                                                    if ((plantsItem
                                                                    .nameLatin !=
                                                                '') &&
                                                        ((plantsItem
                                                                        .nameCommon !=
                                                                    '') ||
                                                            (plantsItem
                                                                        .namePolish !=
                                                                    '')))
                                                      Text(
                                                        plantsItem.nameLatin,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .roboto(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
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
                                          expanded: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    15.0, 5.0, 15.0, 20.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          5.0, 0.0, 0.0, 0.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Flexible(
                                                            child: Text(
                                                              FFAppState()
                                                                      .polishNames
                                                                  ? () {
                                                                      if ((plantsItem.nameCommon ==
                                                                                  '') &&
                                                                          (plantsItem.namePolish ==
                                                                                  '')) {
                                                                        return plantsItem
                                                                            .nameLatin;
                                                                      } else if (plantsItem.namePolish ==
                                                                              '') {
                                                                        return plantsItem
                                                                            .nameCommon;
                                                                      } else {
                                                                        return plantsItem
                                                                            .namePolish;
                                                                      }
                                                                    }()
                                                                  : ((plantsItem.nameCommon ==
                                                                                  '') &&
                                                                          (plantsItem.namePolish ==
                                                                                  '')
                                                                      ? plantsItem
                                                                          .nameLatin
                                                                      : plantsItem
                                                                          .nameCommon),
                                                              textAlign:
                                                                  TextAlign
                                                                      .start,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .headlineSmall
                                                                  .override(
                                                                    font: GoogleFonts
                                                                        .plusJakartaSans(
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .headlineSmall
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .headlineSmall
                                                                          .fontStyle,
                                                                    ),
                                                                    color: FFAppState().greenTitles
                                                                        ? FlutterFlowTheme.of(context)
                                                                            .primary
                                                                        : FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                    fontSize:
                                                                        20.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .headlineSmall
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .headlineSmall
                                                                        .fontStyle,
                                                                  ),
                                                            ),
                                                          ),
                                                          FlutterFlowIconButton(
                                                            borderColor: Colors
                                                                .transparent,
                                                            borderRadius: 15.0,
                                                            buttonSize: 50.0,
                                                            fillColor: Colors
                                                                .transparent,
                                                            icon: FaIcon(
                                                              FontAwesomeIcons
                                                                  .solidEdit,
                                                              color: FFAppState()
                                                                      .greenTitles
                                                                  ? FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary
                                                                  : FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                              size: 20.0,
                                                            ),
                                                            onPressed:
                                                                () async {
                                                              context.pushNamed(
                                                                EditWidget
                                                                    .routeName,
                                                                queryParameters:
                                                                    {
                                                                  'plantDoc':
                                                                      serializeParam(
                                                                    plantsItem,
                                                                    ParamType
                                                                        .Document,
                                                                  ),
                                                                  'docList':
                                                                      serializeParam(
                                                                    homePlantsRecordList,
                                                                    ParamType
                                                                        .Document,
                                                                    isList:
                                                                        true,
                                                                  ),
                                                                }.withoutNulls,
                                                                extra: <String,
                                                                    dynamic>{
                                                                  'plantDoc':
                                                                      plantsItem,
                                                                  'docList':
                                                                      homePlantsRecordList,
                                                                },
                                                              );
                                                            },
                                                          ),
                                                        ],
                                                      ),
                                                      if (plantsItem
                                                                  .description !=
                                                              '')
                                                        Text(
                                                          plantsItem
                                                              .description,
                                                          textAlign:
                                                              TextAlign.start,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                font:
                                                                    GoogleFonts
                                                                        .roboto(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                              ),
                                                        ),
                                                    ],
                                                  ),
                                                ),
                                                if (plantsItem
                                                    .images.isNotEmpty)
                                                  InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      await Navigator.push(
                                                        context,
                                                        PageTransition(
                                                          type:
                                                              PageTransitionType
                                                                  .fade,
                                                          child:
                                                              FlutterFlowExpandedImageView(
                                                            image:
                                                                Image.network(
                                                              plantsItem.images
                                                                  .firstOrNull!,
                                                              fit: BoxFit
                                                                  .contain,
                                                            ),
                                                            allowRotation:
                                                                false,
                                                            useHeroAnimation:
                                                                false,
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15.0),
                                                      child: Image.network(
                                                        plantsItem.images
                                                            .firstOrNull!,
                                                        width: double.infinity,
                                                        fit: BoxFit.contain,
                                                      ),
                                                    ),
                                                  ),
                                                if (plantsItem.images.length ==
                                                    2)
                                                  InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      await Navigator.push(
                                                        context,
                                                        PageTransition(
                                                          type:
                                                              PageTransitionType
                                                                  .fade,
                                                          child:
                                                              FlutterFlowExpandedImageView(
                                                            image:
                                                                Image.network(
                                                              plantsItem.images
                                                                  .elementAtOrNull(
                                                                      1)!,
                                                              fit: BoxFit
                                                                  .contain,
                                                            ),
                                                            allowRotation:
                                                                false,
                                                            useHeroAnimation:
                                                                false,
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15.0),
                                                      child: Image.network(
                                                        plantsItem.images
                                                            .elementAtOrNull(
                                                                1)!,
                                                        width: double.infinity,
                                                        fit: BoxFit.contain,
                                                      ),
                                                    ),
                                                  ),
                                                if (plantsItem.images.length >
                                                    2)
                                                  Builder(
                                                    builder: (context) {
                                                      final allButFirst =
                                                          plantsItem
                                                              .images
                                                              .where((e) =>
                                                                  e !=
                                                                  plantsItem
                                                                      .images
                                                                      .firstOrNull)
                                                              .toList();

                                                      return GridView.builder(
                                                        padding:
                                                            EdgeInsets.zero,
                                                        gridDelegate:
                                                            SliverGridDelegateWithFixedCrossAxisCount(
                                                          crossAxisCount: plantsItem
                                                                      .images
                                                                      .length ==
                                                                  3
                                                              ? 2
                                                              : 3,
                                                          crossAxisSpacing:
                                                              15.0,
                                                          mainAxisSpacing: 15.0,
                                                          childAspectRatio: 1.0,
                                                        ),
                                                        primary: false,
                                                        shrinkWrap: true,
                                                        scrollDirection:
                                                            Axis.vertical,
                                                        itemCount:
                                                            allButFirst.length,
                                                        itemBuilder: (context,
                                                            allButFirstIndex) {
                                                          final allButFirstItem =
                                                              allButFirst[
                                                                  allButFirstIndex];
                                                          return Visibility(
                                                            visible: plantsItem
                                                                .images
                                                                .isNotEmpty,
                                                            child: InkWell(
                                                              splashColor: Colors
                                                                  .transparent,
                                                              focusColor: Colors
                                                                  .transparent,
                                                              hoverColor: Colors
                                                                  .transparent,
                                                              highlightColor:
                                                                  Colors
                                                                      .transparent,
                                                              onTap: () async {
                                                                await Navigator
                                                                    .push(
                                                                  context,
                                                                  PageTransition(
                                                                    type: PageTransitionType
                                                                        .fade,
                                                                    child:
                                                                        FlutterFlowExpandedImageView(
                                                                      image: Image
                                                                          .network(
                                                                        allButFirstItem,
                                                                        fit: BoxFit
                                                                            .contain,
                                                                      ),
                                                                      allowRotation:
                                                                          false,
                                                                      useHeroAnimation:
                                                                          false,
                                                                    ),
                                                                  ),
                                                                );
                                                              },
                                                              child: ClipRRect(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            15.0),
                                                                child: Image
                                                                    .network(
                                                                  allButFirstItem,
                                                                  width: double
                                                                      .infinity,
                                                                  fit: BoxFit
                                                                      .cover,
                                                                ),
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                      );
                                                    },
                                                  ),
                                                Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Container(
                                                      width: double.infinity,
                                                      constraints:
                                                          BoxConstraints(
                                                        minHeight: 50.0,
                                                      ),
                                                      decoration: BoxDecoration(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .alternate,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(15.0),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    15.0,
                                                                    10.0,
                                                                    15.0,
                                                                    10.0),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      0.0,
                                                                      -1.0),
                                                              child: Container(
                                                                decoration:
                                                                    BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              15.0),
                                                                ),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          15.0,
                                                                          0.0,
                                                                          15.0,
                                                                          0.0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .min,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      Icon(
                                                                        Icons
                                                                            .info_outline_rounded,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                        size:
                                                                            14.0,
                                                                      ),
                                                                      Text(
                                                                        FFLocalizations.of(context)
                                                                            .getText(
                                                                          '87r9nyp1' /* Fact sheet */,
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .labelSmall
                                                                            .override(
                                                                              font: GoogleFonts.roboto(
                                                                                fontWeight: FontWeight.normal,
                                                                                fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                              ),
                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.normal,
                                                                              fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                            ),
                                                                      ),
                                                                    ].divide(SizedBox(
                                                                        width:
                                                                            5.0)),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Flexible(
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .min,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      if (plantsItem.nameLatin !=
                                                                              '')
                                                                        Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            Text(
                                                                              FFLocalizations.of(context).getText(
                                                                                'odtyy6um' /* Latin name */,
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                    font: GoogleFonts.roboto(
                                                                                      fontWeight: FlutterFlowTheme.of(context).labelSmall.fontWeight,
                                                                                      fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                                    ),
                                                                                    color: FlutterFlowTheme.of(context).secondaryText,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FlutterFlowTheme.of(context).labelSmall.fontWeight,
                                                                                    fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                                  ),
                                                                            ),
                                                                            Text(
                                                                              plantsItem.nameLatin,
                                                                              style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                    font: GoogleFonts.roboto(
                                                                                      fontWeight: FlutterFlowTheme.of(context).labelLarge.fontWeight,
                                                                                      fontStyle: FontStyle.italic,
                                                                                    ),
                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FlutterFlowTheme.of(context).labelLarge.fontWeight,
                                                                                    fontStyle: FontStyle.italic,
                                                                                  ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      if (plantsItem.family !=
                                                                              '')
                                                                        Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            Text(
                                                                              FFLocalizations.of(context).getText(
                                                                                'zzvi1n2l' /* Family */,
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                    font: GoogleFonts.roboto(
                                                                                      fontWeight: FlutterFlowTheme.of(context).labelSmall.fontWeight,
                                                                                      fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                                    ),
                                                                                    color: FlutterFlowTheme.of(context).secondaryText,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FlutterFlowTheme.of(context).labelSmall.fontWeight,
                                                                                    fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                                  ),
                                                                            ),
                                                                            Text(
                                                                              plantsItem.family,
                                                                              style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                    font: GoogleFonts.roboto(
                                                                                      fontWeight: FlutterFlowTheme.of(context).labelLarge.fontWeight,
                                                                                      fontStyle: FontStyle.italic,
                                                                                    ),
                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FlutterFlowTheme.of(context).labelLarge.fontWeight,
                                                                                    fontStyle: FontStyle.italic,
                                                                                  ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      if ((!FFAppState().polishNames && (plantsItem.namePolish != '')) ||
                                                                          (FFAppState().polishNames &&
                                                                              (plantsItem.nameCommon != '')))
                                                                        Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            Text(
                                                                              FFAppState().polishNames
                                                                                  ? FFLocalizations.of(context).getVariableText(
                                                                                      enText: 'English name',
                                                                                      plText: 'Angielska nazwa',
                                                                                    )
                                                                                  : FFLocalizations.of(context).getVariableText(
                                                                                      enText: 'Polish name',
                                                                                      plText: 'Polska nazwa',
                                                                                    ),
                                                                              style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                    font: GoogleFonts.roboto(
                                                                                      fontWeight: FlutterFlowTheme.of(context).labelSmall.fontWeight,
                                                                                      fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                                    ),
                                                                                    color: FlutterFlowTheme.of(context).secondaryText,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FlutterFlowTheme.of(context).labelSmall.fontWeight,
                                                                                    fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                                  ),
                                                                            ),
                                                                            Text(
                                                                              FFAppState().polishNames ? plantsItem.nameCommon : plantsItem.namePolish,
                                                                              style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                    font: GoogleFonts.roboto(
                                                                                      fontWeight: FlutterFlowTheme.of(context).labelLarge.fontWeight,
                                                                                      fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                    ),
                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FlutterFlowTheme.of(context).labelLarge.fontWeight,
                                                                                    fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                  ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                if (FFAppState()
                                                                    .mapHabitat)
                                                                  Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Align(
                                                                        alignment: AlignmentDirectional(
                                                                            0.0,
                                                                            -1.0),
                                                                        child:
                                                                            Text(
                                                                          FFLocalizations.of(context)
                                                                              .getText(
                                                                            'rhtj38tn' /* Habitat */,
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .labelSmall
                                                                              .override(
                                                                                font: GoogleFonts.roboto(
                                                                                  fontWeight: FlutterFlowTheme.of(context).labelSmall.fontWeight,
                                                                                  fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                                ),
                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FlutterFlowTheme.of(context).labelSmall.fontWeight,
                                                                                fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                      Stack(
                                                                        children: [
                                                                          Align(
                                                                            alignment:
                                                                                AlignmentDirectional(0.0, 0.0),
                                                                            child:
                                                                                ClipRRect(
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                              child: Image.asset(
                                                                                Theme.of(context).brightness == Brightness.dark ? 'assets/images/Polska_dark.png' : 'assets/images/Polska_light.png',
                                                                                width: 90.0,
                                                                                fit: BoxFit.cover,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          if (plantsItem
                                                                              .habitat
                                                                              .contains('Zachodniopomorskie'))
                                                                            Align(
                                                                              alignment: AlignmentDirectional(0.0, 0.0),
                                                                              child: ClipRRect(
                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                                child: Image.asset(
                                                                                  'assets/images/PL-ZPM.png',
                                                                                  width: 90.0,
                                                                                  fit: BoxFit.cover,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          if (plantsItem
                                                                              .habitat
                                                                              .contains('Pomorskie'))
                                                                            Align(
                                                                              alignment: AlignmentDirectional(0.0, 0.0),
                                                                              child: ClipRRect(
                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                                child: Image.asset(
                                                                                  'assets/images/PL-POM.png',
                                                                                  width: 90.0,
                                                                                  fit: BoxFit.cover,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          if (plantsItem
                                                                              .habitat
                                                                              .contains('Warmińsko-Mazurskie'))
                                                                            Align(
                                                                              alignment: AlignmentDirectional(0.0, 0.0),
                                                                              child: ClipRRect(
                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                                child: Image.asset(
                                                                                  'assets/images/PL-WMA.png',
                                                                                  width: 90.0,
                                                                                  fit: BoxFit.cover,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          if (plantsItem
                                                                              .habitat
                                                                              .contains('Podlaskie'))
                                                                            Align(
                                                                              alignment: AlignmentDirectional(0.0, 0.0),
                                                                              child: ClipRRect(
                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                                child: Image.asset(
                                                                                  'assets/images/PL-PDL.png',
                                                                                  width: 90.0,
                                                                                  fit: BoxFit.cover,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          if (plantsItem
                                                                              .habitat
                                                                              .contains('Lubuskie'))
                                                                            Align(
                                                                              alignment: AlignmentDirectional(0.0, 0.0),
                                                                              child: ClipRRect(
                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                                child: Image.asset(
                                                                                  'assets/images/PL-LBE.png',
                                                                                  width: 90.0,
                                                                                  fit: BoxFit.cover,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          if (plantsItem
                                                                              .habitat
                                                                              .contains('Wielkopolskie'))
                                                                            Align(
                                                                              alignment: AlignmentDirectional(0.0, 0.0),
                                                                              child: ClipRRect(
                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                                child: Image.asset(
                                                                                  'assets/images/PL-WIE.png',
                                                                                  width: 90.0,
                                                                                  fit: BoxFit.cover,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          if (plantsItem
                                                                              .habitat
                                                                              .contains('Kujawsko-Pomorskie'))
                                                                            Align(
                                                                              alignment: AlignmentDirectional(0.0, 0.0),
                                                                              child: ClipRRect(
                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                                child: Image.asset(
                                                                                  'assets/images/PL-KUJ.png',
                                                                                  width: 90.0,
                                                                                  fit: BoxFit.cover,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          if (plantsItem
                                                                              .habitat
                                                                              .contains('Łódzkie'))
                                                                            Align(
                                                                              alignment: AlignmentDirectional(0.0, 0.0),
                                                                              child: ClipRRect(
                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                                child: Image.asset(
                                                                                  'assets/images/PL-LOD.png',
                                                                                  width: 90.0,
                                                                                  fit: BoxFit.cover,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          if (plantsItem
                                                                              .habitat
                                                                              .contains('Mazowieckie'))
                                                                            Align(
                                                                              alignment: AlignmentDirectional(0.0, 0.0),
                                                                              child: ClipRRect(
                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                                child: Image.asset(
                                                                                  'assets/images/PL-MAZ.png',
                                                                                  width: 90.0,
                                                                                  fit: BoxFit.cover,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          if (plantsItem
                                                                              .habitat
                                                                              .contains('Lubelskie'))
                                                                            Align(
                                                                              alignment: AlignmentDirectional(0.0, 0.0),
                                                                              child: ClipRRect(
                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                                child: Image.asset(
                                                                                  'assets/images/PL-LBU.png',
                                                                                  width: 90.0,
                                                                                  fit: BoxFit.cover,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          if (plantsItem
                                                                              .habitat
                                                                              .contains('Dolnośląskie'))
                                                                            Align(
                                                                              alignment: AlignmentDirectional(0.0, 0.0),
                                                                              child: ClipRRect(
                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                                child: Image.asset(
                                                                                  'assets/images/PL-DOL.png',
                                                                                  width: 90.0,
                                                                                  fit: BoxFit.cover,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          if (plantsItem
                                                                              .habitat
                                                                              .contains('Opolskie'))
                                                                            Align(
                                                                              alignment: AlignmentDirectional(0.0, 0.0),
                                                                              child: ClipRRect(
                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                                child: Image.asset(
                                                                                  'assets/images/PL-OPO.png',
                                                                                  width: 90.0,
                                                                                  fit: BoxFit.cover,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          if (plantsItem
                                                                              .habitat
                                                                              .contains('Śląskie'))
                                                                            Align(
                                                                              alignment: AlignmentDirectional(0.0, 0.0),
                                                                              child: ClipRRect(
                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                                child: Image.asset(
                                                                                  'assets/images/PL-SLA.png',
                                                                                  width: 90.0,
                                                                                  fit: BoxFit.cover,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          if (plantsItem
                                                                              .habitat
                                                                              .contains('Małopolskie'))
                                                                            Align(
                                                                              alignment: AlignmentDirectional(0.0, 0.0),
                                                                              child: ClipRRect(
                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                                child: Image.asset(
                                                                                  'assets/images/PL-MAL.png',
                                                                                  width: 90.0,
                                                                                  fit: BoxFit.cover,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          if (plantsItem
                                                                              .habitat
                                                                              .contains('Świętokrzyskie'))
                                                                            Align(
                                                                              alignment: AlignmentDirectional(0.0, 0.0),
                                                                              child: ClipRRect(
                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                                child: Image.asset(
                                                                                  'assets/images/PL-SWI.png',
                                                                                  width: 90.0,
                                                                                  fit: BoxFit.cover,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          if (plantsItem
                                                                              .habitat
                                                                              .contains('Podkarpackie'))
                                                                            Align(
                                                                              alignment: AlignmentDirectional(0.0, 0.0),
                                                                              child: ClipRRect(
                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                                child: Image.asset(
                                                                                  'assets/images/PL-PDK.png',
                                                                                  width: 90.0,
                                                                                  fit: BoxFit.cover,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          if (plantsItem.habitat.contains('Cała Polska') ||
                                                                              plantsItem.habitat.contains('Entire Poland'))
                                                                            Align(
                                                                              alignment: AlignmentDirectional(0.0, 0.0),
                                                                              child: ClipRRect(
                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                                child: Image.asset(
                                                                                  'assets/images/Polska_all.png',
                                                                                  width: 90.0,
                                                                                  fit: BoxFit.cover,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                        ],
                                                                      ),
                                                                    ].divide(SizedBox(
                                                                        height:
                                                                            5.0)),
                                                                  ),
                                                              ],
                                                            ),
                                                          ].divide(SizedBox(
                                                              height: 5.0)),
                                                        ),
                                                      ),
                                                    ),
                                                    if (!FFAppState()
                                                            .mapHabitat &&
                                                        (plantsItem
                                                                    .textHabitat !=
                                                                ''))
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                -1.0, -1.0),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      5.0,
                                                                      0.0,
                                                                      5.0,
                                                                      0.0),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  'ysm3kkak' /* Habitat */,
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyLarge
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .roboto(
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyLarge
                                                                            .fontStyle,
                                                                      ),
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyLarge
                                                                          .fontStyle,
                                                                    ),
                                                              ),
                                                              Text(
                                                                plantsItem
                                                                    .textHabitat,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .roboto(
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryText,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontStyle,
                                                                    ),
                                                              ),
                                                            ].divide(SizedBox(
                                                                height: 3.0)),
                                                          ),
                                                        ),
                                                      ),
                                                    if (plantsItem.appearance !=
                                                            '')
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                -1.0, -1.0),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      5.0,
                                                                      0.0,
                                                                      5.0,
                                                                      0.0),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  '199fh0qh' /* Appearance */,
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyLarge
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .roboto(
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyLarge
                                                                            .fontStyle,
                                                                      ),
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyLarge
                                                                          .fontStyle,
                                                                    ),
                                                              ),
                                                              Text(
                                                                plantsItem
                                                                    .appearance,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .roboto(
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryText,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontStyle,
                                                                    ),
                                                              ),
                                                            ].divide(SizedBox(
                                                                height: 3.0)),
                                                          ),
                                                        ),
                                                      ),
                                                    if (plantsItem.meaning !=
                                                            '')
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                -1.0, -1.0),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      5.0,
                                                                      0.0,
                                                                      5.0,
                                                                      0.0),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  'furjaccp' /* Meaning */,
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyLarge
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .roboto(
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyLarge
                                                                            .fontStyle,
                                                                      ),
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyLarge
                                                                          .fontStyle,
                                                                    ),
                                                              ),
                                                              Text(
                                                                plantsItem
                                                                    .meaning,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .roboto(
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryText,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontStyle,
                                                                    ),
                                                              ),
                                                            ].divide(SizedBox(
                                                                height: 3.0)),
                                                          ),
                                                        ),
                                                      ),
                                                  ].divide(
                                                      SizedBox(height: 15.0)),
                                                ),
                                              ].divide(SizedBox(height: 15.0)),
                                            ),
                                          ),
                                          theme: ExpandableThemeData(
                                            tapHeaderToExpand: true,
                                            tapBodyToExpand: true,
                                            tapBodyToCollapse: true,
                                            headerAlignment:
                                                ExpandablePanelHeaderAlignment
                                                    .center,
                                            hasIcon: false,
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                }).divide(SizedBox(height: 15.0)),
                              );
                            },
                          ),
                          if (!FFAppState().addBtnOnTop)
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      context.pushNamed(
                                        AddWidget.routeName,
                                        queryParameters: {
                                          'numOfItems': serializeParam(
                                            homePlantsRecordList.length,
                                            ParamType.int,
                                          ),
                                        }.withoutNulls,
                                      );
                                    },
                                    child: Container(
                                      height: 80.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        borderRadius:
                                            BorderRadius.circular(25.0),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            15.0, 5.0, 15.0, 5.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            FaIcon(
                                              FontAwesomeIcons.plus,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              size: 26.0,
                                            ),
                                            Flexible(
                                              child: Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  's29cskpp' /* Add a new plant */,
                                                ),
                                                textAlign: TextAlign.center,
                                                maxLines: 2,
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .titleSmall
                                                    .override(
                                                      font: GoogleFonts.roboto(
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .fontStyle,
                                                      ),
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      fontSize: 18.0,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .fontWeight,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .fontStyle,
                                                      lineHeight: 1.1,
                                                    ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Flexible(
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      context.pushNamed(
                                        ReorderWidget.routeName,
                                        queryParameters: {
                                          'plantDocs': serializeParam(
                                            homePlantsRecordList,
                                            ParamType.Document,
                                            isList: true,
                                          ),
                                        }.withoutNulls,
                                        extra: <String, dynamic>{
                                          'plantDocs': homePlantsRecordList,
                                        },
                                      );
                                    },
                                    child: Container(
                                      height: 80.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        borderRadius:
                                            BorderRadius.circular(25.0),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            15.0, 5.0, 15.0, 5.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.edit_note_rounded,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              size: 34.0,
                                            ),
                                            Flexible(
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        1.0, 0.0, 0.0, 0.0),
                                                child: Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'novk5vl5' /* Change order */,
                                                  ),
                                                  textAlign: TextAlign.center,
                                                  maxLines: 2,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .titleSmall
                                                      .override(
                                                        font:
                                                            GoogleFonts.roboto(
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmall
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmall
                                                                  .fontStyle,
                                                        ),
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        fontSize: 18.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .fontStyle,
                                                        lineHeight: 1.1,
                                                      ),
                                                ),
                                              ),
                                            ),
                                          ].divide(SizedBox(width: 5.0)),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ].divide(SizedBox(width: 15.0)),
                            ),
                        ].divide(SizedBox(height: 15.0)),
                      ),
                    ),
                  ],
                ),
                if (FFAppState().addBtnOnTop)
                  Align(
                    alignment: AlignmentDirectional(1.0, 1.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 25.0, 115.0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          context.pushNamed(
                            ReorderWidget.routeName,
                            queryParameters: {
                              'plantDocs': serializeParam(
                                homePlantsRecordList,
                                ParamType.Document,
                                isList: true,
                              ),
                            }.withoutNulls,
                            extra: <String, dynamic>{
                              'plantDocs': homePlantsRecordList,
                            },
                          );
                        },
                        child: Material(
                          color: Colors.transparent,
                          elevation: 3.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Container(
                            width: 75.0,
                            height: 50.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).accent5,
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Icon(
                                Icons.edit_note_rounded,
                                color: FlutterFlowTheme.of(context).primary,
                                size: 30.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                if (FFAppState().addBtnOnTop)
                  Align(
                    alignment: AlignmentDirectional(1.0, 1.0),
                    child: Padding(
                      padding: EdgeInsets.all(25.0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          context.pushNamed(
                            AddWidget.routeName,
                            queryParameters: {
                              'numOfItems': serializeParam(
                                homePlantsRecordList.length,
                                ParamType.int,
                              ),
                            }.withoutNulls,
                          );
                        },
                        child: Material(
                          color: Colors.transparent,
                          elevation: 3.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                          child: Container(
                            width: 75.0,
                            height: 75.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).primary,
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                            child: Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: FaIcon(
                                FontAwesomeIcons.plus,
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                size: 30.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}
