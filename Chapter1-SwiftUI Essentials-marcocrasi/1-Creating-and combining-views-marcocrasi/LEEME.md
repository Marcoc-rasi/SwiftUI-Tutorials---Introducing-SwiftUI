# `Unidad 1.1 Creación y combinación de vistas Introducción`

He seguido un tutorial que me ha guiado a través de la construcción de Landmarks, una aplicación para descubrir y compartir los lugares que amo. He empezado construyendo la vista que muestra los detalles de un lugar emblemático.
Para diseñar las vistas, he utilizado `stacks` para combinar y superponer los componentes de vista de `imagen` y `texto`. Para agregar un mapa a la vista, he incluido un componente `MapKit` estándar. A medida que he perfeccionado el diseño de la vista, `Xcode` ha proporcionado retroalimentación en tiempo real para que pudiera ver cómo esos cambios se traducen en código.


## `Sección 1 Crear un nuevo proyecto y explorar el lienzo`

He creado un nuevo proyecto de Xcode que utiliza SwiftUI. He explorado el lienzo, las vistas previas y el código de plantilla de SwiftUI.

### `Resumen de los pasos de la sección`

`Pasos`:
1. `Inicio del Proyecto`:
   - Abrí Xcode y elegí `Crear Nuevo Proyecto` o seleccioné Archivo > Nuevo > Proyecto.
2. `Configuración Básica`:
   - En el selector de plantillas, elegí iOS como plataforma, seleccioné la plantilla de aplicación y continué.
3. `Detalles del Proyecto`:
   - Nombré el proyecto `Paisajes` y seleccioné `SwiftUI` para la interfaz y `Swift` para el lenguaje.
4. `Estructura de la Aplicación`:
   - En el navegador del proyecto, seleccioné PaisajesApp y organicé la aplicación según el protocolo App, estableciendo el punto de entrada.
5. `Definición de la Vista`:
   - Seleccioné ContentView en el navegador del proyecto y ajusté la vista predeterminada utilizando el protocolo View.
6. `Vista Previa Automática`:
   - Visualicé automáticamente una vista previa en el lienzo.
7. `Personalización del Contenido`:
   - Dentro de la propiedad `body` en ContentView, personalicé el saludo eliminando el texto predeterminado.



## `Sección 2 Personalizar la vista de texto`

Personalicé la visualización de una vista cambiando mi código, o utilicé el inspector para descubrir lo que está disponible y para ayudarme a escribir código. Mientras construía la aplicación Landmarks, pude utilizar cualquier combinación de editores: el editor de código fuente, el lienzo o los inspectores. Mi código se mantuvo actualizado, independientemente de la herramienta que utilicé.

### `Resumen de los pasos de la sección`

`Pasos`:
1. `Modo de Lienzo`:
   - Cambié el modo de lienzo a "Selectable". Por defecto, el lienzo muestra vistas en el modo Live para interactuar, pero el modo Selectable habilita la edición.
2. `Inspector de SwiftUI`:
   - En la vista previa, hice clic en Comando-Control sobre el saludo para abrir el popover de edición estructurada y elegí "Mostrar Inspector SwiftUI".
   - El popover muestra atributos que se pueden personalizar según el tipo de vista que estás inspeccionando.
3. `Cambio de Texto`:
   - Utilicé el inspector para cambiar el texto a "Turtle Rock", el nombre del primer punto de referencia que se mostrará en la aplicación.
4. `Modificador de Fuente`:
   - Cambié el modificador de fuente a "Title". Esto aplica la fuente del sistema al texto para que responda correctamente a los tamaños y configuraciones de fuente preferidos por el usuario.
   - En SwiftUI, personalizas vistas mediante métodos llamados modificadores. Estos envuelven una vista para cambiar su apariencia u otras propiedades.
5. `Modificación de Color`:
   - Edité el código manualmente para agregar el modificador `foregroundColor(.green)`, esto cambia el color del texto a verde.
   - Tu código es siempre la fuente de verdad para la vista. Cuando usas el inspector para cambiar o quitar un modificador, Xcode actualiza tu código de inmediato.
6. `Restauración del Color`:
   - Abrí el inspector al hacer Control-clic en la declaración de `Text` en el editor de código y elegí "Mostrar Inspector SwiftUI". Cambié el color del texto a negro seleccionando "Heredado" desde el menú emergente de color.
7. `Actualización Automática`:
   - Noté que Xcode actualiza automáticamente el código para reflejar el cambio, eliminando el modificador `foregroundColor(.green)`.
8. `Volver al Modo en Vivo`:
   - Configuré la vista previa de nuevo en modo Live. Trabajar en Live facilita el seguimiento del comportamiento de la vista mientras haces ediciones en el código fuente.


## `Sección 3 Combinar vistas usando stacks`

Más allá de la vista del título que creé en la sección anterior, he agregado vistas de texto para contener detalles sobre el lugar emblemático, como el nombre del parque y el estado en el que se encuentra. Al crear una vista de SwiftUI, describí su contenido, diseño y comportamiento en la propiedad `body` de la vista; sin embargo, la propiedad `body` solo devuelve una vista única. He combinado e incrustado múltiples vistas en stacks, que agrupan vistas juntas horizontalmente, verticalmente o de atrás hacia adelante. En esta sección, he utilizado un stack vertical para colocar el título encima de un stack horizontal que contiene detalles sobre el parque.

### `Resumen de los pasos de la sección`

`Pasos`:
1. `Embeber en VStack`:
   - Hice clic con Control en el inicializador de la vista de texto para mostrar un menú contextual y elegí "Incrustar en VStack".
   - Luego, agregué una vista de texto a la pila arrastrando un TextView desde la biblioteca.
2. `Abrir la Biblioteca y Agregar Texto`:
   - Abrí la biblioteca haciendo clic en el botón más (+) en la parte superior derecha de la ventana de Xcode.
   - Arrastré una vista de texto al lugar en el código inmediatamente debajo de la vista de texto "Turtle Rock".
3. `Personalización del Texto`:
   - Reemplacé el texto de marcador de posición de la vista de texto con "Joshua Tree National Park".
   - Personalicé la ubicación para que coincida con el diseño deseado.
4. `Configuración de la Fuente`:
   - Establecí la fuente de la ubicación a subencabezado.
5. `Alineación de la Stack`:
   - Edité el inicializador de VStack para alinear las vistas por sus bordes de inicio.
   - Por defecto, las pilas centran su contenido a lo largo de su eje y proporcionan un espaciado apropiado para el contexto.
6. `Embeber en HStack`:
   - Incrusté la vista de texto "Joshua Tree National Park" en un HStack.
7. `Agregar un Nuevo Texto`:
   - Añadí una nueva vista de texto después de la ubicación, cambié el texto de marcador por el estado del parque y establecí su fuente a subencabezado.
8. `Separación con Spacer`:
   - Para utilizar todo el ancho del dispositivo, agregué un Spacer al stack horizontal que contiene las dos vistas de texto.
   - Un spacer se expande para que su vista contenedora utilice todo el espacio de su vista principal, en lugar de tener su tamaño definido solo por su contenido.
9. `Agregar Margen con padding()`:
   - Finalmente, utilicé el modificador `padding()` para darle al nombre y los detalles del punto de referencia un poco más de espacio alrededor de sus bordes exteriores.


## `Sección 4 Crear una vista de imagen personalizada`

Con las vistas de nombre y ubicación ya configuradas, el siguiente paso es agregar una imagen para el lugar emblemático. En lugar de agregar más código en este archivo, crearé una vista personalizada que aplique una máscara, un borde y una sombra a la imagen.

### `Resumen de los pasos de la sección`

**Comienza por agregar una imagen al catálogo de activos del proyecto.**

`Pasos`:
1. `Agregar Imagen al Catálogo de Recursos`:
   - Comencé añadiendo una imagen al catálogo de recursos del proyecto.
   - Encontré `turtlerock@2x.jpg` en la carpeta de recursos de archivos del proyecto y la arrastré al editor del catálogo de activos. Xcode creó un nuevo conjunto de imágenes para la imagen.
2. `Crear una Nueva Vista de SwiftUI`:
   - Elegí Archivo > Nuevo > Archivo para abrir el selector de plantillas nuevamente.
   - En la sección Interfaz de Usuario, seleccioné "SwiftUI View" y hice clic en Siguiente. Nombré el archivo `CircleImage.swift` y hice clic en Crear.
3. `Sustituir el Texto con la Imagen`:
   - Reemplacé la vista de texto con la imagen de Turtle Rock usando el inicializador `Image(_:)`, pasándole el nombre de la imagen a mostrar.
4. `Aplicar una Forma de Recorte Circular`:
   - Añadí una llamada a `clipShape(Circle())` para aplicar una forma de recorte circular a la imagen.
   - El tipo `Circle` es una forma que se puede usar como máscara o como vista dándole un trazo o relleno.
5. `Crear un Círculo con Trazo Gris`:
   - Creé otro círculo con un trazo gris y lo añadí como superposición para darle a la imagen un borde.
6. `Agregar una Sombra`:
   - Luego, añadí una sombra con un radio de 7 puntos.
7. `Cambiar el Color del Borde a Blanco`:
   - Cambié el color del borde a blanco.
8. `Finalizar la Vista de Imagen`:
   - Con estos pasos, se completa la configuración de la vista de imagen.


## `Sección 5 Utilizar vistas de SwiftUI de otros marcos`

A continuación, crearé un mapa que se centre en unas coordenadas dadas. Puedo utilizar la vista Mapa de MapKit para renderizar el mapa.

### `Resumen de los pasos de la sección`

**Para empezar, crearé una nueva vista personalizada para gestionar mi mapa.**

`Pasos`:
1. `Crear una Nueva Vista de SwiftUI para el Mapa`:
   - Elegí Archivo > Nuevo > Archivo, seleccioné iOS como la plataforma, elegí la plantilla "SwiftUI View" y hice clic en Siguiente. Nombré el nuevo archivo `MapView.swift` y hice clic en Crear.
2. `Importar MapKit`:
   - Añadí una declaración de importación para MapKit.
   - Al importar SwiftUI y ciertos otros marcos en el mismo archivo, se obtiene acceso a la funcionalidad específica de SwiftUI proporcionada por ese marco.
3. `Crear una Variable Computada Privada para la Región del Mapa`:
   - Creé una variable computada privada que contiene la información de la región para el mapa.
4. `Reemplazar la Vista de Texto con una Vista de Mapa`:
   - Sustituí la vista de texto predeterminada con una vista de mapa que toma una posición de cámara que inicializo con la región.
5. `Visualizar el Mapa en la Vista Previa`:
   - En la vista previa, verifiqué que el mapa estaba centrado en Turtle Rock.
   - Pude manipular el mapa en la vista previa en vivo para hacer zoom y ver el área circundante utilizando la combinación de clic opcional y arrastre del control.


## `Sección 6 Componer la vista detallada`

Ahora tengo todos los componentes que necesito: el nombre y la ubicación, una imagen circular y un mapa para la ubicación. Con las herramientas que he utilizado hasta ahora, combinaré mis vistas personalizadas para crear el diseño final de la vista detallada del lugar emblemático.

### `Resumen de los pasos de la sección`

`Pasos`:
1. `Seleccionar el Archivo ContentView`:
   - En el navegador de proyectos, seleccioné el archivo `ContentView`.
2. `Incrustar el VStack Principal en Otro VStack`:
   - Incrusté el VStack que contiene las tres vistas de texto en otro VStack.
3. `Agregar tu Vista de Mapa Personalizada`:
   - Añadí mi vista personalizada `MapView` en la parte superior del stack.
   - Establecí el tamaño de `MapView` con `frame(width:height:)`.
   - Al especificar solo el parámetro de altura, la vista se dimensiona automáticamente al ancho de su contenido. En este caso, `MapView` se expande para llenar el espacio disponible.
4. `Agregar la Vista de Imagen Circular`:
   - Añadí la vista de imagen circular (`CircleImage`) al stack.
5. `Superponer la Imagen sobre el Mapa`:
   - Para colocar la vista de imagen encima de la vista de mapa, le di a la imagen un desplazamiento de -130 puntos verticalmente y un relleno de -130 puntos desde la parte inferior de la vista.
   - Estos ajustes hacen espacio para el texto moviendo la imagen hacia arriba.
6. `Agregar un Spacer al Final del VStack Exterior`:
   - Añadí un spacer al final del VStack externo para empujar el contenido hacia la parte superior de la pantalla.
7. `Agregar un Separador y Texto Descriptivo Adicional`:
   - Añadí un separador y texto descriptivo adicional para el lugar.
8. `Mover el Modificador de Fuente Subencabezado`:
   - Finalmente, moví el modificador de fuente subencabezado desde cada vista de texto a la HStack que las contiene, y apliqué el estilo secundario al texto subencabezado.
   - Cuando aplicas un modificador a una vista de diseño como una pila, SwiftUI aplica el modificador a todos los elementos contenidos en el grupo.



