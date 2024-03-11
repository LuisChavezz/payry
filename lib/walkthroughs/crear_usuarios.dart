import 'package:flutter/material.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

import '/components/mensaje_walk_through_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';

// Focus widget keys for this walkthrough
final button5k9z6m33 = GlobalKey();
final listViewBm8rc1kb = GlobalKey();

/// Crear usuarios
///
/// Pasos para crear usuarios
List<TargetFocus> createWalkthroughTargets(BuildContext context) => [
      /// Step 1
      TargetFocus(
        keyTarget: button5k9z6m33,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomCenter,
        shape: ShapeLightFocus.RRect,
        color: FlutterFlowTheme.of(context).primary,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            builder: (context, __) => MensajeWalkThroughWidget(
              texto:
                  'Da clic en este botón para ingresar el correo electrónico del usuario que quieras vincular a tu cuenta de PAYRY.',
            ),
          ),
        ],
      ),

      /// Step 2
      TargetFocus(
        keyTarget: listViewBm8rc1kb,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomCenter,
        shape: ShapeLightFocus.RRect,
        color: FlutterFlowTheme.of(context).primary,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            builder: (context, __) => MensajeWalkThroughWidget(
              texto:
                  'Aquí podrás ver a los usuarios que has invitado, asignarles permisos y activar o desactivar su perfil.',
            ),
          ),
        ],
      ),
    ];
