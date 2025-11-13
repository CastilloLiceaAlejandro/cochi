# TODOs Cochi

## Fase 1 · Estructura Básica
- [ ] Configurar tema global con Fluent 2 (Material 3 + acentos personalizados).
- [ ] Implementar navegación principal con rutas para Home, Cuentas, Categorías, Pagos Recurrentes, Préstamos, Ahorros, Movimientos y Configuración.
- [ ] Crear layout base del dashboard con Scaffold, NavigationBar y placeholders por sección.

## Fase 2 · Modelo de Datos y Persistencia Local
- [ ] Definir entidades principales (Cuenta, Movimiento, Categoría, Préstamo, PagoRecurrente, Presupuesto, MetaAhorro).
- [ ] Seleccionar e integrar almacenamiento local (ej. Drift/Isar/Sqflite) y servicios CRUD iniciales.
- [ ] Implementar repositorio para sincronizar cálculos de saldos, abonos parciales y transferencias vinculadas.

## Fase 3 · Funcionalidades Prioritarias
- [ ] Desarrollar CRUD de Cuentas con tipos y atributos completos.
- [ ] Desarrollar CRUD de Categorías con control de visibilidad y asignación de emoji.
- [ ] Implementar registro y listado cronológico de Movimientos con clasificación y búsqueda básica.
- [ ] Añadir soporte para transferencias automáticas (movimientos espejo) y abonos parciales deducidos del saldo pendiente.
- [ ] Construir módulo de Pagos Recurrentes con confirmaciones vía notificación.

## Fase 4 · Inteligencia Financiera y Reportes
- [ ] Implementar tableros de presupuesto general/categorizado con alertas visuales.
- [ ] Construir metas de ahorro con subcuentas dedicadas y seguimiento de progreso.
- [ ] Integrar gráficas (líneas y pastel) y comparativas exportables (PDF/Excel/CSV/JSON).
- [ ] Generar proyección de fin de mes con recalculo tras cada movimiento relevante.

## Fase 5 · Experiencia de Usuario
- [ ] Añadir autenticación biométrica/PIN y control de sesión.
- [ ] Configurar sistema de notificaciones según preferencias del usuario (cortes, pagos, recurrentes, presupuesto).
- [ ] Documentar onboarding y tutorial interactivo.
- [ ] Preparar paquete de exportación/importación de datos en JSON con validaciones.
