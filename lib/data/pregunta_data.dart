import 'package:at_cliente_upds/model/pregunta.dart';

const tipoSeleccion = 'seleccion';
const tipoAbierto = 'abierto';

final preguntas = <PreguntasGeneral>[
  PreguntasGeneral(pregunta: '¿Que trámite y/o servicio realizó en UPDS?'),
  PreguntasGeneral(
      pregunta:
          'Califique la calidad de atención que recibió en su trámite y/o servicio recibido.'),
  PreguntasGeneral(pregunta: '¿Quiere agregar algún comentario?'),
];

final preguntascomunes = <Pregunta>[
  Pregunta(
    pregunta:
        'Califique la calidad de atención que recibió en su trámite y/o servicio recibido.',
    tipo: tipoSeleccion,
    opciones: [
      Opcion('Excelente.'),
      Opcion('Buena.'),
      Opcion('Aceptable.'),
      Opcion('Necesita mejorar.'),
    ],
  ),
  Pregunta(
    pregunta: '¿Quiere agregar algún comentario?',
    tipo: tipoAbierto,
    opciones: [],
  )
];

final preguntasM = <Pregunta>[
  Pregunta(
    pregunta: '¿Que trámite y/o servicio realizó en UPDS?',
    tipo: tipoSeleccion,
    opciones: [
      Opcion('Atención al cliente.'),
      Opcion('Inscripciones.'),
      Opcion('Convalidaciones.'),
      Opcion('Homologaciones.'),
      Opcion('Habilitación de becas.'),
    ],
  ),
  ...preguntascomunes,
];

final preguntasCJ = <Pregunta>[
  Pregunta(
    pregunta: '¿Que trámite y/o servicio realizó en UPDS?',
    tipo: tipoSeleccion,
    opciones: [
      Opcion('Cobros varios.'),
      Opcion('Anulación y devolución.'),
      Opcion('Transferencias de pagos.'),
      Opcion('Solicitud de comprobante de pago.'),
      Opcion('Cobro de cuota diferenciada.'),
      Opcion('Cobro para cambio de carrera.')
    ],
  ),
  ...preguntascomunes,
];

final preguntasRE = <Pregunta>[
  Pregunta(
    pregunta: '¿Que trámite y/o servicio realizó en UPDS?',
    tipo: tipoSeleccion,
    opciones: [
      Opcion('Programación de materia.'),
      Opcion('Información de materia habilitada.'),
      Opcion('Impresión de avance académico.'),
      Opcion('Impresión de programación.'),
      Opcion(
          'Información de la planificación semestral de materia según carrera.'),
      Opcion('Programación de MDG I y II.')
    ],
  ),
  ...preguntascomunes,
];

final preguntasTR = <Pregunta>[
  Pregunta(
    pregunta: '¿Que trámite y/o servicio realizó en UPDS?',
    tipo: tipoSeleccion,
    opciones: [
      Opcion('Convalidación externa.'),
      Opcion('Convalidación interna, cambio de sede.'),
      Opcion('Convalidación interna, cambio de carrera.'),
      Opcion('Homologación.'),
      Opcion(
          'Solicitud de documentos académicos legalizados (Certificado de notas, programas analíticos)'),
      Opcion('Legalización de diplomas académicos.'),
      Opcion('Trámites de título profesional.'),
      Opcion('Trámite de diploma académico.'),
      Opcion('Revisión de documentos para trámites.'),
      Opcion('Entrega a solicitud de 1 copia de original de acta de defensa.'),
    ],
  ),
  ...preguntascomunes,
];

final preguntasEU = <Pregunta>[
  Pregunta(
    pregunta: '¿Que trámite y/o servicio realizó en UPDS?',
    tipo: tipoSeleccion,
    opciones: [
      Opcion('Socialización y comunicación de actividades culturales.'),
      Opcion('Socialización y comunicación de actividades deportivas.'),
      Opcion('Socialización y comunicación de actividades culturales.'),
      Opcion('Información de actividades.'),
      Opcion(
          'Atención a estudiantes para su inclusión a las actividades programadas.'),
    ],
  ),
  ...preguntascomunes,
];

final preguntasSIST = <Pregunta>[
  Pregunta(
    pregunta: '¿Que trámite y/o servicio realizó en UPDS?',
    tipo: tipoSeleccion,
    opciones: [
      Opcion('Cuenta de estudiantes office 365.'),
      Opcion('Carné universitario.'),
      Opcion('Acceso moodle.'),
    ],
  ),
  ...preguntascomunes,
];

final preguntasSEG = <Pregunta>[
  Pregunta(
    pregunta: '¿Que trámite y/o servicio realizó en UPDS?',
    tipo: tipoSeleccion,
    opciones: [
      Opcion('Registro de ingresos de estudiantes.'),
      Opcion('Registro de ingreso de personas externas.'),
      Opcion('Seguridad al interior de la Universidad.'),
      Opcion('Protección personal a estudiantes.'),
      Opcion('Protección al personal de la Universidad.'),
      Opcion('Respuesta en caso de emergencias.'),
    ],
  ),
  ...preguntascomunes,
];

final preguntasVICER = <Pregunta>[
  Pregunta(
    pregunta: '¿Que trámite y/o servicio realizó en UPDS?',
    tipo: tipoSeleccion,
    opciones: [
      Opcion('Atención de consultas y dudas académicas.'),
      Opcion('Información general del área académica.'),
      Opcion('Solicitud de certificado de estudios.'),
      Opcion('Atención de reclamos y/o quejas.'),
      Opcion('Atención a estudiantes sobre defensa externa.'),
    ],
  ),
  ...preguntascomunes,
];

final preguntasRECT = <Pregunta>[
  Pregunta(
    pregunta: '¿Que trámite y/o servicio realizó en UPDS?',
    tipo: tipoSeleccion,
    opciones: [
      Opcion('Requerimientos fiscales.'),
      Opcion('Solicitud de desprogramación de materia.'),
      Opcion('Solicitud de devolución de monto.'),
      Opcion('Órdenes judiciales.'),
      Opcion('Solicitud de audiencias.'),
      Opcion('Atención de reclamos.'),
    ],
  ),
  ...preguntascomunes,
];

final preguntasBLI = <Pregunta>[
  Pregunta(
    pregunta: '¿Que trámite y/o servicio realizó en UPDS?',
    tipo: tipoSeleccion,
    opciones: [
      Opcion('Préstamo de libros.'),
      Opcion('Préstamos de tesis.'),
    ],
  ),
  ...preguntascomunes,
];

final preguntasBE = <Pregunta>[
  Pregunta(
    pregunta: '¿Que trámite y/o servicio realizó en UPDS?',
    tipo: tipoSeleccion,
    opciones: [
      Opcion('Reclamos de estudiantes.'),
      Opcion('Consultas relacionadas al reglamento de estudiantes.'),
      Opcion('Consultas relacionadas a las becas.'),
      Opcion('Consultas relacionadas al seguro contra accidentes.'),
      Opcion('Información de permisos y faltas.'),
      Opcion('Información de rendimiento académico.'),
      Opcion('Apoyo a estudiantes.'),
    ],
  ),
  ...preguntascomunes,
];

final preguntasFI = <Pregunta>[
  Pregunta(
    pregunta: '¿Que trámite y/o servicio realizó en UPDS?',
    tipo: tipoSeleccion,
    opciones: [
      Opcion('Atención a padres de familia por información de sus hijos.'),
      Opcion('Cambio de turno.'),
      Opcion('Creación de grupo para preinscrito de MDG.'),
      Opcion('Desprogramación de materia.'),
      Opcion('Entrega de formularios de práctica profesional.'),
      Opcion('Preinscripción para MDG.'),
      Opcion('Programación especial.'),
      Opcion(
          'Recepción, verificación y revisión de tesis en físico y digital.'),
      Opcion('Revisión de notas.'),
      Opcion('Revisión de programación.'),
      Opcion('Solicitud de licencia.'),
      Opcion('Solicitud de materia para invierno y verano.'),
    ],
  ),
  ...preguntascomunes,
];

final preguntasAP = <Pregunta>[
  Pregunta(
    pregunta: '¿Que trámite y/o servicio realizó en UPDS?',
    tipo: tipoSeleccion,
    opciones: [
      Opcion('Revisión de notas.'),
      Opcion('Apoyo en revisión de tesis (MDG).'),
      Opcion('Consultas relacionadas al reglamento de estudiantes.'),
      Opcion('Reclamos de atención a docentes.'),
      Opcion('Información relacionada al rendimiento académico.'),
      Opcion('Actividades académicas.'),
    ],
  ),
  ...preguntascomunes,
];

/*Pregunta(
    pregunta:
        'Califique el tiempo de atención en su trámite y/o servicio recibido',
    tipo: tipoSeleccion,
    opciones: [
      Opcion('Rápido.'),
      Opcion('Aceptable.'),
      Opcion('Lento.'),
    ],
  ),*/