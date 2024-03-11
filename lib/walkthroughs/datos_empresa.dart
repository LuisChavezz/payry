import 'package:flutter/material.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

import '/components/mensaje_walk_through_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';

// Focus widget keys for this walkthrough
final textField1k7siihm = GlobalKey();
final button0mk72b7s = GlobalKey();
final buttonOpo9q8j2 = GlobalKey();

/// Datos empresa
///
/// Pasos para llenar los datos empresariales.
List<TargetFocus> createWalkthroughTargets(BuildContext context) => [
      /// Step 1
      TargetFocus(
        keyTarget: textField1k7siihm,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomCenter,
        shape: ShapeLightFocus.RRect,
        color: FlutterFlowTheme.of(context).primary,
        contents: [
          TargetContent(
            align: ContentAlign.top,
            builder: (context, __) => MensajeWalkThroughWidget(
              texto:
                  'En esta sección, comienza llenando el formulario con tus datos de empresa, contacto y facturación.',
            ),
          ),
        ],
      ),

      /// Step 2
      TargetFocus(
        keyTarget: button0mk72b7s,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomCenter,
        shape: ShapeLightFocus.RRect,
        color: FlutterFlowTheme.of(context).primary,
        contents: [
          TargetContent(
            align: ContentAlign.top,
            builder: (context, __) => MensajeWalkThroughWidget(
              texto:
                  'Cuando estés seguro que tus datos son correctos, da clic en el botón de GUARDAR.',
            ),
          ),
        ],
      ),

      /// Step 3
      TargetFocus(
        keyTarget: buttonOpo9q8j2,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomCenter,
        shape: ShapeLightFocus.RRect,
        color: FlutterFlowTheme.of(context).primary,
        contents: [
          TargetContent(
            align: ContentAlign.top,
            builder: (context, __) => MensajeWalkThroughWidget(
              texto:
                  'No olvides agregar tus datos bancarios para poder enviarte los pagos de tus clientes a tu cuenta.',
            ),
          ),
        ],
      ),
    ];
