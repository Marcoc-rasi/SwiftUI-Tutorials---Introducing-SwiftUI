# `Unidad 2.1 - Dibujar trazados y formas – Introducción`

Yo recibía una insignia cada vez que visitaba un lugar emblemático en mi lista. Por supuesto, para que yo recibiera una insignia, necesitaba crear una. Este tutorial me guió a través del proceso de creación de una insignia combinando trazados y formas, que luego superpuse con otra forma que representaba la ubicación. Si quería crear múltiples insignias para diferentes tipos de lugares emblemáticos, experimentaba con el símbolo superpuesto, variando la cantidad de repetición o cambiando los diferentes ángulos y escalas.

## `Sección 1 - Crear datos de dibujo para una vista de insignia`

Para crear la insignia, empecé definiendo datos que podía usar para dibujar una forma de hexágono para el fondo de la insignia.

### `Resumen de los pasos de la sección`

`Pasos`:

1. `Crear un Nuevo Archivo Swift:`
   - Con el grupo de vistas (Views) seleccionado en el panel de navegación, elige `File > New > File`, selecciona Swift File en la ventana de plantillas de iOS y haz clic en Next.
2. `Nombrar el Nuevo Archivo HexagonParameters.swift:`
   - Nombre el nuevo archivo `HexagonParameters.swift`.
3. `Crear una Estructura Llamada HexagonParameters:`
   - Dentro del nuevo archivo, creé una estructura llamada `HexagonParameters`.
4. `Definir una Estructura Segment para Sostener los Tres Puntos que Representan un Lado del Hexágono; Importar CoreGraphics para Usar CGPoint:`
   - Definí una estructura `Segment` para sostener los tres puntos que representan un lado del hexágono; importé CoreGraphics para poder usar `CGPoint`.
   - Cada lado comienza donde termina el anterior, se mueve en línea recta al primer punto y luego se desplaza sobre una curva Bézier en la esquina hasta el segundo punto. El tercer punto controla la forma de la curva.
5. `Crear un Array para Sostener los Segmentos:`
   - Creé un array para sostener los segmentos.
6. `Agregar Datos para los Seis Segmentos, Uno para Cada Lado del Hexágono:`
   - Añadí datos para los seis segmentos, uno para cada lado del hexágono.
   - Los valores se almacenan como una fracción de un cuadrado unitario con su origen en la esquina superior izquierda, con x positiva hacia la derecha e y positiva hacia abajo. Más tarde, usarás estas fracciones para encontrar los puntos reales de un hexágono con un tamaño dado.
7. `Agregar un Valor de Ajuste para Sintonizar la Forma del Hexágono:`
   - Añadí un valor de ajuste que te permite afinar la forma del hexágono.
    

## `Sección 2 - Dibujar el fondo de la insignia`

Utilicé las API gráficas en SwiftUI para dibujar una forma de insignia personalizada.

### `Resumen de los pasos de la sección`

`Pasos:`
1. `Crear un Nuevo Archivo Swift:`
   - Con el grupo de vistas (Views) seleccionado en el panel de navegación, elige `File > New > File`, selecciona SwiftUI View en la ventana de plantillas de iOS y haz clic en Next.
2. `Nombrar el Nuevo Archivo BadgeBackground.swift:`
   - Nombre el nuevo archivo `BadgeBackground.swift`.
3. `Agregar una Forma Path al Fondo de la Insignia y Aplicar el Modificador fill():`
   - En `BadgeBackground`, agregué una forma `Path` al fondo de la insignia y apliqué el modificador `fill()` para convertir la forma en una vista.
   - Se utilizan rutas (paths) para combinar líneas, curvas y otras primitivas de dibujo para formar formas más complejas, como el fondo hexagonal de la insignia.
4. `Agregar un Punto de Inicio a la Ruta:`
   - Añadí un punto de inicio a la ruta, asumiendo un contenedor con tamaño 100 x 100 px.
   - El método `move(to:)` mueve el cursor de dibujo dentro de los límites de una forma como si un lápiz imaginario estuviera suspendido sobre el área, esperando para comenzar a dibujar.
5. `Dibujar las Líneas para Cada Punto de los Datos de la Forma:`
   - Dibujé las líneas para cada punto de los datos de la forma para crear una forma hexagonal aproximada.
   - El método `addLine(to:)` toma un solo punto y lo dibuja. Llamadas sucesivas a `addLine(to:)` inician una línea en el punto anterior y continúan hacia el nuevo punto.
   - No te preocupes si tu hexágono parece un poco inusual; eso se debe a que estás ignorando la parte curva de cada segmento en las esquinas de la forma. Te ocuparás de eso a continuación.
6. `Usar el Método addQuadCurve(to:control:) para Dibujar las Curvas de Bézier:`
   - Usé el método `addQuadCurve(to:control:)` para dibujar las curvas de Bézier para las esquinas de la insignia.
7. `Envolver la Ruta en un GeometryReader:`
   - Envolví la ruta en un `GeometryReader` para que la insignia pueda utilizar el tamaño de su vista contenedora, que define el tamaño en lugar de codificar el valor (100).
   - Usar la dimensión más pequeña de la geometría preserva la relación de aspecto de la insignia cuando su vista contenedora no es cuadrada.
8. `Escalar la Forma en el Eje x y Añadir un Desplazamiento en x:`
   - Escalé la forma en el eje x usando `xScale` y luego añadí `xOffset` para centrar nuevamente la forma dentro de su geometría.
9. `Reemplazar el Fondo Negro Sólido con un Degradado:`
   - Reemplacé el fondo negro sólido con un degradado para que coincida con el diseño.
10. `Aplicar el Modificador aspectRatio(_:contentMode:) al Relleno de Degradado:`
    - Apliqué el modificador `aspectRatio(_:contentMode:)` al relleno de degradado.
    - Al preservar una relación de aspecto de 1:1, la insignia mantiene su posición en el centro de la vista, incluso si las vistas ancestrales no son cuadradas.



## `Sección 3 - Dibujar el símbolo de la insignia`

Para la insignia de Landmarks, incluí un emblema personalizado en su centro basado en la montaña que aparece en el icono de la aplicación Landmarks. El símbolo de la montaña consiste en dos formas: una que representa una capa de nieve en la cima y la otra que representa vegetación a lo largo del camino. Las dibujé utilizando dos formas parcialmente triangulares que están separadas por un pequeño espacio.

### `Resumen de los pasos de la sección`

`Pasos:`
1. `Navegar al Icono de la Aplicación Vacío:`
   - Ve al ícono vacío de la aplicación (AppIcon) en el catálogo de activos de tu proyecto y luego arrastra el único archivo PNG desde la carpeta de recursos descargada al conjunto de íconos de la aplicación vacío existente.
   - A continuación, construirás el símbolo de insignia coincidente.
2. `Crear una Nueva Vista Personalizada llamada BadgeSymbol:`
   - Crea una nueva vista personalizada llamada `BadgeSymbol` para la forma de montaña que se estampa en un patrón girado en el diseño de la insignia.
3. `Dibujar la Parte Superior del Símbolo Usando las API de Path:`
   - Dibuja la parte superior del símbolo utilizando las API de ruta.
   - Experimenta ajustando los multiplicadores numéricos asociados con las constantes de espaciado (spacing), ancho superior (topWidth), y altura superior (topHeight) para ver cómo influyen en la forma general.
4. `Dibujar la Parte Inferior del Símbolo:`
   - Dibuja la parte inferior del símbolo.
   - Usa el modificador `move(to:)` para insertar un espacio entre varias formas en la misma ruta.
5. `Rellenar el Símbolo con el Color Púrpura del Diseño:`
   - Rellena el símbolo con el color púrpura del diseño.
6. `Crear una Nueva Vista RotatedBadgeSymbol:`
   - Crea una nueva vista llamada `RotatedBadgeSymbol` para encapsular el concepto de un símbolo rotado.
   - Experimenta ajustando el ángulo en la vista previa para probar el efecto de la rotación.


## `Sección 4 - Combinar el frente y el fondo de la insignia`

El diseño de la insignia requiere que la forma de la montaña se rote y se repita varias veces encima del fondo de la insignia.
Definí un nuevo tipo para la rotación y aproveché la vista ForEach para aplicar los mismos ajustes a múltiples copias de la forma de la montaña.

### `Resumen de los pasos de la sección`

`Pasos:`
1. `Crear una Nueva Vista SwiftUI Llamada Badge:`
   - Inicié el proyecto creando una nueva vista SwiftUI llamada `Badge`.
2. `Incluir `BadgeBackground` en el Cuerpo de `Badge`:`
   - Coloqué `BadgeBackground` en el cuerpo de `Badge`.
3. `Superponer el Símbolo del Distintivo sobre el Fondo del Distintivo Usando un ZStack:`
   - Superpuse el símbolo del distintivo sobre el fondo del distintivo colocándolo en un `ZStack`.
   - En su estado actual, el símbolo del distintivo es demasiado grande en comparación con el diseño previsto y el tamaño relativo del fondo.
4. `Corregir el Tamaño del Símbolo del Distintivo Leyendo la Geometría Circundante y Escalando el Símbolo:`
   - Corregí el tamaño del símbolo del distintivo leyendo la geometría circundante y escalando el símbolo.
5. `Agregar una Vista ForEach para Rotar y Mostrar Copias del Símbolo del Distintivo:`
   - Añadí una vista `ForEach` para rotar y mostrar copias del símbolo del distintivo.
6. `Para Mantener Organizado el Proyecto, Antes de Pasar al Siguiente Tutorial, Agrupar Todos los Nuevos Archivos en un Grupo de Distintivos (Badges):`
   - Para mantener organizado el proyecto, agrupé todos los nuevos archivos que agregué en este tutorial en un grupo llamado Badges.


# Aplicación de unidad final

| ![Badge Mixed Photo](https://github.com/Marcoc-rasi/SwiftUI-Tutorials---Introducing-SwiftUI/assets/51039101/4c907e68-47c6-41de-927d-91c4b7dfd714) | ![Badge Background Photo](https://github.com/Marcoc-rasi/SwiftUI-Tutorials---Introducing-SwiftUI/assets/51039101/d56b7b3f-8c47-43e9-b13f-d60fb05d5de4) | ![Badge Symbol Photo](https://github.com/Marcoc-rasi/SwiftUI-Tutorials---Introducing-SwiftUI/assets/51039101/2bfe6d0b-eb58-4910-81ce-863bec0d10d0) |
