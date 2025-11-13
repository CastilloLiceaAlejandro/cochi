# Cochi - Aplicación de Gestión Financiera Personal

> **Nombre:** Cochi (haciendo alusión a la alcancía con forma de puerquito)

---

## 📋 Tabla de Contenidos

- [Objetivos](#-objetivos)
- [Capacidades Técnicas](#-capacidades-técnicas)
- [Diseño](#-diseño)
- [Pantallas](#pantallas)
- [Tipos de Cuentas](#tipos-de-cuentas)
- [Tipos de Movimientos](#tipos-de-movimientos)
- [Casos de Uso](#-casos-de-uso)
- [Notas Importantes](#-notas-importantes)
- [Preguntas Pendientes](#-preguntas-pendientes)

---

## 🎯 Objetivos

La aplicación Cochi tiene como propósito principal ayudar al usuario a gestionar sus finanzas personales de manera eficiente:

- **Visualización de alcancía:** Mostrar el valor total basado en los movimientos registrados
- **Control de cuentas bancarias:** Visualizar el valor total de cuentas de crédito y débito
- **Seguimiento de ahorro:** Calcular y mostrar el importe mensual ahorrado
- **Análisis de gastos:** Visualizar el gasto mensual categorizado
- **Organización financiera:** Mantener un orden claro entre ingresos y egresos
- **Clasificación de movimientos:** Categorizar cada transacción registrada
- **Asistencia financiera:** Proporcionar insights sobre el manejo de finanzas personales

---

## 🔧 Capacidades Técnicas

- **Almacenamiento local:** Toda la información se almacena en el dispositivo del usuario de forma local (sin conexión a internet requerida)
- **Privacidad:** Los datos financieros permanecen en el dispositivo del usuario

---

## 🎨 Diseño

- **Framework:** Flutter
- **Estilo:** Fluent 2 Design System
- **Características visuales:**
  - Estilo redondeado y animado
  - Mezcla de gradientes y colores planos
  - Interfaz moderna y fluida

---

## Pantallas

- Login
- Home(Dashboard)
- Cuentas
- Categorias
- Pagos Recurrentes
- Prestamos
- Ahorros
- Movimientos
- Configuración

---

## Tipos de Cuentas

- Débito
    - Dinero Digital
    - Se ingresa y egresa dinero
    - Se realizan transferencias a otras cuentas
    - Se ingresan prestamos dados a terceros
    - Se egresan pagos solicitados a terceros
    - Se egresan pagos a cuentas de crédito
    - Se realizan egresos de tipo Ahorro a cuentas de ahorro
- Crédito
    - Dinero Digital
    - Se realizan egresos
    - Se ingresan pagos de cuentas de débito
- Fisica
    - Dinero fisico
    - Se realizan ingresos y egresos
- Ahorro
    - Dinero Digital ó Fisico Según sea la cuenta de ahorro
    - Se realizan ingresos de tipo Ahorro de cuentas de débito

---

## Tipos de Movimientos

- Ingreso (Salario, Bonificación, etc.)
    - Se debe establecer la cuenta de ingreso
- Egreso (Gasto, Gasto Recurrente, etc.)
    - Se debe establecer la cuenta de egreso

- Prestamo a Tercero (Prestamo dado por nosotros)
    - Se debe establecer la cuenta de la cual se hace el prestamo y en un futuro la cuenta a la cual se ingresará el monto dicho prestamo
    - Se debe relacionar a un prestamo a tercero creado
- Prestamo Personal (Prestamo que nos dan)
    - Se debe establecer la persona que nos dio el prestamo y en un futuro la cuenta de la cual se egresará el monto dicho prestamo
    - Se debe relacionar a un prestamo personal creado

- Transferencia (Transferencia entre cuentas)
    - Se debe establecer la cuenta de la cual se egresa el dinero y la cuenta a la cual se ingresa el dinero

- Ahorro (Ahorro)
    - Se debe establecer la cuenta de ahorro la cual debe estar asociada a otra cuenta de tipo Débito ó Alcancía

- Recurrente (Recurrente)
    - Se debe establecer la cuenta de la cual se egresa el dinero
    - Se debe relacionar a un gasto recurrente creado

---

## 📱 Casos de Uso

### 1. Mantenimiento de Categorías

#### 1.1 Registro de Categoría

**Campos requeridos:**
- Título de categoría
- Descripción
- Fecha de creación
- Tipo de movimiento (Ingreso/Egreso/etc)
- Emoji asignado

#### 1.2 Grid de Categorías

**Funcionalidad:**
- Visualización en grid con emoji y título
- Filtro de categorías visibles/no visibles
- Toggle para alternar visualización de categorías ocultas

#### 1.3 Edición de Categoría

**Capacidades:**
- Editar todos los valores de la categoría
- Visualizar movimientos relacionados con la categoría

#### 1.4 Estado de Visibilidad

**Funcionalidad:**
- Alternar estado de categoría a "No Visible"
- Mantener categoría en el sistema sin mostrarla por defecto

---

### 2. Mantenimiento de Cuentas

#### 2.1 Registro de Cuenta

**Campos requeridos:**
- Título de cuenta
- Descripción
- Fecha de creación
- Importe inicial
- Tipo de cuenta (Crédito/Débito/Cartera/Ahorro)
- Fecha de corte y fecha de pago
- Saldo definido
- Saldo actual
- Banco
- Color identificador
- Número de cuenta
- Indicador de cuenta principal

#### 2.2 Listado/Grid de Cuentas

**Información mostrada:**
- Título de cuenta
- Tipo de cuenta
- Importe actual
- Color asignado
- Indicador de cuenta principal
- **Cuentas de crédito:** Saldo definido vs. saldo actual

#### 2.3 Edición de Cuenta

**Funcionalidad:**
- Editar todos los valores de la cuenta

---

### 3. Mantenimiento de Movimientos

#### 3.1 Registro de Movimiento

**Campos requeridos:**
- Título de movimiento
- Descripción
- Fecha de transacción
- Importe
- Cuenta asociada
- Categoría asignada

#### 3.2 Listado de Movimientos

**Características:**
- Orden cronológico
- Información mostrada:
  - Título de movimiento
  - Fecha de transacción
  - Importe
  - Cuenta
  - Categoría
  - Tipo de movimiento (Ingreso/Egreso/etc)

#### 3.3 Operaciones Adicionales

- Edición de movimiento
- Eliminación lógica de movimiento

---

### 4. Pantalla Home (Dashboard)

#### 4.1 Selector de Mes y Año

**Funcionalidad:**
- Selección de período para visualizar resumen
- Valor por defecto: mes y año actual

#### 4.2 Selector de Cuenta

**Funcionalidad:**
- Selección de cuenta para visualizar resumen
- Valor por defecto: cuenta principal

#### 4.3 Total de Importe

**Información mostrada:**
- Importe total de la cuenta seleccionada
- Porcentaje de ingresos y egresos del mes actual

#### 4.4 Gráfica Pie de Estado de Cuenta

**Visualización:**
- Porcentaje de ingresos vs. egresos del mes actual

#### 4.5 Gráfica Pie de Movimientos por Categoría

**Visualización:**
- Distribución porcentual de ingresos y egresos por categoría
- Período: mes actual

#### 4.6 Manejo de Créditos

**Información mostrada:**
- Saldo de la cuenta de crédito
- Saldo disponible

---

## 📝 Notas Importantes

### Transferencias entre Cuentas

El sistema debe manejar transferencias de dinero entre cuentas para mantener trazabilidad de:
- Pagos de tarjetas de crédito desde cuentas de débito
- Movimientos internos entre cuentas del usuario

### Proyección de Saldo

**Escenario ejemplo:**
- Usuario recibe sueldo en cuenta principal
- Realiza compras con tarjeta de crédito durante el mes
- El sistema debe:
  - Mostrar el importe total actual (sueldo completo)
  - Calcular y mostrar el **estimado de fin de mes**
  - Proyectar el saldo restante después del pago de la tarjeta de crédito
  - Diferenciar entre saldo actual y saldo proyectado

---

## ❓ Preguntas Pendientes

### 1. Autenticación y Seguridad
- ¿Se requiere algún mecanismo de autenticación (PIN, biometría) para acceder a la aplicación?
  + R: Biometría
- ¿Se necesita cifrado de la base de datos local?
  + R: No

### 2. Respaldo y Recuperación
- ¿Se implementará algún sistema de respaldo/exportación de datos?
  + R: Sí
- ¿Formato de exportación deseado? (JSON, CSV, PDF)
  + R: JSON
- ¿Capacidad de importar datos desde otras aplicaciones?
  + R: Sí, pero sería desde una exportación de esta aplicación en caso de que se migre de dispositivo

### 3. Transferencias entre Cuentas
- ¿Cómo se registrará una transferencia entre cuentas? ¿Como un movimiento especial o dos movimientos vinculados?
  + R: Dos movimientos vinculados para presentar el egreso y el ingreso
- ¿Las transferencias deben afectar las estadísticas de ingresos/egresos o deben ser neutrales?
  + R: Sí, afectan las estadísticas

### 4. Categorías
- ¿Se proporcionará un conjunto de categorías predeterminadas al instalar la aplicación?
  + R: No
- ¿Cuántas categorías predeterminadas se incluirán?
  + R: 0

### 5. Cuentas de Crédito
- ¿Cómo se manejará el pago parcial de una tarjeta de crédito? Detalla las validaciones necesarias (comparar contra saldo pendiente), las actualizaciones de saldo (actual, estimado, pendiente) y el registro en el historial.
  + R: Se deduce al comparar el saldo pendiente con el abono ingresado.
- ¿Se debe calcular automáticamente el pago mínimo y el pago para no generar intereses?
  + R: No
- ¿Se requiere tracking de intereses generados?
  + R: No por ahora

### 6. Notificaciones
- ¿Se requieren notificaciones/recordatorios para fechas de corte o pago de tarjetas?
  + R: Sí
- ¿Alertas cuando el saldo de una cuenta esté bajo?
  + R: No

### 7. Reportes
- ¿Qué otros reportes o visualizaciones se requieren además de las gráficas pie?
  + R: Gráfica de Lineas para mostrar el importe total de la cuenta seleccionada, Gráfica de Lineas para mostrar los Importes Totales Finales de cada Mes
- ¿Reportes mensuales, trimestrales, anuales?
  + R: Sí
- ¿Comparativas entre períodos?
  + R: Sí

### 8. Moneda
- ¿La aplicación manejará una sola moneda o múltiples monedas?
  + R: Por el momento una sola moneda
- ¿Se requiere conversión de divisas?
  + R: No

### 9. Movimientos Recurrentes
- ¿Se necesita la capacidad de registrar movimientos recurrentes (suscripciones, renta, etc.)?
  + R: Sí
- ¿Generación automática de estos movimientos?
  + R: Que se genere una notificación para que el usuario pueda confirmar el movimiento o entrar a Crearlo

### 10. Presupuestos
- ¿Se implementará un sistema de presupuestos por categoría?
  + R: Sí
- ¿Alertas cuando se exceda el presupuesto establecido?
  + R: Sí

### 11. Metas de Ahorro
- ¿Se requiere funcionalidad para establecer y trackear metas de ahorro?
  + R: Sí
- ¿Visualización de progreso hacia las metas?
  + R: Sí

### 12. Cuenta Principal
- ¿Puede haber más de una cuenta principal o es única?
  + R: Por el momento solo se manejará una cuenta principal la cual será a la que caiga el sueldo
- ¿Qué comportamiento especial tiene la cuenta principal vs. otras cuentas?
  + R: La cuenta principal es la que se muestra por defecto y de la cual importa saber el importe total y por el cual se estima cuales fueron los gastos totales o ahorros totales en base da todos lo movimientos del mes

### 13. Eliminación de Datos
- ¿Las categorías pueden eliminarse si tienen movimientos asociados?
  + R: No
- ¿Las cuentas pueden eliminarse si tienen movimientos asociados?
  + R: No
- ¿Qué sucede con los movimientos huérfanos?
  + R: Profundiza más con la pregunta

### 14. Plataformas
- ¿La aplicación será para iOS, Android o ambas?
  + R: Android por el momento pero tratemos de hacerla para ambas plataformas
- ¿Se requiere versión web/desktop?
  + R: No

---

## 🔍 Preguntas de Profundización

### 15. Tipo de Movimiento "Préstamo"
- ¿Cómo se diferencia un préstamo de un ingreso/egreso regular?
  + R: Un préstamo es un movimiento que se debe pagar en un plazo determinado y cuando se realice el pago se debe registrar el pago como egreso en caso de que nosotros lo debamos pagar(Como el pago de una tarjeta de crédito) o como ingreso en caso de que ellos nos lo deban pagar(Como el pago de una deuda)
- ¿Los préstamos tienen una fecha de vencimiento o plazo de pago?
  + R: Sí si así se define en el movimiento
- ¿Se debe trackear si el préstamo es dinero que presté (a cobrar) o dinero que me prestaron (a pagar)?
  + R: Sí
- ¿Los préstamos deben aparecer en las estadísticas de ingresos/egresos o en una sección separada?
  + R: Sí
- ¿Se requiere tracking de pagos parciales de préstamos?
  + R: Los abonos parciales deben comportarse igual que los de las tarjetas de crédito (registrar monto, fecha, cuenta de origen/destino y saldo restante). Además, cada pago debe actualizar el calendario de vencimientos del préstamo.
- ¿Qué atributos debe almacenar cada pago parcial del préstamo? (monto, fecha, intereses, saldo restante, notas)
  + R: Los mismo de los pagos parciales de tarjetas de crédito
- ¿Se deben generar recordatorios automáticos para los vencimientos de préstamos?
  + R: Sí
- ¿Los préstamos deben manejar intereses o comisiones? En caso afirmativo, ¿cómo se calculan?
  + R: De la misma manera que las tarjetas de crédito
- ¿Cada préstamo debe vincularse con cuentas específicas de origen y destino para los abonos?
  + R: Los prestamos se tienen que manejar como prestamos personales y prestamos de terceros ya que unos se manejan como egresos y otros como ingresos
- ¿Cómo deben reflejarse los préstamos en las estadísticas (agrupados, etiqueta especial, apartado propio)?
  + R: Apartado propio
- ¿Los préstamos deben tener una categoría especial o usar las categorías existentes?
  + R: Los prestamos van a ser movimientos referenciados a un Prestamo Creado
- En caso de usar una categoría especial para préstamos, ¿qué atributos o color distintivo debe tener?
  + R: Definido por el usuario

### 16. Pagos Parciales de Tarjetas de Crédito
- Cuando se realiza un pago parcial de una tarjeta de crédito, ¿cómo se debe reflejar en el saldo disponible?
  + R: si el Saldo actual de la tarjeta de Crédito es de 500 y y se tiene un total de 1500 en la cuenta principal
    - El saldo total es 1500, el saldo estimado es 1000, y el saldo pediente de pago es 500
    - Si se llegan a pagar 100 a mitad de mes desde la cuenta principal el saldo total pasa a ser 1400, el saldo estimado es 1000 y el saldo pediente de pago es 400
- ¿El sistema debe mostrar el saldo pendiente por pagar de la tarjeta?
  + R: Sí
- ¿Se debe poder registrar múltiples pagos a una tarjeta en el mismo mes?
  + R: Sí
- ¿Cómo afecta un pago parcial a la proyección de fin de mes?
  + R: Según como respondí en la pregunta 'Cuando se realiza un pago parcial de una tarjeta de crédito, ¿cómo se debe reflejar en el saldo disponible?'
- ¿La proyección debe recalcularse inmediatamente después de registrar cada pago parcial?
  + R: Sí
- ¿Se necesita un historial detallado de pagos parciales por tarjeta (fecha, monto, cuenta origen)?
  + R: Sí
- ¿Se deben generar recordatorios para pagos parciales programados?
  + R: Sí

### 17. Movimientos Huérfanos
- Si se intenta eliminar una categoría/cuenta con movimientos asociados, ¿qué mensaje se debe mostrar al usuario?
  + R: No se debe de poder eliminar una categoría/cuenta con movimientos asociados
- ¿Se debe ofrecer la opción de reasignar los movimientos a otra categoría/cuenta antes de eliminar?
  + R: No
- ¿O simplemente se bloquea la eliminación mientras existan movimientos asociados?
  + R: Sí

### 18. Autenticación Biométrica
- ¿La autenticación biométrica es obligatoria o el usuario puede optar por no usarla?
  + R: Opcional entre biométrica y PIN pero de preferencia que sea biométrica
- ¿Se debe solicitar autenticación cada vez que se abre la app o solo después de cierto tiempo de inactividad?
  + R: Cada vez que se abre la app
- ¿Qué sucede si el dispositivo no tiene capacidades biométricas? ¿Se ofrece PIN como alternativa?
  + R: Se ofrece PIN como alternativa

### 19. Exportación/Importación de Datos
- ¿Dónde se guardará el archivo de exportación? (almacenamiento local, compartir por email, etc.)
  + R: Que se tenga la opción de exportar a un archivo JSON que se pueda compartir por email, whatsapp, telegram, etc. o guardar en la nube o descargarse
- ¿La importación debe validar la estructura del JSON o confiar en que es una exportación válida?
  + R: Debe validar la estructura del JSON
- ¿Se debe permitir importación parcial (solo categorías, solo cuentas, etc.) o siempre completa?
  + R: Siempre completa ya que la exportación es completa
- ¿Qué sucede si se importan datos que duplican información existente?
  + R: Se debe mostrar un mensaje de advertencia y se debe permitir al usuario decidir qué hacer 
- ¿Qué opciones específicas debe ofrecer la advertencia al detectar duplicados? (sobrescribir, omitir, fusionar, crear copia)
  + R: Se debe ofrecer la opción de sobrescribir u omitir
- En caso de mantener ambos registros, ¿cómo se evita la duplicidad de identificadores internos?
  + R: Solo existirá la opción de sobrescribir u omitir

### 20. Transferencias entre Cuentas
- ¿Los dos movimientos vinculados deben crearse automáticamente al registrar una transferencia?
  + R: El usuario debe definir la cuenta de origen y la cuenta de destino
- ¿Qué categoría se asigna a las transferencias? ¿Una categoría especial de "Transferencia"?
  + R: Sí
- ¿Se debe poder editar/eliminar los movimientos de transferencia de forma independiente o siempre en par?
  + R: Siempre en par, cuando se realice un movimiento de transferencía se deben de crear automaticamente 2 movimientos pero debe de presentarse como 1 en el listado de movimientos, y en caso de que se desee editar se deben de editar los 2 movimientos
- ¿Cómo se visualiza la vinculación entre los dos movimientos en la interfaz?
  + R: Cuando se registre un movimiento de transferencia se debe de mostrar una tarjeta que indique que es una transferencia y que los 2 movimientos están vinculados
- ¿Se debe permitir cambiar la cuenta de origen o destino después de creada la transferencia?
  + R: No
- ¿Las transferencias pueden incluir comisiones o cargos adicionales? ¿Cómo se registran?
  + R: No
- ¿Se deben generar notificaciones cuando se crea, edita o elimina una transferencia?
  + R: No

### 21. Notificaciones de Fechas de Corte/Pago
- ¿Con cuántos días de anticipación se debe notificar?
  + R: 1 día por defecto con la capacidad de ser configurado por el usuario
- ¿Las notificaciones son configurables por el usuario?
  + R: Sí
- ¿Se pueden desactivar notificaciones para cuentas específicas?
  + R: Sí
- ¿Qué información debe incluir la notificación? (monto a pagar, cuenta, etc.)
  + R: Monto a pagar, cuenta, fecha de corte/pago

### 22. Gráficas de Líneas
- Para la gráfica de "Importes Totales Finales de cada Mes", ¿cuántos meses se deben mostrar? (últimos 6, 12, año completo, etc.)
  + R: Por defecto 3 meses con la capacidad de ser configurado por el usuario
- ¿Las gráficas deben ser interactivas (zoom, tooltips, etc.)?
  + R: Sí
- ¿Se debe poder filtrar las gráficas por tipo de cuenta?
  + R: Sí
- ¿Las gráficas deben incluir proyecciones futuras basadas en movimientos recurrentes?
  + R: Sí

### 23. Reportes Comparativos
- ¿Qué tipo de comparativas se requieren? (mes vs mes anterior, año vs año anterior, etc.)
  + R: Mes vs mes anterior por defecto con la capacidad de ser configurado por el usuario
- ¿Se debe mostrar el porcentaje de variación entre períodos?
  + R: Sí
- ¿Los reportes deben ser exportables? ¿En qué formato?
  + R: PDF, Excel, CSV, JSON

### 24. Movimientos Recurrentes
- ¿Qué periodicidades se deben soportar? (diaria, semanal, quincenal, mensual, anual, etc.)
  + R: Diaria, semanal, quincenal, mensual, bimestral, trimestral, semestral, anual y indefinida; como la creación de eventos en Google Calendar
- ¿Los movimientos recurrentes tienen fecha de inicio y fin, o son indefinidos?
  + R: Debe de ser definida por el usuario, poniendo de ejemplo el pago de luz que es el dia 15 de cada mes y se tienen 10 dias para pagar, o la tarjeta de crédito que se realiza el corte el 25, la fecha idonea de pago es el 1ro de cada mes y se tiene hasta el dia 5 de cada mes para pagar
- ¿Se debe poder editar una ocurrencia específica sin afectar las demás?
  + R: Sí
- ¿Qué sucede si el usuario no confirma la notificación? ¿Se crea el movimiento automáticamente después de cierto tiempo?
  + R: No
- ¿Se debe poder pausar temporalmente un movimiento recurrente?
  + R: Sí
- ¿Con cuánta anticipación se debe enviar la notificación para confirmar un movimiento recurrente? ¿Es configurable?
  + R: 1 día por defecto con la capacidad de ser configurado por el usuario
- ¿Se debe registrar un historial de notificaciones ignoradas o rechazadas?
  + R: Sí
  + Nota: Cuando se solicite "Profundiza" en futuras preguntas, se espera detallar campos, validaciones, flujos y ejemplos concretos.

### 25. Presupuestos por Categoría
- ¿Los presupuestos son mensuales, anuales o personalizables?
  + R: Mensuales por defecto con la capacidad de ser configurado por el usuario
- ¿Se debe mostrar el progreso del presupuesto en tiempo real?
  + R: Sí
- ¿Qué tipo de alerta se muestra al exceder el presupuesto? (notificación, indicador visual, etc.)
  + R: Notificación e indicador visual en Home
- ¿Se puede establecer un presupuesto general además de por categoría?
  + R: Sí, supongamos que coloco un presupuesto general de 5000 y no coloco presupuesto por categoría, entonces al hacer uso de la categoría de Alimentos y al no tener presupuesto para dicha categoría se le restará al presupuesto general el monto del movimiento
- ¿Los presupuestos se renuevan automáticamente cada período?
  + R: Sí
- Cuando existen presupuestos por categoría y uno general, ¿cuál tiene prioridad para los cargos?
  + R: El presupuesto general tiene prioridad para los cargos que no se les coloque presupuesto por categoría
- ¿Se debe generar algún reporte de excedentes o ahorros al cierre de cada período?
  + R: Sí

### 26. Metas de Ahorro
- ¿Las metas de ahorro están vinculadas a una cuenta específica o son independientes?
  + R: Al crear una meta de ahorro se debe de crear una cuenta de tipo "Ahorro" en la cual se depositarán los movimientos que se realicen para alcanzar la meta
    Ejemplo: Tengo una cuenta de débito y le creo una subcuenta de "ahorro vacaciones" y otra subcuenta de "ahorro estufa" y a cada una de esas subcuentas les realizo sus debidas transferencias de ahorro, suponiendo que esa es la unica función de esa tarjeta la cual sirve para "ahorrar", su saldo debería de ser de 0 ya que los ingresos que se realizan a esa tarjeta son hacia las subcuentas de ahorro, no a la cuenta de la tarjeta misma.
- ¿Se debe poder establecer una fecha límite para alcanzar la meta?
  + R: Sí
- ¿El sistema debe sugerir cuánto ahorrar mensualmente para alcanzar la meta?
  + R: Sí
- ¿Se pueden tener múltiples metas activas simultáneamente?
  + R: Sí
- ¿Qué sucede cuando se alcanza una meta? ¿Se archiva, se elimina, se marca como completada?
  + R: Se marca como completada
- ¿Se debe poder hacer aportes manuales a una meta de ahorro?
  + R: Sí
- ¿Se pueden mover fondos entre metas de ahorro diferentes?
  + R: Sí
- Cuando se completa una meta, ¿qué se hace con el saldo de la subcuenta asociada?
  + R: Se archiva
- ¿Se permite retirar parcialmente fondos de una meta antes de completarla?
  + R: Sí

### 27. Cuentas de Tipo "Cartera" y "Ahorro"
- ¿Cuál es la diferencia funcional entre cuenta tipo "Cartera" y "Débito"?
  + R: La cuenta de tipo "Cartera" representa efectivo físico, normalmente dado por otra persona o como un egreso de tipo "retiro de dinero" de una de las cuentas, dicho dinero se "transfiere" a la cuenta de tipo "Cartera" y se puede retirar en cualquier momento de cualcuer cuenta con fondos, por lo que no se debe de aplicar ningún tipo de interés ni restricciones de retiro. Los movimientos que sean transferencias hacia la cuenta de tipo Cartera no deben de afectar positivamente al saldo restante mensual ya que el saldo restante mensual se refiere al saldo restante de la cuenta de débito
- ¿Las cuentas de tipo "Ahorro" tienen algún comportamiento especial? (intereses, restricciones de retiro, etc.)
  + R: No
- ¿Las cuentas de "Cartera" representan efectivo físico?
  + R: Sí

### 28. Fechas de Corte y Pago
- ¿Las fechas de corte y pago solo aplican a cuentas de crédito o también a otros tipos?
  + R: Por el momento sí
- ¿Qué sucede si la fecha de pago cae en fin de semana o día festivo?
  + R: No importa
- ¿Se debe poder modificar estas fechas después de crear la cuenta?
  + R: Sí

### 29. Visualización de Datos
- ¿Se requiere modo oscuro (dark mode)?
  + R: Sí
- ¿Los colores de las cuentas deben ser seleccionables de una paleta predefinida o completamente personalizables?
  + R: Completamente personalizables
- ¿Se debe poder personalizar el orden de visualización de cuentas y categorías?
  + R: Sí, ya sea mediante ordenamiento de Drag and Drop o mediante un menú desplegable para ordenamiento de monto, nombre, fecha de creación, etc.
- ¿Se requieren opciones de accesibilidad adicionales (contraste alto, tamaños de fuente ajustables)?
  + R: No
- ¿El modo oscuro debe activarse automáticamente según la configuración del sistema?
  + R: Sí

### 30. Validaciones y Reglas de Negocio
- ¿Se debe validar que el saldo de una cuenta no quede negativo (excepto crédito)?
  + R: Sí
- ¿Hay un límite máximo de cuentas, categorías o movimientos que se pueden crear?
  + R: No
- ¿Se debe validar que la fecha de transacción no sea futura?
  + R: Sí
- ¿Se permite editar movimientos de meses anteriores o solo del mes actual?
  + R: Solo del mes actual, pero se pueden modificar las descripciones de movimientos anteriores
- En caso de necesitar corregir montos de meses anteriores, ¿se maneja mediante ajustes o notas?
  + R: Ajustes
- ¿Existe un proceso de auditoría o historial de cambios para movimientos editados?
  + R: Sí

### 31. Proyección de Fin de Mes
- ¿La proyección debe considerar solo los movimientos recurrentes confirmados o también los pendientes?
  + R: Todos en caso de que el movimiento recurrente no haya sido pausado u omitido
- ¿Se debe mostrar un escenario optimista y pesimista, o solo uno? (Optimista: excluye egresos pendientes y considera ingresos proyectados; Pesimista: incluye todos los egresos previstos y excluye ingresos no confirmados).
  + R: Ignoremos esto por el momento
- ¿La proyección debe incluir los pagos programados de tarjetas de crédito?
  + R: Sí
- ¿Cómo se visualiza esta proyección en la interfaz? ¿En el dashboard, en un reporte separado?
  + R: En el dashboard
- ¿Qué variables diferencian el escenario optimista del pesimista (por ejemplo, exclusión de egresos pendientes, inclusión de ahorros planificados)?
  + R: Ignoremos esto por el momento
- ¿El usuario puede personalizar los supuestos de cada escenario de proyección?
  + R: Ignoremos esto por el momento

### 32. Onboarding y Primera Experiencia
- ¿Se requiere un tutorial o guía inicial para nuevos usuarios?
  + R: Sí
- ¿Se debe solicitar la creación de la cuenta principal durante el primer uso?
  + R: Sí
- ¿Hay alguna configuración inicial requerida (moneda, idioma, etc.)?
  + R: Sí
- ¿Qué parámetros específicos se solicitan en la configuración inicial (moneda, idioma, zona horaria, país, otros)?
  + R: Moneda, idioma, zona horaria, país
- ¿El tutorial debe ser interactivo (pasos guiados) o informativo (pantallas de ayuda)?
  + R: Interactivo
