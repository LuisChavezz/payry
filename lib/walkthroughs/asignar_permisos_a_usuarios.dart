import 'package:flutter/material.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

import '/components/mensaje_walk_through_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';

// Focus widget keys for this walkthrough
final rowJdrrafp7 = GlobalKey();

/// Asignar permisos a usuarios
///
/// Pasos para asignar permisos personalizados  a diferentes usuarios.
List<TargetFocus> createWalkthroughTargets(BuildContext context) => [
      /// Step 1
      TargetFocus(
        keyTarget: rowJdrrafp7,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomCenter,
        shape: ShapeLightFocus.RRect,
        color: FlutterFlowTheme.of(context).primary,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            builder: (context, __) => MensajeWalkThroughWidget(
              texto:
                  'Ahora que tienes usuarios vinculados, puedes encender o apagar los permisos necesarios para cada uno.',
            ),
          ),
        ],
      ),
    ];
