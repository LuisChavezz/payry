import 'package:flutter/material.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

import '/components/mensaje_walk_through_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';

// Focus widget keys for this walkthrough
final columnU579nx4d = GlobalKey();

/// Asignar permisos a usuarios
///
/// Pasos para asignar permisos personalizados  a diferentes usuarios.
List<TargetFocus> createWalkthroughTargets(BuildContext context) => [
      /// Step 1
      TargetFocus(
        keyTarget: columnU579nx4d,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomCenter,
        shape: ShapeLightFocus.RRect,
        color: FlutterFlowTheme.of(context).primary,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            builder: (context, __) => MensajeWalkThroughWidget(
              texto:
                  'Ahora que tienes usuarios vinculados, puedes encender o apagar los permisos que creas necesarios para cada uno.',
            ),
          ),
        ],
      ),
    ];
