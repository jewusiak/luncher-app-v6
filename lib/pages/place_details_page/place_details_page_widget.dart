import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/no_data_available_component_widget.dart';
import '/components/opening_time_wrap_widget.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:octo_image/octo_image.dart';
import 'package:share_plus/share_plus.dart';
import 'place_details_page_model.dart';
export 'place_details_page_model.dart';

class PlaceDetailsPageWidget extends StatefulWidget {
  const PlaceDetailsPageWidget({
    super.key,
    required this.placeId,
  });

  final String? placeId;

  @override
  State<PlaceDetailsPageWidget> createState() => _PlaceDetailsPageWidgetState();
}

class _PlaceDetailsPageWidgetState extends State<PlaceDetailsPageWidget> {
  late PlaceDetailsPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PlaceDetailsPageModel());

    _model.expandableExpandableController1 =
        ExpandableController(initialExpanded: false);
    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ApiCallResponse>(
      future: LuncherCoreAPIGETPlaceUuidGroup.getByIdCall.call(
        uuid: widget.placeId,
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
        final placeDetailsPageGetByIdResponse = snapshot.data!;

        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            appBar: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).primary,
              automaticallyImplyLeading: false,
              leading: FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30.0,
                borderWidth: 1.0,
                buttonSize: 60.0,
                icon: const Icon(
                  Icons.arrow_back_rounded,
                  color: Colors.white,
                  size: 30.0,
                ),
                onPressed: () async {
                  context.pop();
                },
              ),
              actions: [
                Builder(
                  builder: (context) => Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                    child: FlutterFlowIconButton(
                      borderRadius: 8.0,
                      buttonSize: 40.0,
                      fillColor: FlutterFlowTheme.of(context).primary,
                      icon: Icon(
                        Icons.share,
                        color: FlutterFlowTheme.of(context).info,
                        size: 24.0,
                      ),
                      onPressed: () async {
                        if (isWeb) {
                          await Clipboard.setData(ClipboardData(
                              text:
                                  'http://pre.luncher.pl${GoRouterState.of(context).uri.toString()}'));
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'Skopiowano link!',
                                style: TextStyle(
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                ),
                              ),
                              duration: const Duration(milliseconds: 2000),
                              backgroundColor:
                                  FlutterFlowTheme.of(context).secondary,
                            ),
                          );
                        } else {
                          await Share.share(
                            'http://pre.luncher.pl${GoRouterState.of(context).uri.toString()}',
                            sharePositionOrigin: getWidgetBoundingBox(context),
                          );
                        }
                      },
                    ),
                  ),
                ),
              ],
              centerTitle: true,
              elevation: 2.0,
            ),
            body: SafeArea(
              top: true,
              child: Align(
                alignment: const AlignmentDirectional(0.0, 0.0),
                child: Container(
                  constraints: const BoxConstraints(
                    maxWidth: 1200.0,
                  ),
                  decoration: const BoxDecoration(),
                  child: Align(
                    alignment: const AlignmentDirectional(0.0, -1.0),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Wrap(
                            spacing: 30.0,
                            runSpacing: 0.0,
                            alignment: WrapAlignment.center,
                            crossAxisAlignment: WrapCrossAlignment.center,
                            direction: Axis.horizontal,
                            runAlignment: WrapAlignment.start,
                            verticalDirection: VerticalDirection.up,
                            clipBehavior: Clip.none,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    10.0, 0.0, 10.0, 0.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 20.0, 0.0, 0.0),
                                      child: Text(
                                        valueOrDefault<String>(
                                          PlaceDtoStruct.maybeFromMap(
                                                  placeDetailsPageGetByIdResponse
                                                      .jsonBody)
                                              ?.name,
                                          '-',
                                        ),
                                        maxLines: 2,
                                        style: FlutterFlowTheme.of(context)
                                            .headlineSmall
                                            .override(
                                              fontFamily: 'Montserrat',
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ),
                                    Text(
                                      functions.addressDtoToString(
                                          PlaceDtoStruct.maybeFromMap(
                                                  placeDetailsPageGetByIdResponse
                                                      .jsonBody)
                                              ?.address)!,
                                      textAlign: TextAlign.center,
                                      maxLines: 2,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 10.0, 0.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          FlutterFlowIconButton(
                                            borderRadius: 20.0,
                                            buttonSize: 40.0,
                                            fillColor:
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                            icon: Icon(
                                              Icons.map_sharp,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .info,
                                              size: 20.0,
                                            ),
                                            onPressed: () async {
                                              if (PlaceDtoStruct.maybeFromMap(
                                                              placeDetailsPageGetByIdResponse
                                                                  .jsonBody)
                                                          ?.googleMapsReference !=
                                                      null &&
                                                  PlaceDtoStruct.maybeFromMap(
                                                              placeDetailsPageGetByIdResponse
                                                                  .jsonBody)
                                                          ?.googleMapsReference !=
                                                      '') {
                                                await launchURL(
                                                    'https://www.google.com/maps/search/?api=1&query=place&query_place_id=${PlaceDtoStruct.maybeFromMap(placeDetailsPageGetByIdResponse.jsonBody)?.googleMapsReference}');
                                              } else {
                                                await launchMap(
                                                  address:
                                                      '${PlaceDtoStruct.maybeFromMap(placeDetailsPageGetByIdResponse.jsonBody)?.name}, ${functions.addressDtoToString(PlaceDtoStruct.maybeFromMap(placeDetailsPageGetByIdResponse.jsonBody)?.address)}',
                                                  title: '',
                                                );
                                              }
                                            },
                                          ),
                                          if (PlaceDtoStruct.maybeFromMap(
                                                          placeDetailsPageGetByIdResponse
                                                              .jsonBody)
                                                      ?.facebookPageId !=
                                                  null &&
                                              PlaceDtoStruct.maybeFromMap(
                                                          placeDetailsPageGetByIdResponse
                                                              .jsonBody)
                                                      ?.facebookPageId !=
                                                  '')
                                            FlutterFlowIconButton(
                                              borderColor: Colors.transparent,
                                              borderRadius: 20.0,
                                              buttonSize: 40.0,
                                              fillColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              icon: FaIcon(
                                                FontAwesomeIcons.facebookF,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .info,
                                                size: 16.0,
                                              ),
                                              onPressed: () async {
                                                await launchURL(
                                                    'https://www.facebook.com/${PlaceDtoStruct.maybeFromMap(placeDetailsPageGetByIdResponse.jsonBody)?.facebookPageId}');
                                              },
                                            ),
                                          if (PlaceDtoStruct.maybeFromMap(
                                                          placeDetailsPageGetByIdResponse
                                                              .jsonBody)
                                                      ?.instagramHandle !=
                                                  null &&
                                              PlaceDtoStruct.maybeFromMap(
                                                          placeDetailsPageGetByIdResponse
                                                              .jsonBody)
                                                      ?.instagramHandle !=
                                                  '')
                                            FlutterFlowIconButton(
                                              borderColor: Colors.transparent,
                                              borderRadius: 20.0,
                                              buttonSize: 40.0,
                                              fillColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              icon: FaIcon(
                                                FontAwesomeIcons.instagram,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .info,
                                                size: 18.0,
                                              ),
                                              onPressed: () async {
                                                await launchURL(
                                                    'https://www.instagram.com/${PlaceDtoStruct.maybeFromMap(placeDetailsPageGetByIdResponse.jsonBody)?.instagramHandle}');
                                              },
                                            ),
                                          if (PlaceDtoStruct.maybeFromMap(
                                                          placeDetailsPageGetByIdResponse
                                                              .jsonBody)
                                                      ?.webpageUrl !=
                                                  null &&
                                              PlaceDtoStruct.maybeFromMap(
                                                          placeDetailsPageGetByIdResponse
                                                              .jsonBody)
                                                      ?.webpageUrl !=
                                                  '')
                                            FlutterFlowIconButton(
                                              borderColor: Colors.transparent,
                                              borderRadius: 20.0,
                                              buttonSize: 40.0,
                                              fillColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              icon: Icon(
                                                Icons.language_sharp,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .info,
                                                size: 18.0,
                                              ),
                                              onPressed: () async {
                                                await launchURL(
                                                    PlaceDtoStruct.maybeFromMap(
                                                            placeDetailsPageGetByIdResponse
                                                                .jsonBody)!
                                                        .webpageUrl);
                                              },
                                            ),
                                        ].divide(const SizedBox(width: 10.0)),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 15.0, 0.0, 0.0),
                                child: Builder(
                                  builder: (context) {
                                    final imagesList = PlaceDtoStruct.maybeFromMap(
                                                placeDetailsPageGetByIdResponse
                                                    .jsonBody)
                                            ?.images
                                            .toList() ??
                                        [];

                                    return SizedBox(
                                      width: 500.0,
                                      height: 247.0,
                                      child: CarouselSlider.builder(
                                        itemCount: imagesList.length,
                                        itemBuilder:
                                            (context, imagesListIndex, _) {
                                          final imagesListItem =
                                              imagesList[imagesListIndex];
                                          return InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              await Navigator.push(
                                                context,
                                                PageTransition(
                                                  type: PageTransitionType.fade,
                                                  child:
                                                      FlutterFlowExpandedImageView(
                                                    image: OctoImage(
                                                      placeholderBuilder: (_) =>
                                                          SizedBox.expand(
                                                        child: Image(
                                                          image: BlurHashImage(
                                                              imagesListItem
                                                                  .blurHash),
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                      image:
                                                          CachedNetworkImageProvider(
                                                        imagesListItem
                                                            .accessUrl,
                                                      ),
                                                      fit: BoxFit.contain,
                                                      errorBuilder: (context,
                                                              error,
                                                              stackTrace) =>
                                                          Image.asset(
                                                        'assets/images/error_image.png',
                                                        fit: BoxFit.contain,
                                                      ),
                                                    ),
                                                    allowRotation: false,
                                                    tag: imagesListItem
                                                        .accessUrl,
                                                    useHeroAnimation: true,
                                                  ),
                                                ),
                                              );
                                            },
                                            child: Hero(
                                              tag: imagesListItem.accessUrl,
                                              transitionOnUserGestures: true,
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                child: OctoImage(
                                                  placeholderBuilder: (_) =>
                                                      SizedBox.expand(
                                                    child: Image(
                                                      image: BlurHashImage(
                                                          imagesListItem
                                                              .blurHash),
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                  image:
                                                      CachedNetworkImageProvider(
                                                    imagesListItem.accessUrl,
                                                  ),
                                                  width: 200.0,
                                                  height: 105.0,
                                                  fit: BoxFit.cover,
                                                  errorBuilder: (context, error,
                                                          stackTrace) =>
                                                      Image.asset(
                                                    'assets/images/error_image.png',
                                                    width: 200.0,
                                                    height: 105.0,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                        carouselController:
                                            _model.carouselController ??=
                                                CarouselSliderController(),
                                        options: CarouselOptions(
                                          initialPage: max(
                                              0,
                                              min(
                                                  valueOrDefault<int>(
                                                    PlaceDtoStruct.maybeFromMap(
                                                                    placeDetailsPageGetByIdResponse
                                                                        .jsonBody)!
                                                                .images
                                                                .length <
                                                            2
                                                        ? 0
                                                        : 1,
                                                    0,
                                                  ),
                                                  imagesList.length - 1)),
                                          viewportFraction: 0.8,
                                          disableCenter: true,
                                          enlargeCenterPage: true,
                                          enlargeFactor: 0.25,
                                          enableInfiniteScroll: true,
                                          scrollDirection: Axis.horizontal,
                                          autoPlay: false,
                                          onPageChanged: (index, _) => _model
                                              .carouselCurrentIndex = index,
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                              Container(
                                decoration: const BoxDecoration(),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                10.0, 0.0, 10.0, 0.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 15.0, 0.0, 0.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      boxShadow: const [
                                        BoxShadow(
                                          blurRadius: 3.0,
                                          color: Color(0x33000000),
                                          offset: Offset(
                                            0.0,
                                            1.0,
                                          ),
                                        )
                                      ],
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(15.0),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15.0),
                                        ),
                                        child: Container(
                                          width: 400.0,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          child: ExpandableNotifier(
                                            controller: _model
                                                .expandableExpandableController1,
                                            child: ExpandablePanel(
                                              header: wrapWithModel(
                                                model:
                                                    _model.openingTimeWrapModel,
                                                updateCallback: () =>
                                                    safeSetState(() {}),
                                                child: OpeningTimeWrapWidget(
                                                  place: PlaceDtoStruct
                                                      .maybeFromMap(
                                                          placeDetailsPageGetByIdResponse
                                                              .jsonBody)!,
                                                ),
                                              ),
                                              collapsed: Container(),
                                              expanded: Align(
                                                alignment: const AlignmentDirectional(
                                                    0.0, -1.0),
                                                child: Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 10.0, 0.0, 10.0),
                                                  child: Builder(
                                                    builder: (context) {
                                                      final owList = PlaceDtoStruct
                                                                  .maybeFromMap(
                                                                      placeDetailsPageGetByIdResponse
                                                                          .jsonBody)
                                                              ?.openingWindows
                                                              .toList() ??
                                                          [];

                                                      return Column(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        children: List.generate(
                                                            owList.length,
                                                            (owListIndex) {
                                                          final owListItem =
                                                              owList[
                                                                  owListIndex];
                                                          return Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Text(
                                                                functions.dayOfWeekEnglishToPolish(
                                                                    owListItem
                                                                        .startTime
                                                                        .day)!,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyLarge
                                                                    .override(
                                                                      fontFamily:
                                                                          'Inter',
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                    ),
                                                              ),
                                                              Text(
                                                                ' ${owListItem.startTime.time} - ${owListItem.endTime.time}',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyLarge
                                                                    .override(
                                                                      fontFamily:
                                                                          'Inter',
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                              ),
                                                            ],
                                                          );
                                                        }).divide(const SizedBox(
                                                            height: 5.0)),
                                                      );
                                                    },
                                                  ),
                                                ),
                                              ),
                                              theme: const ExpandableThemeData(
                                                tapHeaderToExpand: true,
                                                tapBodyToExpand: false,
                                                tapBodyToCollapse: false,
                                                headerAlignment:
                                                    ExpandablePanelHeaderAlignment
                                                        .center,
                                                hasIcon: true,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 20.0, 0.0, 0.0),
                                  child: Text(
                                    'Oferty lunchowe',
                                    style: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .override(
                                          fontFamily: 'Montserrat',
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ),
                                Container(
                                  constraints: const BoxConstraints(
                                    maxWidth: 700.0,
                                  ),
                                  decoration: const BoxDecoration(),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 10.0, 0.0, 0.0),
                                    child: Builder(
                                      builder: (context) {
                                        final menuOffers =
                                            PlaceDtoStruct.maybeFromMap(
                                                        placeDetailsPageGetByIdResponse
                                                            .jsonBody)
                                                    ?.menuOffers
                                                    .toList() ??
                                                [];
                                        if (menuOffers.isEmpty) {
                                          return const Center(
                                            child:
                                                NoDataAvailableComponentWidget(
                                              message:
                                                  'Brak danych o lunchach :(',
                                            ),
                                          );
                                        }

                                        return Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children:
                                              List.generate(menuOffers.length,
                                                  (menuOffersIndex) {
                                            final menuOffersItem =
                                                menuOffers[menuOffersIndex];
                                            return Container(
                                              decoration: BoxDecoration(
                                                boxShadow: const [
                                                  BoxShadow(
                                                    blurRadius: 3.0,
                                                    color: Color(0x33000000),
                                                    offset: Offset(
                                                      0.0,
                                                      1.0,
                                                    ),
                                                  )
                                                ],
                                                borderRadius:
                                                    BorderRadius.circular(15.0),
                                              ),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(15.0),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15.0),
                                                  ),
                                                  child: Container(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    child: ExpandableNotifier(
                                                      initialExpanded: false,
                                                      child: ExpandablePanel(
                                                        header: Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      10.0,
                                                                      10.0,
                                                                      10.0,
                                                                      10.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            5.0,
                                                                            15.0,
                                                                            5.0),
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .min,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    AutoSizeText(
                                                                      menuOffersItem
                                                                          .name,
                                                                      minFontSize:
                                                                          16.0,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Montserrat',
                                                                            letterSpacing:
                                                                                0.0,
                                                                          ),
                                                                    ),
                                                                    if (menuOffersItem
                                                                        .beingServed)
                                                                      Text(
                                                                        'Aktualnie serwowana!',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Inter',
                                                                              color: menuOffersItem.beingServed ? FlutterFlowTheme.of(context).success : FlutterFlowTheme.of(context).primaryText,
                                                                              letterSpacing: 0.0,
                                                                            ),
                                                                      ),
                                                                  ],
                                                                ),
                                                              ),
                                                              Text(
                                                                '${menuOffersItem.basePrice.amount.toString()} ${valueOrDefault<String>(
                                                                  menuOffersItem
                                                                      .basePrice
                                                                      .currencyCode,
                                                                  'PLN',
                                                                )}',
                                                                textAlign:
                                                                    TextAlign
                                                                        .end,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelLarge
                                                                    .override(
                                                                      fontFamily:
                                                                          'Inter',
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        collapsed: Container(),
                                                        expanded: Align(
                                                          alignment:
                                                              const AlignmentDirectional(
                                                                  0.0, -1.0),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10.0,
                                                                        0.0,
                                                                        10.0,
                                                                        10.0),
                                                            child: Container(
                                                              decoration:
                                                                  BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            15.0),
                                                              ),
                                                              child: Builder(
                                                                builder:
                                                                    (context) {
                                                                  final offerParts =
                                                                      menuOffersItem
                                                                          .parts
                                                                          .toList();

                                                                  return Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .min,
                                                                    children: List.generate(
                                                                        offerParts
                                                                            .length,
                                                                        (offerPartsIndex) {
                                                                      final offerPartsItem =
                                                                          offerParts[
                                                                              offerPartsIndex];
                                                                      return Container(
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          boxShadow: const [
                                                                            BoxShadow(
                                                                              blurRadius: 3.0,
                                                                              color: Color(0x33000000),
                                                                              offset: Offset(
                                                                                0.0,
                                                                                1.0,
                                                                              ),
                                                                            )
                                                                          ],
                                                                          borderRadius:
                                                                              BorderRadius.circular(15.0),
                                                                        ),
                                                                        child:
                                                                            ClipRRect(
                                                                          borderRadius:
                                                                              BorderRadius.circular(15.0),
                                                                          child:
                                                                              Container(
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              borderRadius: BorderRadius.circular(15.0),
                                                                            ),
                                                                            child:
                                                                                Container(
                                                                              width: double.infinity,
                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              child: ExpandableNotifier(
                                                                                initialExpanded: false,
                                                                                child: ExpandablePanel(
                                                                                  header: Padding(
                                                                                    padding: const EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 10.0),
                                                                                    child: Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                      children: [
                                                                                        AutoSizeText(
                                                                                          offerPartsItem.name,
                                                                                          minFontSize: 16.0,
                                                                                          style: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                fontFamily: 'Montserrat',
                                                                                                letterSpacing: 0.0,
                                                                                              ),
                                                                                        ),
                                                                                        if ((offerPartsItem.supplement != null) && !offerPartsItem.required && (offerPartsItem.supplement.amount > 0.0))
                                                                                          Text(
                                                                                            '+${offerPartsItem.supplement.amount.toString()} ${offerPartsItem.supplement.currencyCode}',
                                                                                            textAlign: TextAlign.end,
                                                                                            style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                  fontFamily: 'Inter',
                                                                                                  letterSpacing: 0.0,
                                                                                                ),
                                                                                          ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                  collapsed: Container(),
                                                                                  expanded: Padding(
                                                                                    padding: const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 10.0),
                                                                                    child: Builder(
                                                                                      builder: (context) {
                                                                                        final partOptions = offerPartsItem.options.toList();

                                                                                        return Column(
                                                                                          mainAxisSize: MainAxisSize.min,
                                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                                          children: List.generate(partOptions.length, (partOptionsIndex) {
                                                                                            final partOptionsItem = partOptions[partOptionsIndex];
                                                                                            return Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                              children: [
                                                                                                Flexible(
                                                                                                  child: Column(
                                                                                                    mainAxisSize: MainAxisSize.min,
                                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                    children: [
                                                                                                      Text(
                                                                                                        partOptionsItem.name,
                                                                                                        style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                                              fontFamily: 'Inter',
                                                                                                              letterSpacing: 0.0,
                                                                                                            ),
                                                                                                      ),
                                                                                                      if (partOptionsItem.description != '')
                                                                                                        Padding(
                                                                                                          padding: const EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                                          child: Text(
                                                                                                            partOptionsItem.description,
                                                                                                            textAlign: TextAlign.start,
                                                                                                            maxLines: 10,
                                                                                                            style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                                  fontFamily: 'Inter',
                                                                                                                  letterSpacing: 0.0,
                                                                                                                ),
                                                                                                          ),
                                                                                                        ),
                                                                                                    ],
                                                                                                  ),
                                                                                                ),
                                                                                                if ((partOptionsItem.supplement != null) && (partOptionsItem.supplement.amount > 0.0))
                                                                                                  Flexible(
                                                                                                    child: Text(
                                                                                                      '+${partOptionsItem.supplement.amount.toString()} ${partOptionsItem.supplement.currencyCode}',
                                                                                                      textAlign: TextAlign.end,
                                                                                                      style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                            fontFamily: 'Inter',
                                                                                                            letterSpacing: 0.0,
                                                                                                          ),
                                                                                                    ),
                                                                                                  ),
                                                                                              ],
                                                                                            );
                                                                                          }).divide(const SizedBox(height: 10.0)),
                                                                                        );
                                                                                      },
                                                                                    ),
                                                                                  ),
                                                                                  theme: const ExpandableThemeData(
                                                                                    tapHeaderToExpand: true,
                                                                                    tapBodyToExpand: false,
                                                                                    tapBodyToCollapse: false,
                                                                                    headerAlignment: ExpandablePanelHeaderAlignment.center,
                                                                                    hasIcon: true,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      );
                                                                    }).divide(const SizedBox(
                                                                        height:
                                                                            8.0)),
                                                                  );
                                                                },
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        theme:
                                                            const ExpandableThemeData(
                                                          tapHeaderToExpand:
                                                              true,
                                                          tapBodyToExpand:
                                                              false,
                                                          tapBodyToCollapse:
                                                              false,
                                                          headerAlignment:
                                                              ExpandablePanelHeaderAlignment
                                                                  .center,
                                                          hasIcon: true,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            );
                                          }).divide(const SizedBox(height: 8.0)),
                                        );
                                      },
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
            ),
          ),
        );
      },
    );
  }
}
