import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:octo_image/octo_image.dart';
import 'place_summary_widget_model.dart';
export 'place_summary_widget_model.dart';

class PlaceSummaryWidgetWidget extends StatefulWidget {
  const PlaceSummaryWidgetWidget({
    super.key,
    required this.selectedPlace,
    required this.openingInfo,
  });

  final PlaceDtoStruct? selectedPlace;
  final OpeningInfoStruct? openingInfo;

  @override
  State<PlaceSummaryWidgetWidget> createState() =>
      _PlaceSummaryWidgetWidgetState();
}

class _PlaceSummaryWidgetWidgetState extends State<PlaceSummaryWidgetWidget> {
  late PlaceSummaryWidgetModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PlaceSummaryWidgetModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: widget.selectedPlace != null ? 1.0 : 0.0,
      duration: 300.0.ms,
      curve: Curves.easeInOut,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        width: MediaQuery.sizeOf(context).width * 1.0,
        height: MediaQuery.sizeOf(context).height * 1.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(15.0, 15.0, 15.0, 15.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Align(
                alignment: AlignmentDirectional(1.0, 0.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                  child: FlutterFlowIconButton(
                    borderColor: Colors.transparent,
                    borderRadius: 20.0,
                    buttonSize: 40.0,
                    fillColor: FlutterFlowTheme.of(context).primary,
                    icon: Icon(
                      Icons.arrow_forward,
                      color: FlutterFlowTheme.of(context).info,
                      size: 24.0,
                    ),
                    onPressed: () async {
                      if (widget.selectedPlace != null) {
                        context.pushNamed(
                          PlaceDetailsPageWidget.routeName,
                          queryParameters: {
                            'placeId': serializeParam(
                              widget.selectedPlace?.id,
                              ParamType.String,
                            ),
                          }.withoutNulls,
                        );
                      } else {
                        return;
                      }
                    },
                  ),
                ),
              ),
              Builder(
                builder: (context) {
                  final selectedPlaceImages = (widget.selectedPlace != null
                              ? widget.selectedPlace?.images
                              : functions.getEmptyAssetList())
                          ?.toList() ??
                      [];

                  return Container(
                    width: double.infinity,
                    height: 129.0,
                    child: CarouselSlider.builder(
                      itemCount: selectedPlaceImages.length,
                      itemBuilder: (context, selectedPlaceImagesIndex, _) {
                        final selectedPlaceImagesItem =
                            selectedPlaceImages[selectedPlaceImagesIndex];
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
                                child: FlutterFlowExpandedImageView(
                                  image: OctoImage(
                                    placeholderBuilder: (_) => SizedBox.expand(
                                      child: Image(
                                        image: BlurHashImage(
                                            selectedPlaceImagesItem.blurHash),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    image: CachedNetworkImageProvider(
                                      selectedPlaceImagesItem.accessUrl,
                                    ),
                                    fit: BoxFit.contain,
                                    errorBuilder:
                                        (context, error, stackTrace) =>
                                            Image.asset(
                                      'assets/images/error_image.png',
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                  allowRotation: false,
                                  tag: selectedPlaceImagesItem.accessUrl,
                                  useHeroAnimation: true,
                                ),
                              ),
                            );
                          },
                          child: Hero(
                            tag: selectedPlaceImagesItem.accessUrl,
                            transitionOnUserGestures: true,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: OctoImage(
                                placeholderBuilder: (_) => SizedBox.expand(
                                  child: Image(
                                    image: BlurHashImage(
                                        selectedPlaceImagesItem.blurHash),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                image: CachedNetworkImageProvider(
                                  selectedPlaceImagesItem.accessUrl,
                                ),
                                width: 200.0,
                                height: 200.0,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) =>
                                    Image.asset(
                                  'assets/images/error_image.png',
                                  width: 200.0,
                                  height: 200.0,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                      carouselController: _model.carouselController ??=
                          CarouselSliderController(),
                      options: CarouselOptions(
                        initialPage:
                            max(0, min(1, selectedPlaceImages.length - 1)),
                        viewportFraction: 0.5,
                        disableCenter: true,
                        enlargeCenterPage: true,
                        enlargeFactor: 0.25,
                        enableInfiniteScroll: true,
                        scrollDirection: Axis.horizontal,
                        autoPlay: false,
                        onPageChanged: (index, _) =>
                            _model.carouselCurrentIndex = index,
                      ),
                    ),
                  );
                },
              ),
              Align(
                alignment: AlignmentDirectional(0.0, -1.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      if (widget.selectedPlace != null) {
                        context.pushNamed(
                          PlaceDetailsPageWidget.routeName,
                          queryParameters: {
                            'placeId': serializeParam(
                              widget.selectedPlace?.id,
                              ParamType.String,
                            ),
                          }.withoutNulls,
                        );
                      } else {
                        return;
                      }
                    },
                    child: Text(
                      widget.selectedPlace != null
                          ? widget.selectedPlace!.name
                          : ' ',
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      style: FlutterFlowTheme.of(context).titleMedium.override(
                            fontFamily: 'Montserrat',
                            letterSpacing: 0.0,
                          ),
                    ),
                  ),
                ),
              ),
              Text(
                widget.selectedPlace != null
                    ? functions
                        .addressDtoToString(widget.selectedPlace?.address)!
                    : ' ',
                textAlign: TextAlign.center,
                maxLines: 2,
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Inter',
                      letterSpacing: 0.0,
                    ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                child: Wrap(
                  spacing: 0.0,
                  runSpacing: 5.0,
                  alignment: WrapAlignment.center,
                  crossAxisAlignment: WrapCrossAlignment.start,
                  direction: Axis.horizontal,
                  runAlignment: WrapAlignment.center,
                  verticalDirection: VerticalDirection.down,
                  clipBehavior: Clip.none,
                  children: [
                    Text(
                      widget.openingInfo != null
                          ? (widget.openingInfo?.openState == OpeningState.OPEN
                              ? 'Otwarte'
                              : 'Zamknięte')
                          : ' ',
                      style: FlutterFlowTheme.of(context).bodyLarge.override(
                            fontFamily: 'Inter',
                            color: (widget.openingInfo != null) &&
                                    (widget.openingInfo?.openState ==
                                        OpeningState.OPEN)
                                ? Color(0xFF28AB3C)
                                : Color(0xFFB41621),
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                    Text(
                      ', ',
                      style: FlutterFlowTheme.of(context).bodyLarge.override(
                            fontFamily: 'Inter',
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.normal,
                          ),
                    ),
                    Text(
                      widget.openingInfo != null
                          ? (widget.openingInfo?.openState == OpeningState.OPEN
                              ? 'zamknięcie o ${widget.openingInfo?.selectedOpeningWindow.endTime.time}'
                              : 'otwarcie w ${widget.openingInfo?.selectedOpeningWindow.startTime.day} o ${widget.openingInfo?.selectedOpeningWindow.startTime.time}')
                          : ' ',
                      maxLines: 2,
                      style: FlutterFlowTheme.of(context).bodyLarge.override(
                            fontFamily: 'Inter',
                            letterSpacing: 0.0,
                          ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
