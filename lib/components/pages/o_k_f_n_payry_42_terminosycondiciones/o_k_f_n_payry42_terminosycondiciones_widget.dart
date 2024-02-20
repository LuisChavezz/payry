import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'o_k_f_n_payry42_terminosycondiciones_model.dart';
export 'o_k_f_n_payry42_terminosycondiciones_model.dart';

class OKFNPayry42TerminosycondicionesWidget extends StatefulWidget {
  const OKFNPayry42TerminosycondicionesWidget({super.key});

  @override
  State<OKFNPayry42TerminosycondicionesWidget> createState() =>
      _OKFNPayry42TerminosycondicionesWidgetState();
}

class _OKFNPayry42TerminosycondicionesWidgetState
    extends State<OKFNPayry42TerminosycondicionesWidget> {
  late OKFNPayry42TerminosycondicionesModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OKFNPayry42TerminosycondicionesModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    context.watch<FFAppState>();

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
                            'Términos y condiciones',
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
                            'Términos y Condiciones de Uso.\n\nLe damos la bienvenida a PAYRY®, una app y plataforma digital de servicios de intermediación financiera (“PAYRY”) operada por Tecnologías de la Información Kince S. de R.L. de C,V. (“KINCE”) con domicilio ubicado en Avenida Américas número 1545, P5E, Colonia Providencia, Guadalajara, Jalisco, C.P. 44630. Antes de utilizar nuestros servicios, te pedimos que leas detenidamente estos términos y condiciones, ya que establecen los términos bajo los cuales puedes acceder y utilizar nuestra PAYRY. \n\n1. Aceptación de los Términos \nAl acceder a PAYRY los usuarios reconocen haber leído y entendido los presentes términos y condiciones y estar de acuerdo con los mismos, así como con nuestra Política de Privacidad. KINCE se reserva el derecho de cambiar o modificar total o parcialmente los Términos y condiciones siendo responsabilidad de los usuarios verificar y consultarlos constantemente a efecto de conocer dichos cambios o modificaciones. \nSi por cualquier razón alguna disposición de estos términos y condiciones es declarada nula o inaplicable, dicha disposición será considerada como separada de los mismos y no afectará la validez y aplicabilidad de las disposiciones restantes. \n\n2. Descripción del Servicio \nPAYRY facilita las transacciones financieras entre los usuarios y el Sistema de Transferencias y Pagos STP, Institución de Fondos de Pago Electrónico (“STP”) a través de la interfaz de conexión automática (“API”) de KINCE que genera un CoDi® o DiMo® confirmando todos los movimientos de forma ágil y segura a través de Transacciones de Fondos de Pago Electrónico. \nEn PAYRY el usuario al crear su cuenta podrá asignar Cuentas CLABE diferentes ligadas a la Cuenta de Fondos de Pago Electrónico de KINCE dándole instrucciones sobre el manejo y destino de los Fondos, con la finalidad de identificar mediante PAYRY el estatus en las transacciones u operaciones que realice el usuario con terceros; para lo cual KINCE y el usuario deberán haber celebrado el instrumento jurídico respectivo que brinde certeza suficiente en el manejo, asignación y seguimiento de transacciones de las nuevas o ya existentes Cuentas CLABE del usuario ligadas a la Cuenta de Fondos de Pago Electrónico de KINCE; por lo que, este último será el único responsable de la administración de las cuentas y el seguimiento de los fondos en las mismas, salvo que STP tenga alguna intervención que lo haga responsable directamente. \nKINCE no asume responsabilidad alguna ni será responsable por cualquier daño o virus que pueda afectar el equipo de cómputo o aparatos móviles de los usuarios como resultado del acceso o uso de PAYRY, o por la descarga de cualquier información o contenido del mismo. \n\n2.1 Servicios Ofrecidos \nLos Usuarios a través del uso de PAYRY podrán: \nAdquirir y pagar en forma electrónica Bienes y/o Servicios. \nAbrir y gestionar productos financieros de manera digital. \nConsultar historial de sus transacciones de pago. \nRealizar compras presenciales por medio de generación de códigos CoDi® y DiMo®. \nRealizar el envío de mensajes de cobro a los clientes que tengan cuentas con las instituciones financieras participantes en el ecosistema “SPEI”, a efecto de que, con la aceptación del mensaje de cobro por el cliente, se procese la transferencia de los recursos a través de “SPEI” o a través de una transferencia mismo banco.\nTransferencias de Fondos. \nPago de contribuciones. \nPago de servicios. \nPagos por domiciliaciones. \nAsociación o des asociación de números telefónicos celulares a la Cuenta. \nDesbloqueo de la Contraseña o Factor de Autenticación y modificación de la Contraseña o Factor de Autenticación. \nKINCE se reserva el derecho a limitar o restringir los servicios ofrecidos de acuerdo con comportamientos irregulares en el uso de PAYRY por parte de los usuarios. \n\n3. Uso de PAYRY \nSolo los usuarios registrados pueden acceder a ciertas funciones de PAYRY. Nos reservamos el derecho de suspender o cancelar cuentas en caso de incumplimiento de estos términos, uso inapropiado, o actividades sospechosas. Los usuarios son responsables de mantener la confidencialidad de su información de inicio de sesión o en caso de acceso no autorizado. \n\n3.1 Requisitos y procedimientos para registrarse en PAYRY. (correo electrónico, contraseña, celular, validación y alta) \n\n4. Comisiones, Pagos Tarifas y Cancelaciones \nKINCE cobrará una comisión por el uso de PAYRY para procesar transacciones de pago. Los detalles específicos sobre las tarifas y comisiones se encontrarán en la sección de tarifas publicada en PAYRY y pueden estar sujetos a cambios. (Detalles sobre tarifas aplicables, cargos por transacciones, y políticas de cancelación. Procedimientos de pago, plazos, y responsabilidades del usuario). \n\n5. Responsabilidad \nPAYRY actúa únicamente como intermediario financiero en las Transacciones de Fondos de Pago Electrónico entre los usuarios y STP en la Cuenta de Fondos de Pago Electrónico de KINCE y no se hace responsable de cualquier fallo e interrupción en la prestación de servicios a reserva de lo previsto en el párrafo 2 cláusula 2 del presente. No nos responsabilizamos por pérdidas, daños o perjuicios derivados del uso de PAYRY o de terceros. \nEl acceso y uso de PAYRY será bajo propio riesgo del usuario; ni KINCE ni ninguna de las partes involucradas en la creación, transmisión o mantenimiento de PAYRY serán responsables por algún daño directo, indirecto, consecuente, incidental o punitivo de cualquier tipo, presuntamente derivado del acceso o uso de PAYRY o de la falta de habilidad para acceder o usarla. \nKINCE se abstiene de garantizar incluir información precisa y oportuna en PAYRY; ni asume alguna responsabilidad por errores u omisiones en la misma. Además, no garantiza ni declara que el uso de la información podrá constreñirse en derechos de terceros que no se encuentren afiliados a KINCE. \n\n5.1 Limitación de responsabilidad de la empresa en situaciones específicas \nDe igual forma, el usuario se obliga expresamente a mantener en todo momento y bajo toda circunstancia indemne a KINCE por las fallas, omisiones y/o problemas técnicos que se puedan generar en la utilización de PAYRY y en consecuencia no le trasladará responsabilidad alguna por daños, perjuicios o pérdidas resultantes de cualquier tipo de fraude o información falsa o incorrecta proporcionada. \nAl ser la utilización de PAYRY personal e intransferible, el usuario acepta y se hace responsable por cualquier uso que desde su dispositivo móvil se le dé a PAYRY en detrimento de los presentes términos y condiciones. En consecuencia de lo anterior, el usuario será completamente responsable ante KINCE y ante terceros, por cualquier proceso, reclamo, demanda, acción judicial, extrajudicial, y/o proceso administrativo que pueda sufrir KINCE en su contra, incluyendo todos los costos que puedan surgir por daños o perjuicios causados a KINCE y/o a terceros, ocasionados por actos, hechos u omisiones del usuario y/o terceros no autorizados para utilizar PAYRY durante el tiempo que la cuenta del usuario en PAYRY se encuentre vigente. Cualquier gasto o costo en que incurra KINCE para la defensa de sus intereses o cualquier suma que deba cancelar como consecuencia de las reclamaciones, o por cualquier otra actividad ilegal derivada del incumplimiento de las obligaciones de la ley y/o los términos y condiciones por parte del usuario, incluidos gastos de abogados, gastos de proceso judicial, entre otras deberá ser reintegrada por el usuario a KINCE. \nLa mera tolerancia de KINCE respecto del incumplimiento o la demora del usuario respecto del cumplimiento total o parcial de los presentes Términos y Condiciones, no se interpretará como un desistimiento o renuncia a sus derechos, como tampoco podrá interpretarse en el sentido de aceptar o consentir en la modificación de estos. \n\n6. Propiedad Intelectual y/o Industrial \nTodos los derechos de propiedad intelectual y/o industrial sobre PAYRY, incluyendo, pero no limitado a, derechos de autor, marcas registradas, patentes, diseño y código fuente, contenido sin limitarse a las fotografías, imágenes, textos, logos, diseños, marcas, nombres comerciales y datos que se incluyen en la misma, son propiedad de KINCE y protegidos por la Ley Federal del Derecho de Autor, por la Ley Federal de Protección a la Propiedad industrial y demás leyes relativas. Asimismo, como el contenido de PAYRY también tiene la consideración de programa de cómputo y desarrollo de software le resulta también de aplicación toda la normativa mexicana e internacional vigente en la materia. \nQueda expresamente prohibida la reproducción total o parcial de la información y contenido de PAYRY, ni de cualquiera de sus contenidos, sin el previo permiso expreso y por escrito de KINCE. \nAsimismo, queda totalmente prohibida la copia, reproducción, adaptación, modificación, distribución, comercialización, comunicación pública y/o privada en materia de derechos \nde autor, propiedad intelectual y/o industrial, así como el uso de los contenidos del sitio si no es con la previa autorización expresa y por escrito de KINCE. \nKINCE informa que el solo hecho de acceder y consultar PAYRY no concede licencia, autorización o derecho implícito alguno sobre los derechos de autor, propiedad intelectual y/o industrial o sobre cualquier otro derecho o propiedad relacionado, directa o indirectamente, con la información y los contenidos incluidos en PAYRY. \n\n7. Modificaciones \nNos reservamos el derecho de modificar, suspender o interrumpir cualquier aspecto de PAYRY en cualquier momento sin previo aviso. \n\n8. Ley Aplicable \nEstos términos y condiciones se rigen por las leyes de México. Cualquier disputa derivada de su interpretación o cumplimiento se resolverá exclusivamente en los tribunales competentes de Guadalajara, Jalisco; siendo optativo para las partes establecer el procedimiento respectivo para la resolución de controversias, ya sea mediante arbitraje o mediación extrajudicial bajo la legislación mexicana previo acuerdo por escrito. \n\n9. Contacto \nSi tienes alguna pregunta o comentario sobre estos términos y condiciones, puedes ponerte en contacto con nosotros a través de clientes@payry.mx\n\n10. CODI y DIMO son marcas registradas del Banco de México.\n\n11. Esta aplicacion es una oferta de producto dirigida solo para residentes en México.',
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
