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
                            'Aviso de Privacidad - Clientes\n\nEl objetivo de este documento es darte a conocer de la manera más fácil posible nuestro Aviso de Privacidad, en caso de que tengas cualquier duda, existen canales de comunicación que siempre están disponibles para ti.\n\nEn este Aviso de Privacidad (“ADP”) describimos la forma en que recabamos y tratamos tus datos personales a partir del momento en el que creas tu cuenta e ingresas los datos para el uso de los productos de Tecnologías de la información Kince S. de R.L. de C.V. (en adelante indistintamente “Payry” o el “Responsable”) y durante todo el tiempo que seas cliente de Payry.\n\nEn Payry estamos completamente comprometidos con la protección de tus datos personales y cumplimos con lo dispuesto en la Ley Federal de Protección de Datos Personales en Posesión de los Particulares (la “LFPD”) y el resto de regulación aplicable en materia de protección de datos. Por esto, te informamos que Payry, con domicilio para oír y recibir notificaciones en Avenida Américas 1545 Piso 5E, colonia Providencia, CP 44630, Guadalajara, Jalisco es el responsable de recabar y dar el tratamiento a todos tus datos personales.\n\nPara cumplir con las finalidades de tratamiento de tus datos personales, en Payry recabamos las siguientes categorías de tus datos personales:\nDatos de carácter identificativo y de contacto.\nDatos fiscales.\nDatos de transacción.\nDatos de ubicación geográfica.\nPara las finalidades descritas en el presente Aviso, Payry no recaba datos personales considerados como sensibles.\n\nEstas son las finalidades principales por las cuales recabamos tus datos personales:\nFacilitar la contratación de nuestros productos y/o servicios financieros a través de los medios tecnológicos disponibles. Analizar tu perfil para determinar el grado de riesgo para el otorgamiento de los productos financieros que ofrecemos o podamos llegar a ofrecer.\n\nRealizar la verificación de los datos contenidos en la Credencial para Votar y el biométrico facial a través del servicio de verificación del Instituto Nacional Electoral.\nGestionar, administrar y mantener actualizadas nuestras bases de datos de clientes.\nGestionar y comunicar estados de cuenta y cualquier otra información relacionada con los productos y/o servicios financieros adquiridos por nuestros clientes.\n\nGestionar, administrar y mantener actualizada la información relacionada con los cobros/pagos que realizas por los productos y/o servicios adquiridos.\n\nFacilitar atención de servicio al cliente.\n\nRegistrar las transacciones que se realizan con nuestros productos.\n\nRegistrar la ubicación al momento de realizar transacciones con nuestros productos.\n\nFacilitar nuestros productos y/o servicios utilizando los datos del dispositivo móvil.\n\nGestionar y administrar las comunicaciones con nuestros clientes. \n\nEstadística y registro histórico de nuestros clientes.\n\nSalvo que nos indiques lo contrario al darte de alta como prospecto, usaremos algunos datos para enviarte comunicaciones, por ejemplo, mediante SMS y/o correo electrónico, con novedades o información comercial sobre productos y servicios de Payry, así como campañas publicitarias y participación en dinámicas y programas que ofrece Payry; esta es una finalidad secundaria y puedes oponerte a ella, en cualquier momento.\n\nPayry podrá compartir tus datos dentro o fuera de México con (i) sus compañías controladoras, afiliadas, subsidiarias o cualquier sociedad del mismo grupo corporativo que operen bajo los mismos procesos y políticas internas, para finalidades de resguardo centralizado de la información, para documentar y formalizar operaciones de reestructuración operativa y/o corporativa, y para fines estadísticos y de registro histórico de clientes; (ii) sociedades de información crediticia, para solicitar información sobre tu historial crediticio e información de contacto; (iii) autoridades, organismos o entidades gubernamentales, para realizar verificaciones de información, para el cumplimiento de obligaciones previstas en la legislación aplicable y/o para cumplir con requerimientos efectuados por autoridades competentes en su caso; (iv) empresas de cobranza, para realizar cobros judiciales o extrajudiciales de créditos impagados, y (v) terceros no relacionados (prestadores de servicios), con la finalidad exclusiva de asistir a Payry en la prestación de sus servicios.\n\nTe comentamos que, conforme al artículo 37 de la LFPD, no requerimos de tu consentimiento para compartir tus datos en los términos establecidos en el párrafo anterior.\n\nPuedes ejercer en todo momento tus derechos de acceso, rectificación, cancelación y oposición (derechos ARCO), enviando una solicitud a\nnuestro Departamento de Datos Personales al correo electrónico: clientes@payry.mx . El asunto de la solicitud debe ir señalada como “Derechos ARCO” o “Revocación del Consentimiento” y debe contener lo siguiente:\nTu nombre y domicilio o correo electrónico al que podremos comunicarte la respuesta a tu solicitud;\n\nLos documentos que acrediten tu identidad o, en su caso, la representación legal de aquella persona que ejerza el derecho en tu nombre;\nLa descripción clara y precisa de los datos personales respecto de los que se busca ejercer alguno de los derechos ARCO, y Cualquier otro elemento o documento que facilite la localización de tus datos personales.\n\nPayry te comunicará la determinación adoptada en un plazo máximo de veinte (20) días hábiles, contados a partir de la fecha en la que se reciba tu solicitud. Cuando tu solicitud proceda, se hará efectiva dentro de los quince (15) días hábiles siguientes a la fecha en que te comuniquemos la respuesta. En caso de que la información que proporciones sea incorrecta, insuficiente, o no cumplas con los requisitos antes mencionados, te comunicaremos dentro de los cinco (5) días hábiles siguientes a la recepción de tu solicitud para que realices los cambios pertinentes o cumplas con todos los requisitos. En este caso, tendrás diez (10) días hábiles para subsanar tu solicitud de lo contrario se tendrá por no presentada y será desechada.\n\nAl enviar tu solicitud a clientes@payry.mx , autorizas a Payry para dar respuesta por ese mismo medio, salvo que nos indiques otro medio de comunicación.\n\nComo cliente, puedes revocar tu consentimiento para el tratamiento, transferencia de tus datos personales o limitar el uso o divulgación de tus datos personales siguiendo este mismo procedimiento, siempre que no suponga la imposibilidad de cumplir con alguna obligación por parte de Payry.\n\nEs tu responsabilidad comunicar cualquier cambio en tus datos personales para que sea tomado en cuenta y mantener tus datos debidamente actualizados, con la finalidad de asegurar la calidad de los datos personales y garantizar que sean exactos.\n\nEn el sitio web www.payry.mx usamos cookies funcionales. Las cookies utilizadas por Payry nos permiten recopilar, analizar y conservar información electrónica relacionada con las visitas a nuestro sitio web. Las cookies que usamos permiten recabar esta información de forma automática en el momento mismo en que accedes a nuestro sitio web y a nuestros servicios electrónicos; sin embargo, éstas no permiten identificar individualmente a las personas que nos visitan. Si navegas en nuestra web y/o envías información a través de la misma, nos otorgas tu consentimiento expreso para la instalación de nuestras cookies. Para obtener información más detallada acerca de las cookies y la forma en que puedes deshabilitarlas en función de tu navegador y sistema operativo, te recomendamos que visites el sitio web allaboutcookies.org, en el que explican paso a paso cómo deshabilitarlas. Toma en cuenta que, si desactivas las cookies o impides su instalación, es posible que no puedas usar de manera completa algunas funciones de nuestra web.\n\nNos reservamos el derecho de modificar, actualizar, extender o de cualquier otra forma cambiar el contenido y alcance del presente Aviso de Privacidad, en cualquier momento y bajo nuestra completa discreción. En todo momento, podrás solicitar la última versión de este Aviso de Privacidad a nuestro Departamento de Datos Personales, a través de la dirección electrónica clientes@payry.mx',
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
