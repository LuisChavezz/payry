import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'o_k_f_n_payry43_politicadeprivacidad_model.dart';
export 'o_k_f_n_payry43_politicadeprivacidad_model.dart';

class OKFNPayry43PoliticadeprivacidadWidget extends StatefulWidget {
  const OKFNPayry43PoliticadeprivacidadWidget({super.key});

  @override
  State<OKFNPayry43PoliticadeprivacidadWidget> createState() =>
      _OKFNPayry43PoliticadeprivacidadWidgetState();
}

class _OKFNPayry43PoliticadeprivacidadWidgetState
    extends State<OKFNPayry43PoliticadeprivacidadWidget> {
  late OKFNPayry43PoliticadeprivacidadModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OKFNPayry43PoliticadeprivacidadModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        automaticallyImplyLeading: false,
        leading: InkWell(
          splashColor: Colors.transparent,
          focusColor: Colors.transparent,
          hoverColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () async {
            context.pop();
          },
          child: Icon(
            Icons.chevron_left_rounded,
            color: FlutterFlowTheme.of(context).primaryText,
            size: 32.0,
          ),
        ),
        actions: [],
        centerTitle: false,
        elevation: 0.0,
      ),
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 36.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Text(
                            'Política de privacidad',
                            style: FlutterFlowTheme.of(context)
                                .titleLarge
                                .override(
                                  fontFamily: 'Poppins',
                                  color: FlutterFlowTheme.of(context).accent3,
                                ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 12.0, 20.0, 44.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Text(
                            'Aviso de Privacidad - Clientes\n\nEl propósito de este documento es proporcionarte de manera clara nuestro Aviso de Privacidad. Si tienes alguna pregunta, siempre puedes comunicarte con nosotros a través de nuestros canales disponibles en la página web www.payry.mx y por correo a la dirección clientes@payry.mx.\n\nEn este Aviso de Privacidad (\"ADP\"), explicamos cómo recopilamos y tratamos tus datos personales desde el momento en que creas tu cuenta e ingresas tus datos para utilizar los productos de Tecnologías de la Información Kince S. de R.L. de C.V. (en adelante \"Payry\" o el \"Responsable\"), y durante tu relación como cliente de Payry.\n\nEn Payry, estamos comprometidos con la protección de tus datos personales y cumplimos con lo establecido en la Ley Federal de Protección de Datos Personales en Posesión de los Particulares (la \"LFPD\") y demás regulaciones aplicables en materia de protección de datos. Por lo tanto, te informamos que Payry, con domicilio en Avenida Américas 1545 Piso 5E, colonia Providencia, CP 44630, Guadalajara, Jalisco, es responsable de recopilar y tratar todos tus datos personales.\n\nPara cumplir con los objetivos del tratamiento de tus datos personales, en Payry recopilamos las siguientes categorías de tus datos personales:\nDatos de identificación y contacto.\nDatos fiscales.\nDatos de transacciones.\n\nPayry no recopila datos personales considerados sensibles para las finalidades descritas en este Aviso.\n\nEstas son las principales finalidades para las cuales recopilamos tus datos personales:\n\nFacilitar la contratación de nuestros productos y/o servicios financieros utilizando medios tecnológicos disponibles.\n\nGestionar y mantener actualizada nuestra base de datos de clientes.\n\nComunicar estados de cuenta, reportes de operación diaria, transferencias a tus cuentas y otra información relacionada con los servicios ofrecidos por Payry.\n\nAdministrar los cobros/pagos realizados a través de los servicios ofrecidos por Payry.\n\nBrindar atención al cliente.\n\nRegistrar transacciones realizadas con nuestros productos.\n\nFacilitar nuestros productos y/o servicios utilizando datos del dispositivo móvil.\n\nGestionar y administrar comunicaciones con nuestros clientes.\n\nRealizar estadísticas y mantener un registro histórico de nuestros clientes.\n\nA menos que indiques lo contrario al registrarte como cliente, utilizaremos algunos datos para enviarte comunicaciones, como SMS y/o correos electrónicos, con novedades o información comercial sobre productos y servicios de Payry, así como campañas publicitarias y participación en dinámicas y programas ofrecidos por Payry. Esta es una finalidad secundaria y puedes optar por no recibirla en cualquier momento.\n\nPayry podrá compartir tus datos dentro o fuera de México con (a) sus empresas matrices, afiliadas, filiales o cualquier entidad del mismo grupo corporativo que operen bajo los mismos procedimientos y políticas internas, para centralizar la información, documentar y formalizar operaciones de reestructuración operativa y/o corporativa, y para fines estadísticos y de registro histórico de clientes; (b) autoridades, organismos o entidades gubernamentales, para verificar información, cumplir con obligaciones establecidas en la legislación aplicable y/o cumplir con requisitos de autoridades competentes en su caso.\n\nDe acuerdo con el artículo 37 de la LFPD, no es necesario tu consentimiento para compartir tus datos en los términos indicados anteriormente.\n\nPuedes ejercer en todo momento tus derechos de acceso, rectificación, cancelación y oposición (derechos ARCO), enviando una solicitud a nuestro Departamento de Datos Personales al correo electrónico: clientes@payry.mx. \n\nEl asunto de la solicitud debe estar señalado como \"Derechos ARCO\" o \"Revocación del Consentimiento\" y debe contener lo siguiente:\nTu nombre y dirección de correo electrónico para recibir la respuesta a tu solicitud;\n\nLos documentos que demuestren tu identidad o, en su caso, la representación legal de la persona que ejerza el derecho en tu nombre;\nUna descripción clara y precisa de los datos personales sobre los que deseas ejercer alguno de los derechos ARCO; y\nCualquier otro elemento o documento que facilite la localización de tus datos personales.\n\nPayry te comunicará la determinación adoptada en un plazo máximo de treinta (30) días naturales a partir de la recepción de tu solicitud. Cuando proceda tu solicitud, se implementará dentro de los quince (15) días naturales siguientes a la fecha de la respuesta. Si la información proporcionada es incorrecta, insuficiente o no cumple con los requisitos mencionados, te informaremos dentro de los 10 (10) días naturales posteriores a la recepción de tu solicitud para que realices los ajustes necesarios o cumplas con todos los requisitos. En tal caso, tendrás un plazo de quince (15) días naturales para corregir tu solicitud; de lo contrario, se considerará como no presentada y se desechará.\n\nAl remitir tu solicitud a clientes@payry.mx, autorizas a Payry para responder por dicho medio, a menos que especifiques otro medio de comunicación.\n\nComo cliente, tienes la facultad de revocar tu consentimiento para el tratamiento y transferencia de tus datos personales, o restringir el uso o divulgación de los mismos, siguiendo este procedimiento, siempre que no afecte nuestra capacidad para cumplir con alguna obligación.\n\nEs tu responsabilidad informar cualquier cambio en tus datos personales para su actualización, garantizando su precisión y calidad.\n\nNos reservamos el derecho de modificar, actualizar, extender o de cualquier otra forma cambiar el contenido y alcance de este Aviso de Privacidad en cualquier momento y bajo nuestra completa discreción. Siempre puedes solicitar la última versión de este Aviso a nuestro Departamento de Datos Personales, enviando un correo a clientes@payry.mx.\n',
                            style: FlutterFlowTheme.of(context)
                                .bodySmall
                                .override(
                                  fontFamily: 'Lexend',
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
