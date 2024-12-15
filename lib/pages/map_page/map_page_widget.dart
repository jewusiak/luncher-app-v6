import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/place_summary_widget_widget.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:pointer_interceptor/pointer_interceptor.dart';
import 'map_page_model.dart';
export 'map_page_model.dart';

class MapPageWidget extends StatefulWidget {
  const MapPageWidget({super.key});

  @override
  State<MapPageWidget> createState() => _MapPageWidgetState();
}

class _MapPageWidgetState extends State<MapPageWidget> {
  late MapPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MapPageModel());

    _model.textController1 ??= TextEditingController();
    _model.textFieldFocusNode1 ??= FocusNode();

    _model.textController2 ??= TextEditingController();
    _model.textFieldFocusNode2 ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        resizeToAvoidBottomInset: false,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Align(
            alignment: const AlignmentDirectional(0.0, 0.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FutureBuilder<ApiCallResponse>(
                  future:
                      LuncherCoreAPIPOSTPlaceSearchGroup.searchQueryCall.call(
                    textQuery: _model.searchQuery,
                    locationLatitude: functions
                        .latLngToLocationDto(_model.placesMapsCenter)
                        ?.latitude,
                    locationLongitude: functions
                        .latLngToLocationDto(_model.placesMapsCenter)
                        ?.longitude,
                    locationRadius:
                        _model.placesMapsCenter == null ? null : 10000.0,
                    placeTypeIdentifier: _model.filteredPlaceTypeId,
                    openAtTime: (_model.filteredDayOfWeek != null &&
                                _model.filteredDayOfWeek != '') &&
                            (_model.filteredOpeningHour != null &&
                                _model.filteredOpeningHour != '')
                        ? _model.filteredOpeningHour
                        : null,
                    openAtDay: (_model.filteredDayOfWeek != null &&
                                _model.filteredDayOfWeek != '') &&
                            (_model.filteredOpeningHour != null &&
                                _model.filteredOpeningHour != '')
                        ? _model.filteredDayOfWeek
                        : null,
                    page: 0,
                    size: 200,
                  ),
                  builder: (context, snapshot) {
                    // Customize what your widget looks like when it's loading.
                    if (!snapshot.hasData) {
                      return Center(
                        child: SizedBox(
                          width: 50.0,
                          height: 50.0,
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                              FlutterFlowTheme.of(context).primary,
                            ),
                          ),
                        ),
                      );
                    }
                    final containerSearchQueryResponse = snapshot.data!;

                    return Container(
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      height: MediaQuery.sizeOf(context).height * 1.0,
                      constraints: const BoxConstraints(
                        maxWidth: 700.0,
                      ),
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      child: Stack(
                        children: [
                          FlutterFlowGoogleMap(
                            controller: _model.placesMapsController,
                            onCameraIdle: (latLng) => safeSetState(
                                () => _model.placesMapsCenter = latLng),
                            initialLocation: _model.placesMapsCenter ??=
                                const LatLng(52.237049, 21.017532),
                            markers: (functions
                                        .placeDtoListToLatLngList(
                                            (containerSearchQueryResponse
                                                        .jsonBody
                                                        .toList()
                                                        .map<PlaceDtoStruct?>(
                                                            PlaceDtoStruct
                                                                .maybeFromMap)
                                                        .toList()
                                                    as Iterable<
                                                        PlaceDtoStruct?>)
                                                .withoutNulls
                                                .toList()) ??
                                    [])
                                .map(
                                  (marker) => FlutterFlowMarker(
                                    marker.serialize(),
                                    marker,
                                    () async {
                                      _model.selectedPlace =
                                          functions.getPlaceByLocation(
                                              (containerSearchQueryResponse
                                                          .jsonBody
                                                          .toList()
                                                          .map<PlaceDtoStruct?>(
                                                              PlaceDtoStruct
                                                                  .maybeFromMap)
                                                          .toList()
                                                      as Iterable<
                                                          PlaceDtoStruct?>)
                                                  .withoutNulls
                                                  .toList(),
                                              _model.placesMapsCenter);
                                      safeSetState(() {});
                                      _model.selectedPlaceOpeningInfo =
                                          functions.calculatePlaceOpeningInfo(
                                              _model.selectedPlace,
                                              getCurrentTimestamp);
                                      safeSetState(() {});
                                    },
                                  ),
                                )
                                .toList(),
                            markerColor: GoogleMarkerColor.red,
                            mapType: MapType.normal,
                            style: GoogleMapStyle.standard,
                            initialZoom: 14.0,
                            allowInteraction: true,
                            allowZoom: true,
                            showZoomControls: true,
                            showLocation: true,
                            showCompass: false,
                            showMapToolbar: false,
                            showTraffic: false,
                            centerMapOnMarkerTap: true,
                          ),
                          if (responsiveVisibility(
                            context: context,
                            tablet: false,
                            tabletLandscape: false,
                            desktop: false,
                          ))
                            Align(
                              alignment: const AlignmentDirectional(-1.0, 1.0),
                              child: PointerInterceptor(
                                intercepting: isWeb,
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      20.0, 0.0, 0.0, 20.0),
                                  child: FlutterFlowIconButton(
                                    borderRadius: 30.0,
                                    buttonSize: 50.0,
                                    fillColor:
                                        FlutterFlowTheme.of(context).primary,
                                    icon: Icon(
                                      Icons.filter_list,
                                      color: FlutterFlowTheme.of(context).info,
                                      size: 24.0,
                                    ),
                                    onPressed: () async {
                                      _model.filtersOpen = true;
                                      safeSetState(() {});
                                    },
                                  ),
                                ),
                              ),
                            ),
                          if (responsiveVisibility(
                            context: context,
                            tablet: false,
                            tabletLandscape: false,
                            desktop: false,
                          ))
                            Align(
                              alignment: const AlignmentDirectional(0.0, 1.0),
                              child: PointerInterceptor(
                                intercepting: isWeb,
                                child: Builder(
                                  builder: (context) {
                                    if (_model.filtersOpen) {
                                      return Visibility(
                                        visible: responsiveVisibility(
                                          context: context,
                                          tablet: false,
                                          tabletLandscape: false,
                                          desktop: false,
                                        ),
                                        child: Container(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  1.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                          ),
                                          child: Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    10.0, 10.0, 10.0, 10.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Align(
                                                  alignment:
                                                      const AlignmentDirectional(
                                                          1.0, 0.0),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(5.0, 5.0,
                                                                5.0, 5.0),
                                                    child:
                                                        FlutterFlowIconButton(
                                                      borderColor:
                                                          Colors.transparent,
                                                      borderRadius: 20.0,
                                                      buttonSize: 40.0,
                                                      fillColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      icon: Icon(
                                                        Icons.close,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .alternate,
                                                        size: 24.0,
                                                      ),
                                                      onPressed: () async {
                                                        _model.filtersOpen =
                                                            false;
                                                        safeSetState(() {});
                                                      },
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 5.0, 0.0, 2.0),
                                                  child: Text(
                                                    'Kategoria',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily:
                                                              'Montserrat',
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                      const AlignmentDirectional(
                                                          -1.0, 0.0),
                                                  child: ClipRRect(
                                                    child: Container(
                                                      constraints:
                                                          const BoxConstraints(
                                                        maxHeight: 70.0,
                                                      ),
                                                      decoration:
                                                          const BoxDecoration(),
                                                      child: FutureBuilder<
                                                          ApiCallResponse>(
                                                        future: FFAppState()
                                                            .placeTypeCache(
                                                          requestFn: () =>
                                                              LuncherCoreAPIGETPlacetypeGroup
                                                                  .getAllPlaceTypesCall
                                                                  .call(),
                                                        ),
                                                        builder: (context,
                                                            snapshot) {
                                                          // Customize what your widget looks like when it's loading.
                                                          if (!snapshot
                                                              .hasData) {
                                                            return Center(
                                                              child: SizedBox(
                                                                width: 50.0,
                                                                height: 50.0,
                                                                child:
                                                                    CircularProgressIndicator(
                                                                  valueColor:
                                                                      AlwaysStoppedAnimation<
                                                                          Color>(
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                  ),
                                                                ),
                                                              ),
                                                            );
                                                          }
                                                          final choiceChipsGetAllPlaceTypesResponse =
                                                              snapshot.data!;

                                                          return FlutterFlowChoiceChips(
                                                            options: functions
                                                                .addStringToList(
                                                                    'X',
                                                                    (choiceChipsGetAllPlaceTypesResponse.succeeded ==
                                                                                true
                                                                            ? (choiceChipsGetAllPlaceTypesResponse.jsonBody.toList().map<PlaceTypeDtoStruct?>(PlaceTypeDtoStruct.maybeFromMap).toList() as Iterable<PlaceTypeDtoStruct?>)
                                                                                .withoutNulls
                                                                                .map((e) => e
                                                                                    .name)
                                                                                .toList()
                                                                            : functions
                                                                                .getEmptyStringList())
                                                                        .toList())!
                                                                .map((label) =>
                                                                    ChipData(
                                                                        label))
                                                                .toList(),
                                                            onChanged:
                                                                (val) async {
                                                              safeSetState(() =>
                                                                  _model.choiceChipsValue1 =
                                                                      val?.firstOrNull);
                                                              if (_model
                                                                      .choiceChipsValue1 ==
                                                                  'X') {
                                                                _model.filteredPlaceTypeId =
                                                                    null;
                                                                safeSetState(
                                                                    () {});
                                                                safeSetState(
                                                                    () {
                                                                  _model
                                                                      .choiceChipsValueController1
                                                                      ?.reset();
                                                                });
                                                              } else {
                                                                _model
                                                                    .filteredPlaceTypeId = (choiceChipsGetAllPlaceTypesResponse
                                                                            .jsonBody
                                                                            .toList()
                                                                            .map<PlaceTypeDtoStruct?>(PlaceTypeDtoStruct
                                                                                .maybeFromMap)
                                                                            .toList()
                                                                        as Iterable<
                                                                            PlaceTypeDtoStruct?>)
                                                                    .withoutNulls
                                                                    .where((e) =>
                                                                        e.name ==
                                                                        _model
                                                                            .choiceChipsValue1)
                                                                    .toList()
                                                                    .firstOrNull
                                                                    ?.identifier;
                                                                safeSetState(
                                                                    () {});
                                                              }
                                                            },
                                                            selectedChipStyle:
                                                                ChipStyle(
                                                              backgroundColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                              textStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Inter',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .info,
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                              iconColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .info,
                                                              iconSize: 16.0,
                                                              elevation: 0.0,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                            ),
                                                            unselectedChipStyle:
                                                                ChipStyle(
                                                              backgroundColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                              textStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Inter',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                              iconColor: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryText,
                                                              iconSize: 16.0,
                                                              elevation: 0.0,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                            ),
                                                            chipSpacing: 8.0,
                                                            rowSpacing: 5.0,
                                                            multiselect: false,
                                                            alignment:
                                                                WrapAlignment
                                                                    .start,
                                                            controller: _model
                                                                    .choiceChipsValueController1 ??=
                                                                FormFieldController<
                                                                    List<
                                                                        String>>(
                                                              [],
                                                            ),
                                                            wrapped: true,
                                                          );
                                                        },
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 5.0, 0.0, 0.0),
                                                  child: Text(
                                                    'Godzina otwarcia',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily:
                                                              'Montserrat',
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ),
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    FlutterFlowDropDown<String>(
                                                      controller: _model
                                                              .startDayDDValueController1 ??=
                                                          FormFieldController<
                                                              String>(null),
                                                      options:
                                                          List<String>.from([
                                                        'MONDAY',
                                                        'TUESDAY',
                                                        'WEDNESDAY',
                                                        'THURSDAY',
                                                        'FRIDAY',
                                                        'SATURDAY',
                                                        'SUNDAY'
                                                      ]),
                                                      optionLabels: const [
                                                        'Poniedziałek',
                                                        'Wtorek',
                                                        'Środa',
                                                        'Czwartek',
                                                        'Piątek',
                                                        'Sobota',
                                                        'Niedziela'
                                                      ],
                                                      onChanged: (val) async {
                                                        safeSetState(() => _model
                                                                .startDayDDValue1 =
                                                            val);
                                                        _model.filteredDayOfWeek =
                                                            _model
                                                                .startDayDDValue1;
                                                        safeSetState(() {});
                                                      },
                                                      width: 150.0,
                                                      height: 40.0,
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Inter',
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                      hintText:
                                                          'Dzień tygodnia',
                                                      icon: Icon(
                                                        Icons
                                                            .keyboard_arrow_down_rounded,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        size: 24.0,
                                                      ),
                                                      fillColor: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      elevation: 2.0,
                                                      borderColor: (_model.filteredDayOfWeek ==
                                                                      null ||
                                                                  _model.filteredDayOfWeek ==
                                                                      '') &&
                                                              (_model.filteredOpeningHour !=
                                                                      null &&
                                                                  _model.filteredOpeningHour !=
                                                                      '')
                                                          ? FlutterFlowTheme.of(
                                                                  context)
                                                              .tertiary
                                                          : Colors.transparent,
                                                      borderWidth: 2.0,
                                                      borderRadius: 8.0,
                                                      margin:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  12.0,
                                                                  0.0,
                                                                  12.0,
                                                                  0.0),
                                                      hidesUnderline: true,
                                                      isOverButton: false,
                                                      isSearchable: false,
                                                      isMultiSelect: false,
                                                    ),
                                                    FFButtonWidget(
                                                      onPressed: () async {
                                                        _model.timeOutput =
                                                            await actions
                                                                .show24hTimePicker(
                                                          context,
                                                          _model
                                                              .filteredOpeningHour,
                                                        );
                                                        _model.filteredOpeningHour =
                                                            _model.timeOutput;
                                                        safeSetState(() {});

                                                        safeSetState(() {});
                                                      },
                                                      text: valueOrDefault<
                                                          String>(
                                                        _model
                                                            .filteredOpeningHour,
                                                        '-',
                                                      ),
                                                      icon: const Icon(
                                                        Icons
                                                            .access_time_outlined,
                                                        size: 18.0,
                                                      ),
                                                      options: FFButtonOptions(
                                                        width: 100.0,
                                                        height: 40.0,
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    16.0,
                                                                    0.0,
                                                                    16.0,
                                                                    0.0),
                                                        iconPadding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .primaryBackground,
                                                        textStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Montserrat',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  fontSize:
                                                                      14.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                        elevation: 0.0,
                                                        borderSide: BorderSide(
                                                          color: (_model.filteredDayOfWeek !=
                                                                          null &&
                                                                      _model.filteredDayOfWeek !=
                                                                          '') &&
                                                                  (_model.filteredOpeningHour ==
                                                                          null ||
                                                                      _model.filteredOpeningHour ==
                                                                          '')
                                                              ? FlutterFlowTheme
                                                                      .of(
                                                                          context)
                                                                  .tertiary
                                                              : FlutterFlowTheme
                                                                      .of(context)
                                                                  .alternate,
                                                          width: 2.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                    ),
                                                    FFButtonWidget(
                                                      onPressed: () async {
                                                        _model.filteredDayOfWeek =
                                                            null;
                                                        _model.filteredOpeningHour =
                                                            null;
                                                        safeSetState(() {});
                                                        safeSetState(() {
                                                          _model
                                                              .startDayDDValueController1
                                                              ?.value = '';
                                                        });
                                                      },
                                                      text: 'X',
                                                      options: FFButtonOptions(
                                                        width: 28.0,
                                                        height: 28.0,
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        iconPadding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        color:
                                                            const Color(0x004B39EF),
                                                        textStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                ),
                                                        elevation: 0.0,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      showLoadingIndicator:
                                                          false,
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Expanded(
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    5.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: SizedBox(
                                                          width:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .width *
                                                                  1.0,
                                                          child: TextFormField(
                                                            controller: _model
                                                                .textController1,
                                                            focusNode: _model
                                                                .textFieldFocusNode1,
                                                            onChanged: (_) =>
                                                                EasyDebounce
                                                                    .debounce(
                                                              '_model.textController1',
                                                              const Duration(
                                                                  milliseconds:
                                                                      700),
                                                              () async {
                                                                _model
                                                                    .searchQuery = _model.textController1.text ==
                                                                            ''
                                                                    ? null
                                                                    : _model
                                                                        .textController1
                                                                        .text;
                                                                safeSetState(
                                                                    () {});
                                                              },
                                                            ),
                                                            autofocus: false,
                                                            obscureText: false,
                                                            decoration:
                                                                InputDecoration(
                                                              isDense: true,
                                                              labelText:
                                                                  'Wyszukaj lokal',
                                                              labelStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Inter',
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                              alignLabelWithHint:
                                                                  true,
                                                              hintStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Inter',
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                              enabledBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    const BorderSide(
                                                                  color: Color(
                                                                      0x00000000),
                                                                  width: 1.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                              ),
                                                              focusedBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    const BorderSide(
                                                                  color: Color(
                                                                      0x00000000),
                                                                  width: 1.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                              ),
                                                              errorBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .error,
                                                                  width: 1.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                              ),
                                                              focusedErrorBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .error,
                                                                  width: 1.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                              ),
                                                              filled: true,
                                                              fillColor: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                              suffixIcon: _model
                                                                      .textController1!
                                                                      .text
                                                                      .isNotEmpty
                                                                  ? InkWell(
                                                                      onTap:
                                                                          () async {
                                                                        _model
                                                                            .textController1
                                                                            ?.clear();
                                                                        _model
                                                                            .searchQuery = _model.textController1.text == ''
                                                                            ? null
                                                                            : _model.textController1.text;
                                                                        safeSetState(
                                                                            () {});
                                                                        safeSetState(
                                                                            () {});
                                                                      },
                                                                      child:
                                                                          const Icon(
                                                                        Icons
                                                                            .clear,
                                                                        size:
                                                                            14.0,
                                                                      ),
                                                                    )
                                                                  : null,
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                            cursorColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                            validator: _model
                                                                .textController1Validator
                                                                .asValidator(
                                                                    context),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    } else {
                                      return Container(
                                        width: 0.0,
                                        height: 0.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                        ),
                                      );
                                    }
                                  },
                                ),
                              ),
                            ),
                          Align(
                            alignment: const AlignmentDirectional(0.0, 1.0),
                            child: PointerInterceptor(
                              intercepting: isWeb,
                              child: Container(
                                constraints: const BoxConstraints(
                                  maxHeight: 350.0,
                                ),
                                decoration: const BoxDecoration(),
                                child: Builder(
                                  builder: (context) {
                                    if ((_model.selectedPlace != null) &&
                                        (_model.selectedPlaceOpeningInfo !=
                                            null)) {
                                      return Stack(
                                        children: [
                                          if (responsiveVisibility(
                                            context: context,
                                            tablet: false,
                                            tabletLandscape: false,
                                            desktop: false,
                                          ))
                                            wrapWithModel(
                                              model: _model
                                                  .placeSummaryWidgetModel1,
                                              updateCallback: () =>
                                                  safeSetState(() {}),
                                              child: PlaceSummaryWidgetWidget(
                                                selectedPlace:
                                                    _model.selectedPlace!,
                                                openingInfo: _model
                                                    .selectedPlaceOpeningInfo!,
                                              ),
                                            ),
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    15.0, 15.0, 0.0, 0.0),
                                            child: FlutterFlowIconButton(
                                              borderColor: Colors.transparent,
                                              borderRadius: 20.0,
                                              buttonSize: 40.0,
                                              fillColor: const Color(0x004B39EF),
                                              icon: Icon(
                                                Icons.close,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                size: 24.0,
                                              ),
                                              onPressed: () async {
                                                _model.selectedPlace = null;
                                                _model.selectedPlaceOpeningInfo =
                                                    null;
                                                safeSetState(() {});
                                              },
                                            ),
                                          ),
                                        ],
                                      );
                                    } else {
                                      return Container(
                                        width: 0.0,
                                        height: 0.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                        ),
                                      );
                                    }
                                  },
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
                if (responsiveVisibility(
                  context: context,
                  phone: false,
                ))
                  Flexible(
                    child: Container(
                      constraints: const BoxConstraints(
                        minWidth: 200.0,
                      ),
                      decoration: const BoxDecoration(),
                      child: Visibility(
                        visible: responsiveVisibility(
                          context: context,
                          phone: false,
                          tablet: false,
                        ),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              20.0, 0.0, 0.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                width: 350.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      10.0, 10.0, 10.0, 10.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 5.0, 0.0, 2.0),
                                        child: Text(
                                          'Kategoria',
                                          style: FlutterFlowTheme.of(context)
                                              .titleSmall
                                              .override(
                                                fontFamily: 'Montserrat',
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ),
                                      Align(
                                        alignment:
                                            const AlignmentDirectional(-1.0, 0.0),
                                        child: ClipRRect(
                                          child: Container(
                                            constraints: const BoxConstraints(
                                              maxHeight: 70.0,
                                            ),
                                            decoration: const BoxDecoration(),
                                            child:
                                                FutureBuilder<ApiCallResponse>(
                                              future:
                                                  FFAppState().placeTypeCache(
                                                requestFn: () =>
                                                    LuncherCoreAPIGETPlacetypeGroup
                                                        .getAllPlaceTypesCall
                                                        .call(),
                                              ),
                                              builder: (context, snapshot) {
                                                // Customize what your widget looks like when it's loading.
                                                if (!snapshot.hasData) {
                                                  return Center(
                                                    child: SizedBox(
                                                      width: 50.0,
                                                      height: 50.0,
                                                      child:
                                                          CircularProgressIndicator(
                                                        valueColor:
                                                            AlwaysStoppedAnimation<
                                                                Color>(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                }
                                                final choiceChipsGetAllPlaceTypesResponse =
                                                    snapshot.data!;

                                                return FlutterFlowChoiceChips(
                                                  options: functions
                                                      .addStringToList(
                                                          'X',
                                                          (choiceChipsGetAllPlaceTypesResponse
                                                                          .succeeded ==
                                                                      true
                                                                  ? (choiceChipsGetAllPlaceTypesResponse
                                                                              .jsonBody
                                                                              .toList()
                                                                              .map<PlaceTypeDtoStruct?>(PlaceTypeDtoStruct
                                                                                  .maybeFromMap)
                                                                              .toList()
                                                                          as Iterable<
                                                                              PlaceTypeDtoStruct?>)
                                                                      .withoutNulls
                                                                      .map((e) => e
                                                                          .name)
                                                                      .toList()
                                                                  : functions
                                                                      .getEmptyStringList())
                                                              .toList())!
                                                      .map((label) =>
                                                          ChipData(label))
                                                      .toList(),
                                                  onChanged: (val) async {
                                                    safeSetState(() => _model
                                                            .choiceChipsValue2 =
                                                        val?.firstOrNull);
                                                    if (_model
                                                            .choiceChipsValue2 ==
                                                        'X') {
                                                      _model.filteredPlaceTypeId =
                                                          null;
                                                      safeSetState(() {});
                                                      safeSetState(() {
                                                        _model
                                                            .choiceChipsValueController2
                                                            ?.reset();
                                                      });
                                                    } else {
                                                      _model.filteredPlaceTypeId =
                                                          (choiceChipsGetAllPlaceTypesResponse
                                                                      .jsonBody
                                                                      .toList()
                                                                      .map<PlaceTypeDtoStruct?>(
                                                                          PlaceTypeDtoStruct
                                                                              .maybeFromMap)
                                                                      .toList()
                                                                  as Iterable<
                                                                      PlaceTypeDtoStruct?>)
                                                              .withoutNulls
                                                              .where((e) =>
                                                                  e.name ==
                                                                  _model
                                                                      .choiceChipsValue2)
                                                              .toList()
                                                              .firstOrNull
                                                              ?.identifier;
                                                      safeSetState(() {});
                                                    }
                                                  },
                                                  selectedChipStyle: ChipStyle(
                                                    backgroundColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primary,
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .info,
                                                          letterSpacing: 0.0,
                                                        ),
                                                    iconColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .info,
                                                    iconSize: 16.0,
                                                    elevation: 0.0,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  unselectedChipStyle:
                                                      ChipStyle(
                                                    backgroundColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .secondaryBackground,
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          letterSpacing: 0.0,
                                                        ),
                                                    iconColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .secondaryText,
                                                    iconSize: 16.0,
                                                    elevation: 0.0,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  chipSpacing: 8.0,
                                                  rowSpacing: 5.0,
                                                  multiselect: false,
                                                  alignment:
                                                      WrapAlignment.start,
                                                  controller: _model
                                                          .choiceChipsValueController2 ??=
                                                      FormFieldController<
                                                          List<String>>(
                                                    [],
                                                  ),
                                                  wrapped: true,
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 5.0, 0.0, 0.0),
                                        child: Text(
                                          'Godzina otwarcia',
                                          style: FlutterFlowTheme.of(context)
                                              .titleSmall
                                              .override(
                                                fontFamily: 'Montserrat',
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          FlutterFlowDropDown<String>(
                                            controller: _model
                                                    .startDayDDValueController2 ??=
                                                FormFieldController<String>(
                                                    null),
                                            options: List<String>.from([
                                              'MONDAY',
                                              'TUESDAY',
                                              'WEDNESDAY',
                                              'THURSDAY',
                                              'FRIDAY',
                                              'SATURDAY',
                                              'SUNDAY'
                                            ]),
                                            optionLabels: const [
                                              'Poniedziałek',
                                              'Wtorek',
                                              'Środa',
                                              'Czwartek',
                                              'Piątek',
                                              'Sobota',
                                              'Niedziela'
                                            ],
                                            onChanged: (val) async {
                                              safeSetState(() => _model
                                                  .startDayDDValue2 = val);
                                              _model.filteredDayOfWeek =
                                                  _model.startDayDDValue2;
                                              safeSetState(() {});
                                            },
                                            width: 150.0,
                                            height: 40.0,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Inter',
                                                      letterSpacing: 0.0,
                                                    ),
                                            hintText: 'Dzień tygodnia',
                                            icon: Icon(
                                              Icons.keyboard_arrow_down_rounded,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              size: 24.0,
                                            ),
                                            fillColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondaryBackground,
                                            elevation: 2.0,
                                            borderColor: (_model.filteredDayOfWeek ==
                                                            null ||
                                                        _model.filteredDayOfWeek ==
                                                            '') &&
                                                    (_model.filteredOpeningHour !=
                                                            null &&
                                                        _model.filteredOpeningHour !=
                                                            '')
                                                ? FlutterFlowTheme.of(context)
                                                    .tertiary
                                                : Colors.transparent,
                                            borderWidth: 2.0,
                                            borderRadius: 8.0,
                                            margin:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    12.0, 0.0, 12.0, 0.0),
                                            hidesUnderline: true,
                                            isOverButton: false,
                                            isSearchable: false,
                                            isMultiSelect: false,
                                          ),
                                          FFButtonWidget(
                                            onPressed: () async {
                                              _model.timeOutput2 = await actions
                                                  .show24hTimePicker(
                                                context,
                                                _model.filteredOpeningHour,
                                              );
                                              _model.filteredOpeningHour =
                                                  _model.timeOutput2;
                                              safeSetState(() {});

                                              safeSetState(() {});
                                            },
                                            text: valueOrDefault<String>(
                                              _model.filteredOpeningHour,
                                              '-',
                                            ),
                                            icon: const Icon(
                                              Icons.access_time_outlined,
                                              size: 18.0,
                                            ),
                                            options: FFButtonOptions(
                                              width: 100.0,
                                              height: 40.0,
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 0.0, 16.0, 0.0),
                                              iconPadding: const EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                              textStyle: FlutterFlowTheme.of(
                                                      context)
                                                  .titleSmall
                                                  .override(
                                                    fontFamily: 'Montserrat',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    fontSize: 14.0,
                                                    letterSpacing: 0.0,
                                                  ),
                                              elevation: 0.0,
                                              borderSide: BorderSide(
                                                color: (_model.filteredDayOfWeek !=
                                                                null &&
                                                            _model.filteredDayOfWeek !=
                                                                '') &&
                                                        (_model.filteredOpeningHour ==
                                                                null ||
                                                            _model.filteredOpeningHour ==
                                                                '')
                                                    ? FlutterFlowTheme.of(
                                                            context)
                                                        .tertiary
                                                    : FlutterFlowTheme.of(
                                                            context)
                                                        .alternate,
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                          ),
                                          FFButtonWidget(
                                            onPressed: () async {
                                              _model.filteredDayOfWeek = null;
                                              _model.filteredOpeningHour = null;
                                              safeSetState(() {});
                                              safeSetState(() {
                                                _model
                                                    .startDayDDValueController2
                                                    ?.value = '';
                                              });
                                            },
                                            text: 'X',
                                            options: FFButtonOptions(
                                              width: 28.0,
                                              height: 28.0,
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              iconPadding: const EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color: const Color(0x004B39EF),
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                              elevation: 0.0,
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            showLoadingIndicator: false,
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Expanded(
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 5.0, 0.0, 0.0),
                                              child: SizedBox(
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        1.0,
                                                child: TextFormField(
                                                  controller:
                                                      _model.textController2,
                                                  focusNode: _model
                                                      .textFieldFocusNode2,
                                                  onChanged: (_) =>
                                                      EasyDebounce.debounce(
                                                    '_model.textController2',
                                                    const Duration(milliseconds: 700),
                                                    () async {
                                                      _model
                                                          .searchQuery = _model.textController2
                                                                      .text ==
                                                                  ''
                                                          ? null
                                                          : _model
                                                              .textController2
                                                              .text;
                                                      safeSetState(() {});
                                                    },
                                                  ),
                                                  autofocus: false,
                                                  obscureText: false,
                                                  decoration: InputDecoration(
                                                    isDense: true,
                                                    labelText: 'Wyszukaj lokal',
                                                    labelStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          letterSpacing: 0.0,
                                                        ),
                                                    alignLabelWithHint: true,
                                                    hintStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          letterSpacing: 0.0,
                                                        ),
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderSide: const BorderSide(
                                                        color:
                                                            Color(0x00000000),
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderSide: const BorderSide(
                                                        color:
                                                            Color(0x00000000),
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    errorBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .error,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    focusedErrorBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .error,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    filled: true,
                                                    fillColor: FlutterFlowTheme
                                                            .of(context)
                                                        .secondaryBackground,
                                                    suffixIcon:
                                                        _model.textController2!
                                                                .text.isNotEmpty
                                                            ? InkWell(
                                                                onTap:
                                                                    () async {
                                                                  _model
                                                                      .textController2
                                                                      ?.clear();
                                                                  _model
                                                                      .searchQuery = _model.textController2.text ==
                                                                              ''
                                                                      ? null
                                                                      : _model
                                                                          .textController2
                                                                          .text;
                                                                  safeSetState(
                                                                      () {});
                                                                  safeSetState(
                                                                      () {});
                                                                },
                                                                child: const Icon(
                                                                  Icons.clear,
                                                                  size: 14.0,
                                                                ),
                                                              )
                                                            : null,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        letterSpacing: 0.0,
                                                      ),
                                                  cursorColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primaryText,
                                                  validator: _model
                                                      .textController2Validator
                                                      .asValidator(context),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Builder(
                                builder: (context) {
                                  if ((_model.selectedPlace != null) &&
                                      (_model.selectedPlaceOpeningInfo !=
                                          null)) {
                                    return Container(
                                      width: 350.0,
                                      height:
                                          MediaQuery.sizeOf(context).height *
                                              0.55,
                                      decoration: const BoxDecoration(),
                                      child: wrapWithModel(
                                        model: _model.placeSummaryWidgetModel2,
                                        updateCallback: () =>
                                            safeSetState(() {}),
                                        child: PlaceSummaryWidgetWidget(
                                          selectedPlace: _model.selectedPlace!,
                                          openingInfo:
                                              _model.selectedPlaceOpeningInfo!,
                                        ),
                                      ),
                                    );
                                  } else {
                                    return Opacity(
                                      opacity: 0.0,
                                      child: Container(
                                        width: 10.0,
                                        height: 10.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                        ),
                                      ),
                                    );
                                  }
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
