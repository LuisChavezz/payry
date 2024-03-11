import 'package:flutter/material.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

import '/components/mensaje_walk_through_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';

// Focus widget keys for this walkthrough
final textFieldY48usnf1 = GlobalKey();
final textFieldHb4avouw = GlobalKey();
final buttonEpcgn4br = GlobalKey();
final buttonRbdslzww = GlobalKey();

/// Como generar un CoDi
///
/// Pasos para hacer un CoDi
List<TargetFocus> createWalkthroughTargets(BuildContext context) => [
      /// Step 1
      TargetFocus(
        keyTarget: textFieldY48usnf1,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomCenter,
        shape: ShapeLightFocus.RRect,
        color: FlutterFlowTheme.of(context).primary,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            builder: (context, __) => MensajeWalkThroughWidget(
              texto:
                  'Agrega un concepto de cobro, sé breve y conciso para que tu cliente sepa qué es lo que está pagando.',
            ),
          ),
        ],
      ),

      /// Step 2
      TargetFocus(
        keyTarget: textFieldHb4avouw,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomCenter,
        shape: ShapeLightFocus.RRect,
        color: FlutterFlowTheme.of(context).primary,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            builder: (context, __) => MensajeWalkThroughWidget(
              texto:
                  'Ingresa el monto de cobro. Recuerda que no debe de sobrepasar los \$8,000 MXN por transacción.',
            ),
          ),
        ],
      ),

      /// Step 3
      TargetFocus(
        keyTarget: buttonEpcgn4br,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomCenter,
        shape: ShapeLightFocus.RRect,
        color: FlutterFlowTheme.of(context).primary,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            builder: (context, __) => MensajeWalkThroughWidget(
              texto:
                  'Ya que hayas verificado los datos, da clic en este botón para crear un CoDi y enviarlo a tu cliente.',
            ),
          ),
        ],
      ),

      /// Step 4
      TargetFocus(
        keyTarget: buttonRbdslzww,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomCenter,
        shape: ShapeLightFocus.RRect,
        color: FlutterFlowTheme.of(context).primary,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            builder: (context, __) => MensajeWalkThroughWidget(
              texto: 'Consulta todos tus CoDi generados en este botón.',
            ),
          ),
        ],
      ),
    ];
