import 'package:flutter/material.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

import '/components/mensaje_walk_through_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';

// Focus widget keys for this walkthrough
final row1h1fcomo = GlobalKey();
final tabVzlr16om = GlobalKey();
final tabNqfrth42 = GlobalKey();
final placeholderWidgetZlutfnme = GlobalKey();

/// Elementos en el dashboard
///
/// Secciones del dashboard, información y menú
List<TargetFocus> createWalkthroughTargets(BuildContext context) => [
      /// Step 1
      TargetFocus(
        keyTarget: row1h1fcomo,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomCenter,
        shape: ShapeLightFocus.RRect,
        color: FlutterFlowTheme.of(context).primary,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            builder: (context, __) => MensajeWalkThroughWidget(
              texto:
                  'Mira el monto que cobraste este día. Este mismo estará disponible en tu cuenta bancaria al siguiente día hábil.',
            ),
          ),
        ],
      ),

      /// Step 2
      TargetFocus(
        keyTarget: tabVzlr16om,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomCenter,
        shape: ShapeLightFocus.RRect,
        color: FlutterFlowTheme.of(context).primary,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            builder: (context, __) => MensajeWalkThroughWidget(
              texto:
                  'Aquí verás los detalles de las transacciones realizadas con CoDi.',
            ),
          ),
        ],
      ),

      /// Step 3
      TargetFocus(
        keyTarget: tabNqfrth42,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomCenter,
        shape: ShapeLightFocus.RRect,
        color: FlutterFlowTheme.of(context).primary,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            builder: (context, __) => MensajeWalkThroughWidget(
              texto:
                  'Ve a esta pestaña para consultar los DiMo que cobraste en esta fecha.',
            ),
          ),
        ],
      ),

      /// Step 4
      TargetFocus(
        keyTarget: placeholderWidgetZlutfnme,
        enableOverlayTab: true,
        alignSkip: Alignment.topCenter,
        shape: ShapeLightFocus.RRect,
        color: FlutterFlowTheme.of(context).primary,
        contents: [
          TargetContent(
            align: ContentAlign.top,
            builder: (context, __) => MensajeWalkThroughWidget(
              texto: 'Consulta los detalles de las transacciones realizadas.',
            ),
          ),
        ],
      ),
    ];
