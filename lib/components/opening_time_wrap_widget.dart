import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'opening_time_wrap_model.dart';
export 'opening_time_wrap_model.dart';

class OpeningTimeWrapWidget extends StatefulWidget {
  const OpeningTimeWrapWidget({
    super.key,
    required this.place,
  });

  final PlaceDtoStruct? place;

  @override
  State<OpeningTimeWrapWidget> createState() => _OpeningTimeWrapWidgetState();
}

class _OpeningTimeWrapWidgetState extends State<OpeningTimeWrapWidget> {
  late OpeningTimeWrapModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OpeningTimeWrapModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.openingInfo = functions.calculatePlaceOpeningInfo(
          widget.place, getCurrentTimestamp);
      safeSetState(() {});
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 10.0),
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
            _model.openingInfo?.openState == OpeningState.OPEN
                ? 'Otwarte'
                : 'Zamknięte',
            style: FlutterFlowTheme.of(context).bodyLarge.override(
                  fontFamily: 'Inter',
                  color: _model.openingInfo?.openState == OpeningState.OPEN
                      ? const Color(0xFF28AB3C)
                      : const Color(0xFFB41621),
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
            _model.openingInfo?.openState == OpeningState.OPEN
                ? 'zamknięcie o ${_model.openingInfo?.selectedOpeningWindow.endTime.time}'
                : 'otwarcie w ${_model.openingInfo?.selectedOpeningWindow.startTime.day} o ${_model.openingInfo?.selectedOpeningWindow.startTime.time}',
            maxLines: 2,
            style: FlutterFlowTheme.of(context).bodyLarge.override(
                  fontFamily: 'Inter',
                  letterSpacing: 0.0,
                ),
          ),
        ],
      ),
    );
  }
}
