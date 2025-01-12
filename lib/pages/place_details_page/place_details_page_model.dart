import '/backend/schema/structs/index.dart';
import '/components/opening_time_wrap_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'place_details_page_widget.dart' show PlaceDetailsPageWidget;
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class PlaceDetailsPageModel extends FlutterFlowModel<PlaceDetailsPageWidget> {
  ///  Local state fields for this page.

  OpeningInfoStruct? openingInfo;
  void updateOpeningInfoStruct(Function(OpeningInfoStruct) updateFn) {
    updateFn(openingInfo ??= OpeningInfoStruct());
  }

  ///  State fields for stateful widgets in this page.

  // State field(s) for Carousel widget.
  CarouselSliderController? carouselController;
  int carouselCurrentIndex = 0;

  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController1;

  // Model for OpeningTimeWrap component.
  late OpeningTimeWrapModel openingTimeWrapModel;

  @override
  void initState(BuildContext context) {
    openingTimeWrapModel = createModel(context, () => OpeningTimeWrapModel());
  }

  @override
  void dispose() {
    expandableExpandableController1.dispose();
    openingTimeWrapModel.dispose();
  }
}
