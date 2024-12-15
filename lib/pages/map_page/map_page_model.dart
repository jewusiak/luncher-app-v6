import '/backend/schema/structs/index.dart';
import '/components/place_summary_widget_widget.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'map_page_widget.dart' show MapPageWidget;
import 'package:flutter/material.dart';

class MapPageModel extends FlutterFlowModel<MapPageWidget> {
  ///  Local state fields for this page.

  PlaceDtoStruct? selectedPlace;
  void updateSelectedPlaceStruct(Function(PlaceDtoStruct) updateFn) {
    updateFn(selectedPlace ??= PlaceDtoStruct());
  }

  OpeningInfoStruct? selectedPlaceOpeningInfo;
  void updateSelectedPlaceOpeningInfoStruct(
      Function(OpeningInfoStruct) updateFn) {
    updateFn(selectedPlaceOpeningInfo ??= OpeningInfoStruct());
  }

  String? filteredPlaceTypeId;

  String? filteredDayOfWeek;

  String? filteredOpeningHour;

  String? searchQuery;

  bool filtersOpen = false;

  ///  State fields for stateful widgets in this page.

  // State field(s) for PlacesMap widget.
  LatLng? placesMapsCenter;
  final placesMapsController = Completer<GoogleMapController>();
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController1;
  String? get choiceChipsValue1 =>
      choiceChipsValueController1?.value?.firstOrNull;
  set choiceChipsValue1(String? val) =>
      choiceChipsValueController1?.value = val != null ? [val] : [];
  // State field(s) for StartDayDD widget.
  String? startDayDDValue1;
  FormFieldController<String>? startDayDDValueController1;
  // Stores action output result for [Custom Action - show24hTimePicker] action in StartPickerBtn widget.
  String? timeOutput;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // Model for PlaceSummaryWidget component.
  late PlaceSummaryWidgetModel placeSummaryWidgetModel1;
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController2;
  String? get choiceChipsValue2 =>
      choiceChipsValueController2?.value?.firstOrNull;
  set choiceChipsValue2(String? val) =>
      choiceChipsValueController2?.value = val != null ? [val] : [];
  // State field(s) for StartDayDD widget.
  String? startDayDDValue2;
  FormFieldController<String>? startDayDDValueController2;
  // Stores action output result for [Custom Action - show24hTimePicker] action in StartPickerBtn widget.
  String? timeOutput2;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // Model for PlaceSummaryWidget component.
  late PlaceSummaryWidgetModel placeSummaryWidgetModel2;

  @override
  void initState(BuildContext context) {
    placeSummaryWidgetModel1 =
        createModel(context, () => PlaceSummaryWidgetModel());
    placeSummaryWidgetModel2 =
        createModel(context, () => PlaceSummaryWidgetModel());
  }

  @override
  void dispose() {
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    placeSummaryWidgetModel1.dispose();
    textFieldFocusNode2?.dispose();
    textController2?.dispose();

    placeSummaryWidgetModel2.dispose();
  }
}
