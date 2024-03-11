import 'package:flutter/material.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

import '/components/mensaje_walk_through_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';

// Focus widget keys for this walkthrough
final textFieldKyj8705m = GlobalKey();
final textField3t6or890 = GlobalKey();
final textFieldYm31jmhf = GlobalKey();
final button4vvi5acz = GlobalKey();
final button3ksruh3m = GlobalKey();

/// Como crear un DiMo
///
/// Pasos para crear un DiMo
List<TargetFocus> createWalkthroughTargets(BuildContext context) => [
      /// Step 1
      TargetFocus(
        keyTarget: textFieldKyj8705m,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomCenter,
        shape: ShapeLightFocus.RRect,
        color: FlutterFlowTheme.of(context).primary,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            builder: (context, __) => MensajeWalkThroughWidget(
              texto:
                  'Digita el número de celular vinculado a la cuenta bancaria de tu cliente a 10 dígitos para realizar su pago.',
            ),
          ),
        ],
      ),

      /// Step 2
      TargetFocus(
        keyTarget: textField3t6or890,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomCenter,
        shape: ShapeLightFocus.RRect,
        color: FlutterFlowTheme.of(context).primary,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            builder: (context, __) => MensajeWalkThroughWidget(
              texto:
                  'Escribe un concepto de pago claro y conciso para que tu cliente sepa que es lo que está pagando.',
            ),
          ),
        ],
      ),

      /// Step 3
      TargetFocus(
        keyTarget: textFieldYm31jmhf,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomCenter,
        shape: ShapeLightFocus.RRect,
        color: FlutterFlowTheme.of(context).primary,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            builder: (context, __) => MensajeWalkThroughWidget(
              texto:
                  'Ingresa un monto de cobro, recuerda que no debe de sobrepasar los \$8,000 MXN por transacción.',
            ),
          ),
        ],
      ),

      /// Step 4
      TargetFocus(
        keyTarget: button4vvi5acz,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomCenter,
        shape: ShapeLightFocus.RRect,
        color: FlutterFlowTheme.of(context).primary,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            builder: (context, __) => MensajeWalkThroughWidget(
              texto:
                  'Ya que has confirmado los datos de cobro, da clic en este botón para enviar un DiMo a tu cliente.',
            ),
          ),
        ],
      ),

      /// Step 5
      TargetFocus(
        keyTarget: button3ksruh3m,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomCenter,
        shape: ShapeLightFocus.RRect,
        color: FlutterFlowTheme.of(context).primary,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            builder: (context, __) => MensajeWalkThroughWidget(
              texto: 'Consulta todos tus DiMo generados en este botón.',
            ),
          ),
        ],
      ),
    ];
