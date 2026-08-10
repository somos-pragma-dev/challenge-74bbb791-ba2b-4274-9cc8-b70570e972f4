# Implementación de CRUD con Rails y RSpec

La empresa necesita un sistema de gestión de productos que permita a los usuarios crear, leer, actualizar y eliminar productos. Los productos tienen atributos como nombre, precio, stock y categoría. El sistema debe prohibir precios negativos y nombres duplicados. Además, debe manejar correctamente los errores de validación y proporcionar retroalimentación al usuario.

## Informacion General

| Campo | Valor |
|-------|-------|
| **Tema** | crud-con-rails-rspec |
| **Nivel** | junior-l2 |
| **Tipo** | practical |
| **Tiempo estimado** | 8 horas |

## Fases del Reto

### Fase 0: Configuración del Proyecto

**Objetivo:** Obtener el proyecto base funcional enviando el Código Base a un asistente de IA, que lo analizará, corregirá errores y generará un ZIP listo para usar.

**Tiempo estimado:** 15-30 minutos

**Instrucciones:**

- Asegúrate de tener instalado para ejecutar el proyecto: Un IDE o editor de código.
- Copia todo el contenido del campo **Código Base** de este reto — incluyendo el texto de instrucciones que aparece al inicio.
- Abre un asistente de IA (Claude en claude.ai, ChatGPT o Gemini — se recomienda Claude), pega el contenido copiado en el chat y envíalo.
- El asistente analizará los archivos, corregirá errores y generará un archivo ZIP descargable. Descárgalo y extráelo en la carpeta donde quieras trabajar.
- Verifica que el proyecto arranca sin errores.

**Entregable:** El proyecto compila/arranca sin errores.

<details>
<summary>Pistas de conocimiento</summary>

- Copia el Código Base completo incluyendo el texto de instrucciones al inicio — esas instrucciones le indican al asistente exactamente qué hacer con los archivos.
- Si el asistente no genera el ZIP automáticamente al terminar el análisis, escríbele: "genera el ZIP ahora".
- Si el proyecto tiene errores al arrancar, comparte el mensaje de error con el mismo asistente para que lo corrija.

</details>

### Fase 1: Creación de productos

**Objetivo:** Implementar la funcionalidad para crear productos con validaciones básicas.

**Tiempo estimado:** 2 horas

**Instrucciones:**

- El sistema debe permitir la creación de productos con los atributos nombre, precio, stock y categoría.
- Los productos no pueden tener precios negativos ni nombres duplicados.
- El sistema debe proporcionar retroalimentación al usuario en caso de errores de validación.

**Entregable:** Sistema que permite la creación de productos con validaciones básicas.

<details>
<summary>Pistas de conocimiento</summary>

- Considera cómo estructurar los datos para evitar duplicidades y manejar errores de validación.
- Piensa en cómo proporcionar retroalimentación efectiva al usuario.

</details>

### Fase 2: Lectura de productos

**Objetivo:** Implementar la funcionalidad para leer productos.

**Tiempo estimado:** 2 horas

**Instrucciones:**

- El sistema debe permitir a los usuarios ver la lista de productos creados.
- La lista debe mostrar los atributos de cada producto.

**Entregable:** Sistema que permite la lectura de productos.

<details>
<summary>Pistas de conocimiento</summary>

- Considera cómo presentar la información de manera clara y concisa.
- Piensa en cómo manejar la visualización de productos en caso de que no haya ninguno creado.

</details>

### Fase 3: Actualización de productos

**Objetivo:** Implementar la funcionalidad para actualizar productos.

**Tiempo estimado:** 2 horas

**Instrucciones:**

- El sistema debe permitir a los usuarios actualizar los atributos de los productos.
- Las mismas validaciones de creación deben aplicarse a la actualización.

**Entregable:** Sistema que permite la actualización de productos con validaciones.

<details>
<summary>Pistas de conocimiento</summary>

- Considera cómo mantener la consistencia de los datos durante la actualización.
- Piensa en cómo proporcionar retroalimentación al usuario en caso de errores de validación.

</details>

### Fase 4: Eliminación de productos

**Objetivo:** Implementar la funcionalidad para eliminar productos.

**Tiempo estimado:** 2 horas

**Instrucciones:**

- El sistema debe permitir a los usuarios eliminar productos.
- Considera cómo manejar la eliminación de productos relacionados con otros datos.

**Entregable:** Sistema que permite la eliminación de productos.

<details>
<summary>Pistas de conocimiento</summary>

- Considera cómo manejar la eliminación de productos relacionados con otros datos.
- Piensa en cómo proporcionar confirmación al usuario antes de eliminar un producto.

</details>

## Dimensiones Evaluadas

- **queEs**: ¿Qué es un producto en el contexto de este sistema?
- **paraQueSirve**: ¿Para qué sirve la funcionalidad de creación de productos en este sistema?
- **comoSeUsa**: ¿Cómo se usa la funcionalidad de lectura de productos en este sistema?
- **erroresComunes**: ¿Cuáles son los errores comunes que pueden ocurrir al crear o actualizar productos en este sistema?
- **queDecisionesImplica**: ¿Qué decisiones debes tomar al implementar la funcionalidad de eliminación de productos en este sistema?

## Criterios de Evaluacion

- Implementación correcta de la funcionalidad de creación de productos con validaciones.
- Implementación correcta de la funcionalidad de lectura de productos.
- Implementación correcta de la funcionalidad de actualización de productos con validaciones.
- Implementación correcta de la funcionalidad de eliminación de productos.

---

*Reto generado automaticamente por Challenge Generator - Pragma*
