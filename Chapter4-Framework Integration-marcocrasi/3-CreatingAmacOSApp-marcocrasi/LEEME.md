# `Unidad 4.3 - Creación de una aplicación para macOS - Introducción`

Después de crear una versión de la aplicación Landmarks para watchOS, es hora de fijarse en algo más grande: llevar Landmarks a Mac. Construiré sobre todo lo que he aprendido hasta ahora, para completar la experiencia de construir una aplicación SwiftUI para iOS, watchOS y macOS. Comenzaré agregando un objetivo de macOS a mi proyecto y luego reutilizaré vistas y datos que creé anteriormente. Con una base establecida, agregaré algunas vistas nuevas diseñadas para macOS y modificaré otras para que funcionen mejor en todas las plataformas.

## `Sección 1 - Agregar un ob¬¬¬jetivo de macOS al proyecto`

Comenzaré agregando un objetivo de macOS al proyecto. Xcode añadirá un nuevo grupo y un conjunto de archivos de inicio para la aplicación de macOS, junto con el esquema necesario para compilar y ejecutar la aplicación. Luego agregaré algunos archivos existentes al nuevo objetivo.

### `Resumen de los pasos de la sección:`

`Pasos:`

1. `Agregar un Nuevo Objetivo (Target):`
   - Elegí `File > New > Target`. Cuando apareció la hoja de plantillas, seleccioné la pestaña macOS, elegí la plantilla `App` y hice clic en `Next`. Esta plantilla agrega un nuevo objetivo de aplicación macOS al proyecto.

2. `Configurar Nuevo Objetivo:`
   - En la hoja, ingresé `MacLandmarks` como el `Product Name`. Establecí la interfaz en SwiftUI, el lenguaje en Swift y luego hice clic en `Finish`.

3. `Configurar Esquema:`
   - Establecí el esquema en `MacLandmarks > My Mac`. Al establecer el esquema en `My Mac`, pude obtener una vista previa, compilar y ejecutar la aplicación macOS. A medida que avanzo en el tutorial, utilizaré otros esquemas para observar cómo responden los otros objetivos a los cambios en los archivos compartidos.

4. `Seleccionar ContentView:`
   - En el grupo `MacLandmarks`, seleccioné `ContentView` y abrí el `Canvas` para ver la vista previa. SwiftUI proporciona tanto una vista principal predeterminada como su vista previa, al igual que en una aplicación iOS, lo que permite obtener una vista previa de la ventana principal de la aplicación.

5. `Eliminar Archivo MacLandmarksApp:`
   - En el grupo `MacLandmarks`, eliminé el archivo `MacLandmarksApp`. Cuando se me preguntó, elegí `Move to Trash`. Al igual que con la aplicación watchOS, no necesito la estructura de la aplicación predeterminada porque reutilizaré la que ya tengo.

6. `Compartir Archivos con el Objetivo macOS:`
   - En el navegador de proyectos, hice clic con Comando para seleccionar los siguientes archivos: `LandmarksApp`, `LandmarkList`, `LandmarkRow`, `CircleImage`, `MapView` y `FavoriteButton`. El primero es la definición compartida de la aplicación. Los demás son vistas que funcionarán en macOS.

7. `Continuar Seleccionando Carpetas y Archivos:`
   - Continué haciendo clic con Comando para seleccionar todos los elementos en las carpetas `Model` y `Resources`, así como `Asset`. Estos elementos definen el modelo de datos y los recursos de la aplicación.

8. `Configurar Membresía del Objetivo:`
   - En el inspector de archivos, añadí `MacLandmarks` a la `Target Membership` para los archivos seleccionados. También agregué un conjunto de iconos de aplicación macOS para que coincida con los de otros objetivos.

9. `Eliminar Elemento Vacío de Icono de la Aplicación:`
   - Seleccioné el archivo `Assets` en el grupo `MacLandmarks` y eliminé el elemento vacío `AppIcon`. Lo reemplazaré en el siguiente paso.

10. `Agregar Conjunto de Iconos de la Aplicación:`
    - Arrastré la carpeta `AppIcon.appiconset` desde la carpeta de `Resources` del proyecto descargado al catálogo de activos de `MacLandmarks`.

11. `Actualizar ContentView:`
    - En `ContentView` en el grupo `MacLandmarks`, añadí `LandmarkList` como la vista de nivel superior, con restricciones en el tamaño del marco. La vista previa ya no se compila porque `LandmarkList` usa `LandmarkDetail`, pero aún no he definido una vista de detalle para la aplicación macOS. Me ocuparé de eso en la siguiente sección.


## `Sección 2 - Crear una vista detallada para macOS`

La vista detallada muestra información sobre el lugar emblemático seleccionado. Creé una vista así para la aplicación de iOS, pero las plataformas diferentes requieren enfoques diferentes para la presentación de datos. A veces puedes reutilizar una vista en varias plataformas con pequeños ajustes o compilación condicional, pero la vista detallada difiere lo suficiente para macOS que es mejor crear una vista dedicada. Copiaré la vista detallada de iOS como punto de partida y luego la modificaré para que se adapte a la pantalla más grande de macOS.

### `Resumen de los pasos de la sección:`

`Pasos:`

1. `Crear una Nueva Vista Personalizada:`
   - Creé una nueva vista personalizada en el grupo `MacLandmarks` dirigida a macOS llamada `LandmarkDetail`. Ahora tienes tres archivos llamados `LandmarkDetail`. Cada uno cumple el mismo propósito en la jerarquía de vistas, pero proporciona una experiencia adaptada a una plataforma específica.

2. `Copiar Contenidos de la Vista de Detalle de iOS:`
   - Copié los contenidos de la vista de detalle de iOS a la vista de detalle de macOS. La vista previa falla porque el método `navigationBarTitleDisplayMode(_:)` no está disponible en macOS.

3. `Eliminar el Modificador navigationBarTitleDisplayMode(_:) y Agregar un Modificador de Marco:`
   - Eliminé el modificador `navigationBarTitleDisplayMode(_:)` y añadí un modificador de marco a la vista previa para ver más contenido. Los cambios que realizarás en los siguientes pasos mejorarán el diseño para la pantalla más grande de una Mac.

4. `Cambiar HStack a VStack y Eliminar Spacer:`
   - Cambié el `HStack` que contiene el parque y el estado a un `VStack` con alineación a la izquierda y eliminé el `Spacer`.

5. `Encerrar Todo Debajo de MapView en un VStack y Colocar CircleImage y el Resto del Encabezado en un HStack:`
   - Encerré todo debajo de `MapView` en un `VStack` y luego coloqué `CircleImage` y el resto del encabezado en un `HStack`.

6. `Eliminar el Desplazamiento del Círculo y Aplicar un Desplazamiento más Pequeño a Todo el VStack:`
   - Eliminé el desplazamiento del círculo y, en su lugar, apliqué un desplazamiento más pequeño a todo el `VStack`.

7. `Agregar un Modificador resizable() a la Imagen y Restringir el Tamaño de CircleImage:`
   - Añadí un modificador `resizable()` a la imagen y restrinjí el tamaño de `CircleImage` para que sea un poco más pequeño.

8. `Restringir el ScrollView a un Ancho Máximo:`
   - Restringí el `ScrollView` a un ancho máximo. Esto mejora la legibilidad cuando el usuario hace la ventana muy ancha.

9. `Cambiar el FavoriteButton para Usar el Estilo de Botón Plain:`
   - Cambié el `FavoriteButton` para usar el estilo de botón plain. Usar el estilo plain aquí hace que el botón se parezca más al equivalente de iOS.

10. `Agregar un Botón "Abrir en Mapas" en un ZStack para que Aparezca en la Esquina Superior Derecha del Mapa:`
    - Añadí un botón "Abrir en Mapas" en un `ZStack` para que aparezca en la esquina superior derecha del mapa. Asegúrate de incluir MapKit para poder crear el `MKMapItem` que enviarás a Maps.


## `Sección 3 - Actualizar la vista de fila`

La vista compartida `LandmarkRow` funciona en macOS, pero vale la pena revisarla para buscar mejoras dadas el nuevo entorno visual. Dado que esta vista se utiliza en las tres plataformas, debes tener cuidado de que cualquier cambio que hagas funcione en todas ellas.

### `Resumen de los pasos de la sección:`

Antes de modificar la fila, configuré una vista previa de la lista, porque los cambios que haré están impulsados por cómo se ve la fila en contexto.

`Pasos:`

1. `Abrir LandmarkList y Agregar un Ancho Mínimo:`
   - Abrí `LandmarkList` y añadí un ancho mínimo. Esto mejora la vista previa, pero también asegura que la lista nunca sea demasiado pequeña cuando el usuario redimensiona la ventana de macOS.

2. `Fijar la Vista Previa de la Lista:`
   - Fijé la vista previa de la lista para poder ver cómo se ve la fila en contexto mientras realizas cambios.

3. `Abrir LandmarkRow y Agregar un Radio de Esquina a la Imagen:`
   - Abrí `LandmarkRow` y añadí un radio de esquina a la imagen para darle un aspecto más refinado.

4. `Envolver el Nombre del Lugar en un VStack y Agregar el Parque como Información Secundaria:`
   - Envolví el nombre del lugar en un `VStack` y añadí el parque como información secundaria.

5. `Agregar Relleno Vertical alrededor del Contenido de la Fila:`
   - Añadí relleno vertical alrededor del contenido de la fila para darle a cada fila un poco más de espacio. Las actualizaciones mejoran la apariencia en macOS, pero también necesitas considerar las otras plataformas que utilizan la lista. Primero, considera watchOS.

6. `Seleccionar el Objetivo WatchLandmarks para Ver una Vista Previa de watchOS de la Lista:`
   - Elegí el objetivo `WatchLandmarks` para ver una vista previa de watchOS de la lista. El ancho mínimo de la fila no es apropiado aquí. Debido a este y otros cambios que harás en la próxima sección, la mejor solución es crear una lista específica para watchOS que omita la restricción de ancho.

7. `Agregar una Nueva Vista SwiftUI a la Carpeta WatchLandmarks Watch App Llamada LandmarkList.swift que Se Dirige Solo a WatchLandmarks Watch App, y Quitar la Membresía del Objetivo Antiguo:`
   - Añadí una nueva vista SwiftUI a la carpeta `WatchLandmarks Watch App` llamada `LandmarkList.swift` que se dirige solo a `WatchLandmarks Watch App` y quité la membresía del objetivo antiguo.

8. `Copiar el Contenido del Antiguo LandmarkList en el Nuevo, pero Sin el Modificador de Marco:`
   - Copié el contenido del antiguo `LandmarkList` en el nuevo, pero sin el modificador de marco. El contenido ahora tiene el ancho correcto, pero cada fila tiene demasiada información.

9. `Volver a LandmarkRow y Agregar una Condición #if para Evitar que Aparezca el Texto Secundario en una Compilación de watchOS:`
   - Volví a `LandmarkRow` y añadí una condición `#if` para evitar que aparezca el texto secundario en una compilación de watchOS. Para la fila, el uso de compilación condicional es apropiado porque las diferencias son pequeñas.

10. `Seleccionar el Objetivo Landmarks para Ver Cómo se Ve la Lista en iOS:`
    - Elegí el objetivo `Landmarks` para ver cómo se ve la lista en iOS. Los cambios funcionan bien para iOS, así que no es necesario hacer ninguna actualización para esa plataforma.


## `Sección 4 - Actualizar la vista de lista`

Al igual que `LandmarkRow`, `LandmarkList` ya funciona en macOS, pero podría necesitar mejoras. Por ejemplo, moveré el interruptor para mostrar solo favoritos a un menú en la barra de herramientas, donde puede estar acompañado por controles adicionales de filtrado.
Los cambios que haré funcionarán tanto para macOS como para iOS, pero serán difíciles de adaptar en watchOS. Afortunadamente, en la sección anterior ya dividí la lista en un archivo separado para watchOS.

### `Resumen de los pasos de la sección:`

`Pasos:`

1. `Regresar al Esquema MacLandmarks y Agregar un ToolbarItem con un Menu Dentro de un Nuevo Modificador de Barra de Herramientas en el Archivo LandmarkList que se Dirige a iOS y macOS:`
   - Regresé al esquema `MacLandmarks` y en el archivo `LandmarkList` que se dirige a iOS y macOS, añadí un `ToolbarItem` que contiene un `Menu` dentro de un nuevo modificador de barra de herramientas.

2. `Mover el Toggle de Favoritos al Menú:`
   - Moví el interruptor de favoritos al menú. Esto traslada el interruptor a la barra de herramientas de una manera específica de la plataforma, lo que tiene el beneficio adicional de hacerlo accesible sin importar cuán larga sea la lista de monumentos o cuánto se desplace el usuario hacia abajo.

3. `Agregar una Enumeración FilterCategory para Describir los Estados de Filtrado:`
   - Añadí una enumeración `FilterCategory` para describir los estados de filtrado. Hice coincidir las cadenas de casos con la enumeración `Category` en la estructura `Landmark` para poder compararlas, e incluí un caso `all` para desactivar el filtrado.

4. `Agregar una Variable de Estado de Filtrado, con un Valor Predeterminado de all:`
   - Añadí una variable de estado de filtrado, con un valor predeterminado de `all`. Al almacenar el estado de filtrado en la vista de lista, el usuario puede abrir múltiples ventanas de vista de lista, cada una con su propia configuración de filtro, para poder ver los datos de diferentes maneras.

5. `Actualizar filteredLandmarks para Tener en Cuenta la Nueva Configuración de Filtros, Combinada con la Categoría de un Lugar Determinado:`
   - Actualicé `filteredLandmarks` para tener en cuenta la nueva configuración de filtros, combinada con la categoría de un lugar determinado.

6. `Agregar un Selector al Menú para Configurar la Categoría de Filtro:`
   - Añadí un selector al menú para configurar la categoría de filtro. Dado que el filtro tiene solo algunos elementos, utilicé el estilo de selector en línea para hacer que todos aparezcan juntos.

7. `Actualizar el Título de Navegación para Coincidir con el Estado del Filtro:`
   - Actualicé el título de navegación para que coincida con el estado del filtro. Este cambio será útil en la aplicación iOS.

8. `Ejecutar el Objetivo macOS y Ver Cómo Opera el Menú:`
   - Ejecuté el objetivo macOS y vi cómo opera el menú.

9. `Elegir el Objetivo Landmarks y Asegurarse de que Estás en la Vista Previa en Vivo para Ver que el Nuevo Filtrado Funciona Bien para iOS También:`
   - Elegí el objetivo `Landmarks` y me aseguré de estar en la vista previa en vivo para ver que el nuevo filtrado funciona bien para iOS también.



## `Sección 5 - Agregar un comando de menú integrado`

Cuando creas una aplicación utilizando el ciclo de vida de SwiftUI, el sistema automáticamente crea un menú con elementos comúnmente necesarios, como aquellos para cerrar la ventana más adelante o para salir de la aplicación. SwiftUI te permite agregar otros comandos comunes con comportamiento incorporado, así como comandos completamente personalizados.
En esta sección, agregaré un comando proporcionado por el sistema que permite al usuario alternar la barra lateral, para poder recuperarla después de cerrarla arrastrándola.

### `Resumen de los pasos de la sección:`

`Pasos:`

1. `Regresar al Objetivo MacLandmarks, Ejecutar la Aplicación macOS y Arrastrar el Separador entre la Vista de Lista y Detalles Todo el Camino a la Izquierda:`
   - Regresé al objetivo `MacLandmarks`, ejecuté la aplicación macOS y arrastré el separador entre la vista de lista y detalles todo el camino a la izquierda. Cuando solté el botón del mouse, la lista desapareció. Puedes hacer clic en el botón de la barra de herramientas para recuperarla, pero también puedes introducir un comando de menú para controlar esto.

2. `Agregar un Nuevo Archivo Swift Llamado LandmarkCommands.swift y Configurar sus Objetivos para Incluir tanto macOS como iOS:`
   - Añadí un nuevo archivo Swift llamado `LandmarkCommands.swift` y configuré sus objetivos para incluir tanto macOS como iOS. También apunté a iOS porque la lista de lugares compartida dependerá eventualmente de algunos de los tipos que defina en este archivo.

3. `Importar SwiftUI y Agregar una Estructura LandmarkCommands que Conforma al Protocolo Commands, con una Propiedad de Cuerpo Calculada:`
   - Importé SwiftUI y agregué una estructura `LandmarkCommands` que conforma al protocolo `Commands`, con una propiedad de cuerpo calculada. Al igual que una estructura de vista, una estructura de comandos requiere una propiedad de cuerpo calculada que utiliza la semántica de un constructor, excepto con comandos en lugar de vistas.

4. `Agregar un Comando SidebarCommands al Cuerpo:`
   - Añadí un comando `SidebarCommands` al cuerpo. Este conjunto de comandos integrado incluye el comando para alternar la barra lateral. Para hacer uso de los comandos en una aplicación, debes aplicarlos a una escena, lo cual haré a continuación.

5. `Abrir el Archivo LandmarksApp y Aplicar LandmarkCommands Usando el Modificador de Escena commands(content:):`
   - Abrí el archivo `LandmarksApp` y apliqué `LandmarkCommands` usando el modificador de escena `commands(content:)`. Los modificadores de escena funcionan como los modificadores de vista, excepto que los aplicas a escenas en lugar de vistas.

6. `Ejecutar Nuevamente la Aplicación macOS y Ver que Puedes Usar el Comando de Menú Ver > Mostrar Barra Lateral para Restaurar la Vista de Lista:`
   - Ejecuté nuevamente la aplicación macOS y vi que podía usar el comando de menú `Ver > Mostrar Barra Lateral` para restaurar la vista de lista. Desafortunadamente, la aplicación watchOS no se compila porque `Commands` no tiene disponibilidad para watchOS. Arreglaré eso a continuación.

7. `Agregar una Condición alrededor del Modificador de Comandos para Omitirlo para la Aplicación watchOS:`
   - Añadí una condición alrededor del modificador de comandos para omitirlo para la aplicación watchOS. La aplicación watchOS se compila nuevamente.



## `Sección 6 - Añadí un comando de menú personalizado`

En la sección anterior, añadí un conjunto de comandos de menú integrados. En esta sección, añadí un comando personalizado para alternar el estado de favorito del punto de referencia que estaba seleccionado en ese momento. Utilicé un enlace enfocado para saber cuál punto de referencia estaba seleccionado.

### `Resumen de los pasos de la sección:`

`Pasos:`

1. `En LandmarkCommands, Extender la Estructura FocusedValues con un Valor selectedLandmark, Usando una Clave Personalizada Llamada SelectedLandmarkKey:`
   - Extendí la estructura `FocusedValues` con un valor `selectedLandmark`, utilizando una clave personalizada llamada `SelectedLandmarkKey`. El patrón para definir valores enfocados se asemeja al patrón para definir nuevos valores de entorno: utiliza una clave privada para leer y escribir una propiedad personalizada en la estructura de `FocusedValues` definida por el sistema.

2. `Agregar un Envoltorio de Propiedad @FocusedBinding para Rastrear el Landmark Actualmente Seleccionado:`
   - Añadí un envoltorio de propiedad `@FocusedBinding` para rastrear el landmark actualmente seleccionado. Estoy leyendo el valor aquí. Lo establecerás más adelante en la vista de lista, donde el usuario realiza la selección.

3. `Agregar un Nuevo CommandMenu a tus Comandos Llamado Landmarks:`
   - Añadí un nuevo `CommandMenu` a tus comandos llamado `Landmarks`. Definirás el contenido del menú a continuación.

4. `Agregar un Botón al Menú que Cambia el Estado de Favorito del Landmark Seleccionado y que Tiene una Apariencia que Cambia Según el Landmark Actualmente Seleccionado y su Estado:`
   - Añadí un botón al menú que cambia el estado de favorito del landmark seleccionado y que tiene una apariencia que cambia según el landmark actualmente seleccionado y su estado.

5. `Agregar un Atajo de Teclado para el Elemento del Menú con el Modificador keyboardShortcut(_:modifiers:):`
   - Añadí un atajo de teclado para el elemento del menú con el modificador `keyboardShortcut(_:modifiers:)`. SwiftUI muestra automáticamente el atajo de teclado en el menú. El menú ahora contiene tu nuevo comando, pero necesitas establecer el enlace enfocado `selectedLandmark` para que funcione.

6. `En LandmarkList, Agregar una Variable de Estado para el Landmark Seleccionado y una Propiedad Calculada que Indica el Índice del Landmark Seleccionado:`
   - Añadí una variable de estado para el landmark seleccionado y una propiedad calculada que indica el índice del landmark seleccionado.

7. `Inicializar la Lista con un Enlace al Valor Seleccionado y Agregar una Etiqueta al Enlace de Navegación:`
   - Inicialicé la lista con un enlace al valor seleccionado y añadí una etiqueta al enlace de navegación. La etiqueta asocia un landmark particular con el ítem dado en el `ForEach`, lo que luego impulsa la selección.

8. `Agregar el Modificador focusedValue(::) al NavigationSplitView, Proporcionando un Enlace al Valor desde el Array de Landmarks:`
   - Añadí el modificador `focusedValue(_:_:)` a `NavigationSplitView`, proporcionando un enlace al valor desde el array de landmarks. Realizo una búsqueda aquí para asegurarme de que estoy modificando el landmark almacenado en el modelo y no una copia.

9. `Ejecutar la Aplicación macOS y Probar el Nuevo Elemento del Menú:`
   - Ejecuté la aplicación macOS y probé el nuevo elemento del menú.


## `Sección 7 - Añadí preferencias con una escena de ajustes`

Los usuarios esperaban poder ajustar configuraciones para una aplicación de macOS utilizando el elemento de menú de Configuración estándar. Añadí preferencias a MacLandmarks mediante la adición de una escena de Configuración. Las vistas de la escena definen el contenido de la ventana de preferencias, que utilicé para controlar el nivel de zoom inicial de MapView. Comunicaba el valor a la vista de mapa y lo almacenaba de forma persistente utilizando el envoltorio de propiedad `@AppStorage`.

### `Resumen de los pasos de la sección:`

Empecé por añadir un control en MapView que establecía el zoom inicial en uno de tres niveles: cercano, medio o lejano.

`Pasos:`

1. `En MapView, Agregar una Enumeración Zoom para Caracterizar el Nivel de Zoom:`
   - Agregué una enumeración `Zoom` para caracterizar el nivel de zoom en MapView.

2. `Agregar una Propiedad @AppStorage Llamada zoom que Toma el Nivel de Zoom Medio por Defecto:`
   - Añadí una propiedad `@AppStorage` llamada `zoom` que toma el nivel de zoom medio por defecto. Usé una clave de almacenamiento que identifica de manera única el parámetro, como lo harías al almacenar elementos en `UserDefaults`, porque ese es el mecanismo subyacente en el que SwiftUI se basa.

3. `Cambiar la Longitud y Latitud Delta Utilizadas para Construir la Propiedad Region a un Valor que Depende de zoom:`
   - Cambié la longitud y latitud delta utilizadas para construir la propiedad `region` a un valor que depende de `zoom`. A continuación, crearás una escena de Configuración que controle el valor de zoom almacenado.

4. `Crear una Nueva Vista SwiftUI Llamada LandmarkSettings que Solo se Orienta a la Aplicación macOS:`
   - Creé una nueva vista SwiftUI llamada `LandmarkSettings` que solo se orienta a la aplicación macOS.

5. `Agregar una Propiedad @AppStorage que Utiliza la Misma Clave que Usaste en la Vista de Mapa:`
   - Añadí una propiedad `@AppStorage` que utiliza la misma clave que usaste en la vista de mapa.

6. `Agregar un Selector que Controle el Valor de Zoom a Través de un Enlace:`
   - Añadí un Selector que controla el valor de zoom a través de un enlace. Normalmente, se utiliza un formulario para organizar controles en la vista de configuración.

7. `En LandmarksApp, Agregar la Escena de Configuración a tu Aplicación, pero Solo para macOS:`
   - Añadí la escena de configuración a la aplicación en `LandmarksApp`, pero solo para macOS.

8. `Ejecutar la Aplicación y Probar Cambiando la Configuración:`
   - Ejecuté la aplicación y probé cambiar la configuración. Observa que el mapa se actualiza cada vez que cambias el nivel de zoom.


# Aplicaciónes de unidad finales

`MacOS`

https://github.com/Marcoc-rasi/SwiftUI-Tutorials---Introducing-SwiftUI/assets/51039101/2a95673e-9f5f-4e98-bcff-64c0a60ef439

`WatchOS`

https://github.com/Marcoc-rasi/SwiftUI-Tutorials---Introducing-SwiftUI/assets/51039101/ae010d5e-dee3-47fe-b522-0f20508b754b

`iOS`

https://github.com/Marcoc-rasi/SwiftUI-Tutorials---Introducing-SwiftUI/assets/51039101/2e0bad98-2b36-4505-9db8-d9c361379253
