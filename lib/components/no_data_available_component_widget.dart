import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'no_data_available_component_model.dart';
export 'no_data_available_component_model.dart';

class NoDataAvailableComponentWidget extends StatefulWidget {
  const NoDataAvailableComponentWidget({
    super.key,
    required this.message,
  });

  final String? message;

  @override
  State<NoDataAvailableComponentWidget> createState() =>
      _NoDataAvailableComponentWidgetState();
}

class _NoDataAvailableComponentWidgetState
    extends State<NoDataAvailableComponentWidget> {
  late NoDataAvailableComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NoDataAvailableComponentModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      valueOrDefault<String>(
        widget.message,
        'Brak danych :(',
      ),
      style: FlutterFlowTheme.of(context).bodyLarge.override(
            fontFamily: 'Inter',
            letterSpacing: 0.0,
          ),
    );
  }
}
