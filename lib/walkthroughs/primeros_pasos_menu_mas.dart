import 'package:flutter/material.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

import '/components/mensaje_walk_through_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';

// Focus widget keys for this walkthrough
final containerBkgp3rtd = GlobalKey();
final containerUroenb4x = GlobalKey();
final container4zzotb73 = GlobalKey();

/// Primeros Pasos - Menu mas
///
/// Cuáles son las secciones que debería de configurar primero
List<TargetFocus> createWalkthroughTargets(BuildContext context) => [
      /// Step 1
      TargetFocus(
        keyTarget: containerBkgp3rtd,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomCenter,
        shape: ShapeLightFocus.RRect,
        color: FlutterFlowTheme.of(context).primary,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            builder: (context, __) => MensajeWalkThroughWidget(
              texto: 'Accede a esta sección para llenar tus datos del perfil.',
            ),
          ),
        ],
      ),

      /// Step 2
      TargetFocus(
        keyTarget: containerUroenb4x,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomCenter,
        shape: ShapeLightFocus.RRect,
        color: FlutterFlowTheme.of(context).primary,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            builder: (context, __) => MensajeWalkThroughWidget(
              texto:
                  'Ingresa a esta sección para llenar los datos de tu empresa y validar tus datos bancarios.',
            ),
          ),
        ],
      ),

      /// Step 3
      TargetFocus(
        keyTarget: container4zzotb73,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomCenter,
        shape: ShapeLightFocus.RRect,
        color: FlutterFlowTheme.of(context).primary,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            builder: (context, __) => MensajeWalkThroughWidget(
              texto: '¡Y listo! Ahora puedes comenzar a cobrar con PAYRY.',
            ),
          ),
        ],
      ),
    ];
