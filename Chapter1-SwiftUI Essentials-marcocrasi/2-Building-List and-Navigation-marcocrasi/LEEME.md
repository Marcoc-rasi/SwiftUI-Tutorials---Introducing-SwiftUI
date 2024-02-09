# `Unidad 1.2 Construyendo listas y navegación - Introducción`

Con la vista detallada básica del lugar emblemático configurada, necesito proporcionar una manera para que los usuarios vean la lista completa de lugares emblemáticos y para ver los detalles sobre cada ubicación. Crearé vistas que puedan mostrar información sobre cualquier lugar emblemático y generarán dinámicamente una lista desplazable que un usuario puede tocar para ver una vista detallada de un lugar emblemático. Para ajustar la interfaz de usuario, utilizaré Xcode para representar vistas previas en diferentes tamaños de dispositivo.

## `Sección 1 Crear un modelo de lugar emblemático`

En el primer tutorial, codificaste información en todas tus vistas personalizadas. Aquí, crearás un modelo para almacenar datos que puedas pasar a tus vistas.

### `Resumen de los pasos de la sección`

`Pasos`:
1. `Agregar Datos de Muestra`:
   - Arrastré `landmarkData.json` a la carpeta `Resources` de archivos descargados a la barra de navegación del proyecto.
   - En el cuadro de diálogo que aparece, seleccioné "Copiar elementos si es necesario" y el destino `Landmarks`, y luego hice clic en Finalizar.
   - Utilizaré estos datos de muestra a lo largo de este tutorial y en los siguientes.
2. `Crear un Nuevo Archivo Swift para la Estructura Landmark`:
   - Elegí Archivo > Nuevo > Archivo para crear un nuevo archivo Swift en el proyecto, y lo llamé `Landmark.swift`.
3. `Definir una Estructura Landmark con Propiedades`:
   - Definí una estructura `Landmark` con algunas propiedades que coinciden con nombres de algunas claves en el archivo de datos `landmarkData`.
   - Añadí la conformidad `Codable` para facilitar el movimiento de datos entre la estructura y un archivo de datos.
4. `Agregar Imágenes al Catálogo de Recursos`:
   - Arrastré los archivos JPG desde la carpeta `Resources` de archivos del proyecto al catálogo de activos.
   - Xcode creó un nuevo conjunto de imágenes para cada imagen, uniéndose a la de Turtle Rock que añadiste en el tutorial anterior.
5. `Agregar Propiedades de Imagen a la Estructura Landmark`:
   - Añadí una propiedad `imageName` para leer el nombre de la imagen desde los datos y una propiedad de imagen calculada que carga una imagen desde el catálogo de activos.
6. `Gestionar Información sobre la Ubicación del Punto de Referencia`:
   - Añadí una propiedad `coordinates` a la estructura utilizando un tipo `Coordinates` anidado que refleja el almacenamiento en la estructura de datos JSON.
   - Marqué esta propiedad como privada porque solo la usarás para crear una propiedad computada pública en el siguiente paso.
7. `Calcular la Propiedad de Coordenadas de Ubicación`:
   - Calculé una propiedad `locationCoordinate` que es útil para interactuar con el framework MapKit.
8. `Crear un Archivo para la Lógica de Datos del Modelo`:
   - Creé un nuevo archivo Swift en el proyecto llamado `ModelData.swift`.
9. `Crear un Método 'load(_:)' para Obtener Datos JSON`:
   - Creé un método `load(_:)` que obtiene datos JSON con un nombre dado desde el paquete principal de la aplicación.
   - Este método se basa en la conformidad del tipo de retorno con el protocolo `Decodable`, que es un componente del protocolo `Codable`.
10. `Crear un Array de Puntos de Referencia Inicializado desde 'landmarkData.json'`:
    - Creé un array de puntos de referencia inicializado desde `landmarkData.json`.
11. `Organizar el Proyecto`:
    - Agrupé archivos relacionados para facilitar la gestión del proyecto.
    - Coloqué `ContentView`, `CircleImage` y `MapView` en un grupo llamado `Views`, `landmarkData` en un grupo llamado `Resources` y `Landmark` y `ModelData` en un grupo llamado `Model`.


## `Sección 2 Crear la vista de fila`

La primera vista que construiré en este tutorial es una fila para mostrar detalles sobre cada lugar emblemático. Esta vista de fila almacena información en una propiedad para el lugar emblemático que muestra, de modo que una vista pueda mostrar cualquier lugar emblemático. Más tarde, combinaré varias filas en una lista de lugares emblemáticos.

### `Resumen de los pasos de la sección`

`Pasos`:
1. `Crear una Nueva Vista SwiftUI`:
   - Creé una nueva vista SwiftUI en el grupo `Views` llamada `LandmarkRow.swift`.
2. `Agregar 'landmark' como una Propiedad Almacenada`:
   - Añadí `landmark` como una propiedad almacenada de `LandmarkRow`.
   - Al agregar la propiedad `landmark`, la vista previa en el lienzo deja de funcionar porque el tipo `LandmarkRow` necesita una instancia de `landmark` durante la inicialización.
   - Para solucionar la vista previa, es necesario modificar la instanciación de la vista en la vista previa.
3. `Modificar la Vista Previa`:
   - Dentro de la macro de vista previa, añadí el parámetro `landmark` al inicializador de `LandmarkRow`, especificando el primer elemento del array de `landmarks`.
   - La vista previa ahora muestra el texto "¡Hola, mundo!".
   - Con eso solucionado, pude construir el diseño para la fila.
4. `Incrustar la Vista de Texto Existente en un HStack`:
   - Incrusté la vista de texto existente en un HStack.
5. `Modificar la Vista de Texto para Usar el Nombre del Punto de Referencia`:
   - Modifiqué la vista de texto para utilizar el nombre de la propiedad `landmark`.
6. `Completar la Fila`:
   - Completé la fila añadiendo una imagen antes de la vista de texto y un spacer después de ella.


## `Sección 3 Personalizar la vista previa de la fila`

Xcode reconoce automáticamente cualquier vista previa que declares con una macro de vista previa en el archivo fuente de una vista. El lienzo muestra solo una vista previa a la vez, pero puedes definir múltiples vistas previas y elegir entre ellas en el lienzo. Alternativamente, puedes agrupar vistas juntas para crear una única vista previa de más de una versión de una vista.

### `Resumen de los pasos de la sección`

`Pasos`:
1. `Agregar una Segunda Previsualización`:
   - Añadí una segunda macro de vista previa que utiliza el segundo elemento en el array de `landmarks`.
   - Agregar previsualizaciones te permite ver cómo se comportan tus vistas con diferentes datos.
2. `Usar Controles en el Lienzo para Seleccionar la Segunda Previsualización`:
   - Utilicé los controles en el lienzo para elegir la segunda vista previa.
   - Por defecto, el lienzo etiqueta las previsualizaciones utilizando el número de línea en el que aparecen.
   - La macro de vista previa toma un parámetro de nombre opcional que puedes utilizar para etiquetar una previsualización.
3. `Dar un Nombre a Cada Previsualización`:
   - Di un nombre a cada previsualización para ayudar a distinguirlas.
4. `Navegar entre las Dos Previsualizaciones con las Nuevas Etiquetas`:
   - Navegué entre las dos previsualizaciones con las nuevas etiquetas. Probé cambiar la previsualización seleccionada nuevamente.
   - Cuando deseas previsualizar diferentes versiones de una vista lado a lado, puedes agruparlas en una sola vista de colección.
5. `Eliminar la Segunda Previsualización y Envolver las Dos Versiones en un Grupo`:
   - Eliminé la segunda previsualización y, en su lugar, envolví las dos versiones de la fila en un `Group`.
   - `Group` es un contenedor para agrupar el contenido de la vista. Xcode representa las vistas secundarias del grupo apiladas como una única previsualización en el lienzo.
   - El código que escribas en la vista previa solo cambia lo que Xcode muestra en el lienzo.



## `Sección 4 Crear la lista de lugares emblemáticos`

Cuando utilizo el tipo de Lista de SwiftUI, puedo mostrar una lista de vistas específica de la plataforma. Los elementos de la lista pueden ser estáticos, como las vistas secundarias de las pilas que he creado hasta ahora, o generados dinámicamente. Incluso puedo mezclar vistas estáticas y generadas dinámicamente.

### `Resumen de los pasos de la sección`

`Pasos`:
1. `Crear una Nueva Vista SwiftUI`:
   - Creé una nueva vista SwiftUI en el grupo `Views` llamada `LandmarkList.swift`.
2. `Reemplazar la Vista de Texto Predeterminada con una Lista`:
   - Reemplacé la vista de texto predeterminada con una Lista y proporcioné instancias de `LandmarkRow` con los dos primeros puntos de referencia como hijos de la lista.
   - La vista previa muestra los dos puntos de referencia renderizados en un estilo de lista apropiado para iOS.



## `Sección 5 Hacer la lista dinámica`

En lugar de especificar los elementos de una lista individualmente, puedo generar filas directamente desde una colección. Puedo crear una lista que muestre los elementos de una colección pasando mi colección de datos y un cierre que proporcione una vista para cada elemento en la colección. La lista transforma cada elemento en la colección en una vista secundaria utilizando el cierre suministrado.

### `Resumen de los pasos de la sección`

`Pasos`:
1. `Eliminar las Dos Filas Estáticas de Puntos de Referencia`:
   - Eliminé las dos filas estáticas de puntos de referencia y, en su lugar, pasé el array de puntos de referencia de los datos del modelo al inicializador de la Lista.
   - Las Listas trabajan con datos identificables. Puedes hacer que tus datos sean identificables de dos maneras: pasando junto con tus datos un camino de clave a una propiedad que identifica de manera única cada elemento, o haciendo que tu tipo de datos cumpla con el protocolo Identifiable.
2. `Completar la Lista Generada Dinámicamente`:
   - Completé la lista generada dinámicamente devolviendo un `LandmarkRow` desde el cierre.
   - Esto crea un `LandmarkRow` para cada elemento en el array de puntos de referencia.
   - A continuación, simplificaré el código de la Lista agregando la conformidad a Identifiable al tipo `Landmark`.
3. `Agregar Conformidad a Identifiable en Landmark.swift`:
   - Cambié a `Landmark.swift` y declaré la conformidad al protocolo Identifiable.
   - Los datos de `Landmark` ya tienen la propiedad `id` requerida por el protocolo Identifiable; solo necesitas agregar una propiedad para decodificarla al leer los datos.
4. `Eliminar el Parámetro id en LandmarkList.swift`:
   - Volví a `LandmarkList.swift` y eliminé el parámetro `id`.
   - A partir de ahora, podrás usar colecciones de elementos de `Landmark` directamente.


## `Sección 6 Configurando la navegación entre la lista y el detalle`

La lista se renderizó correctamente, pero en ese momento no podía tocar un lugar emblemático individual para ver la página de detalles de ese lugar emblemático. Añadí capacidades de navegación a la lista al incrustarla en una `NavigationSplitView`, y luego anidé cada fila en un `NavigationLink` para configurar una transición a una vista de destino.

### `Resumen de los pasos de la sección`

Preparé una vista de detalle utilizando el contenido que había creado en el tutorial anterior y actualicé la vista de contenido principal para mostrar la vista de lista en su lugar.

`Pasos`:
1. `Crear una Nueva Vista SwiftUI`:
   - Creé una nueva vista SwiftUI llamada `LandmarkDetail.swift`.
2. `Copiar el Contenido de ContentView a LandmarkDetail`:
   - Copié el contenido de la propiedad `body` desde `ContentView` a `LandmarkDetail`.
3. `Cambiar ContentView para Mostrar LandmarkList`:
   - Cambié `ContentView` para mostrar `LandmarkList`.
   - En los próximos pasos, agregaré la navegación entre la lista y las vistas de detalle.
4. `Incrustar la Lista Dinámica de Puntos de Referencia en un NavigationSplitView`:
   - Incrusté la lista dinámicamente generada de puntos de referencia en un `NavigationSplitView`.
   - El navigation split view toma una segunda entrada que es un marcador de posición para la vista que aparece después de que alguien hace una selección. En el iPhone, el split view no necesita el marcador de posición, pero en el iPad, el panel de detalles puede estar presente antes de que alguien haga una selección, como verás más adelante en este tutorial.
5. `Agregar el Modificador 'navigationTitle(_:)'`:
   - Añadí el modificador `navigationTitle(_:)` para establecer el título de la barra de navegación al mostrar la lista.
6. `Envolver la Fila Devuelta en un NavigationLink`:
   - Dentro del cierre de la lista, envolví la fila devuelta en un `NavigationLink`, especificando `LandmarkDetail` como la vista de destino.
7. `Probar la Navegación Directamente en la Vista Previa`:
   - Probé la navegación directamente en la vista previa. Toqué un punto de referencia para visitar la página de detalles.


## `Sección 7 Pasar datos a las vistas secundarias`

La vista `LandmarkDetail` todavía utiliza detalles codificados para mostrar su lugar emblemático. Al igual que `LandmarkRow`, el tipo `LandmarkDetail` y las vistas que lo componen necesitan usar una propiedad de lugar emblemático como fuente para sus datos. Comenzando con las vistas secundarias, convertiré `CircleImage`, `MapView` y luego `LandmarkDetail` para mostrar datos que se pasan, en lugar de codificar cada fila.

### `Resumen de los pasos de la sección`

`Pasos`:
1. `Agregar Propiedad de Imagen en CircleImage`:
   - En el archivo `CircleImage`, añadí una propiedad de imagen almacenada a la estructura `CircleImage`.
2. `Actualizar la Vista Previa para Pasar la Imagen de Turtle Rock`:
   - Actualicé la vista previa para pasar la imagen de Turtle Rock.
3. `Agregar Propiedad de Coordenadas en MapView`:
   - En el archivo `MapView`, añadí una propiedad de coordenadas a la estructura `MapView` y actualicé la vista previa para pasar una coordenada fija.
4. `Pasar las Coordenadas al Parámetro de Centro en la Variable de Región`:
   - Pasé las coordenadas al parámetro de centro en la variable de región.
5. `Cambiar el Inicializador del Mapa para Aceptar una Entrada de Posición`:
   - Cambié el inicializador del mapa para aceptar una entrada de posición de manera que se actualice cuando el valor cambie.
6. `Agregar una Propiedad de Punto de Referencia en LandmarkDetail`:
   - En `LandmarkDetail`, añadí una propiedad de `Landmark` al tipo `LandmarkDetail`.
7. `Pasar el Punto de Referencia Actual a LandmarkDetail en LandmarkList`:
   - En `LandmarkList`, pasé el punto de referencia actual al punto de referencia de destino, `LandmarkDetail`.
8. `En LandmarkDetail, Pasar los Datos Necesarios a tus Tipos Personalizados`:
   - Con todas las conexiones establecidas, la vista previa vuelve a funcionar.
9. `Cambiar el Contenedor de VStack a ScrollView en LandmarkDetail`:
   - Cambié el contenedor de `VStack` a `ScrollView` para que el usuario pueda desplazarse por el contenido descriptivo, y eliminé `Spacer`, que ya no es necesario.
10. `Finalmente, Llamar a los Modificadores 'navigationTitle(:)' y 'navigationBarTitleDisplayMode(:)'`:
    - Llamé al modificador `navigationTitle(:)` para darle un título a la barra de navegación al mostrar la vista de detalles, y el modificador `navigationBarTitleDisplayMode(:)` para que el título aparezca en línea.
    - Los cambios de navegación solo tienen efecto cuando la vista es parte de una pila de navegación.
11. `Volver a la Vista Previa de LandmarkList y Verificar que Muestra los Puntos de Referencia Correctos al Navegar desde la Lista`:
    - Volví a la vista previa de `LandmarkList` y verifiqué que muestra los puntos de referencia correctos al navegar desde la lista.


## `Sección 8 Generar vistas previas dinámicamente`

A continuación, representaré vistas previas de la vista de lista para diferentes configuraciones de dispositivos. Por defecto, las vistas previas se representan en el tamaño del dispositivo en el esquema activo. Puedo representar vistas previas para diferentes dispositivos cambiando el objetivo, o anulando el dispositivo en el lienzo. También puedo explorar otras variaciones de vista previa, como la orientación del dispositivo.

### `Resumen de los pasos de la sección`

`Pasos`:
1. `Cambiar el Selector de Dispositivo para Previsualización en iPad`:
   - Cambié el selector de dispositivo para que la vista previa muestre un iPad.
   - En la orientación vertical, el `NavigationSplitView` muestra el panel de detalles por defecto y proporciona un botón en la barra de herramientas para revelar la barra lateral.
2. `Tocar el Botón de la Barra de Herramientas para Revelar la Barra Lateral`:
   - Toqué el botón de la barra de herramientas para revelar la barra lateral y probé la navegación a uno de los puntos de referencia.
   - La vista de detalles cambia al punto de referencia seleccionado bajo la barra lateral. La barra lateral permanece visible hasta que tocas en algún lugar de la vista de detalles.
3. `Habilitar la Orientación Horizontal Izquierda en Configuración de Dispositivo`:
   - En el lienzo, seleccioné Configuración de Dispositivo y habilité la orientación horizontal izquierda.
   - En la orientación horizontal, el `NavigationSplitView` muestra la barra lateral y los paneles de detalles uno al lado del otro.
4. `Experimentar con Diferentes Dispositivos y Configuraciones`:
   - Experimenté con diferentes dispositivos y configuraciones en la Configuración de Dispositivo para ver cómo se ven mis vistas bajo otras condiciones.


# Aplicación de unidad final

https://github.com/Marcoc-rasi/SwiftUI-Tutorials---Introducing-SwiftUI/assets/51039101/f284f6c0-26a8-49bc-a533-7abf4158dce0
