# `Unidad 1.3 Manejo de la entrada del usuario - Introducción`

En la aplicación Landmarks, un usuario puede marcar sus lugares favoritos y filtrar la lista para mostrar solo sus favoritos. Para crear esta función, empezaré por agregar un interruptor a la lista para que los usuarios puedan centrarse solo en sus favoritos, y luego agregaré un botón con forma de estrella que un usuario tocará para marcar un lugar emblemático como favorito.

## `Sección 1 Marcar lugares emblemáticos favoritos`

Comienza mejorando la lista para mostrar a las personas sus favoritos de un vistazo. Agrega una propiedad a la estructura Landmark para leer el estado inicial de un lugar emblemático como favorito, y luego agrega una estrella a cada LandmarkRow que muestre un lugar emblemático favorito.

### `Resumen de los pasos de la sección`

`Pasos`:
1. `Abrir el Proyecto en Xcode`:
   - Abrí el proyecto de Xcode desde el punto de inicio o el proyecto que terminaste en el tutorial anterior, y seleccioné Landmark en el Navegador de Proyectos.
2. `Agregar la Propiedad isFavorite en la Estructura Landmark`:
   - Añadí una propiedad isFavorite a la estructura Landmark.
   - El archivo `landmarkData` tiene una clave con este nombre para cada punto de referencia. Debido a que Landmark cumple con Codable, puedes leer el valor asociado con la clave creando una nueva propiedad con el mismo nombre que la clave.
3. `Seleccionar LandmarkRow en el Navegador de Proyectos`:
   - Seleccioné LandmarkRow en el Navegador de Proyectos.
4. `Agregar una Imagen de Estrella Dentro de una Declaración if`:
   - Después del espaciador, añadí una imagen de estrella dentro de una declaración if para comprobar si el punto de referencia actual es un favorito.
   - En bloques SwiftUI, se utilizan declaraciones if para incluir vistas condicionalmente.
5. `Modificar el Color de las Imágenes del Sistema con foregroundStyle(_:)`:
   - Dado que las imágenes del sistema son vectoriales, puedes cambiar su color con el modificador foregroundStyle(_:).
   - La estrella está presente siempre que la propiedad isFavorite de un punto de referencia es verdadera. Verás cómo modificar esa propiedad más adelante en este tutorial.


## `Sección 2 Filtrar la vista de lista`

Personalicé la vista de lista para que mostrara todos los lugares emblemáticos o solo mis favoritos. Para lograr esto, tuve que agregar un poco de estado al tipo LandmarkList. El estado era un valor o un conjunto de valores que podían cambiar con el tiempo y que afectaban al comportamiento, contenido o diseño de una vista. Utilicé una propiedad con el atributo @State para agregar estado a una vista.

### `Resumen de los pasos de la sección`

`Pasos`:
1. `Seleccionar LandmarkList en el Navegador de Proyectos`:
   - Seleccioné LandmarkList en el Navegador de Proyectos.
2. `Agregar una Propiedad @State llamada showFavoritesOnly`:
   - Añadí una propiedad @State llamada showFavoritesOnly con su valor inicial establecido en false.
   - Debido a que se utilizan propiedades de estado (@State) para contener información específica de una vista y sus subvistas, siempre creo estados como privados.
3. `Actualizar Automáticamente la Vista al Realizar Cambios`:
   - Cuando realizas cambios en la estructura de tu vista, como agregar o modificar una propiedad, la vista previa se actualiza automáticamente.
   - **Consejo:** Si la vista previa no está visible, selecciona Editor > Vista previa para mostrarla.
4. `Calcular una Versión Filtrada de la Lista de Puntos de Referencia`:
   - Calculé una versión filtrada de la lista de puntos de referencia verificando la propiedad showFavoritesOnly y el valor isFavorite de cada punto de referencia.
5. `Usar la Versión Filtrada en la Lista de Puntos de Referencia`:
   - Utilicé la versión filtrada de la lista de puntos de referencia en el componente List.
6. `Cambiar el Valor Inicial de showFavoritesOnly a true`:
   - Cambié el valor inicial de showFavoritesOnly a true para ver cómo reacciona la lista.


## `Sección 3 Agregar un control para alternar el estado`

Para darle al usuario control sobre el filtro de la lista, tuve que agregar un control que pudiera cambiar el valor de mostrarSoloFavoritos. Hice esto pasando un enlace a un control de alternancia. Un enlace actúa como una referencia a un estado mutable. Cuando un usuario toca el interruptor de apagado a encendido y luego a apagado nuevamente, el control utiliza el enlace para actualizar el estado de la vista en consecuencia.

### `Resumen de los pasos de la sección

`Pasos`:
1. `Crear un Grupo Anidado ForEach para Transformar los Puntos de Referencia en Filas`:
   - Creé un grupo anidado ForEach para transformar los puntos de referencia en filas.
   - Para combinar vistas estáticas y dinámicas en una lista, o para combinar dos o más grupos diferentes de vistas dinámicas, usa el tipo ForEach en lugar de pasar tu colección de datos a List.
2. `Agregar una Vista de Alternancia (Toggle) como el Primer Hijo de la Vista de Lista (List)`:
   - Añadí una vista de alternancia (Toggle) como el primer hijo de la vista de lista (List), pasando un enlace a showFavoritesOnly.
   - Se utiliza el prefijo $ para acceder a un enlace a una variable de estado, o a una de sus propiedades.
3. `Mejorar la Animación del Filtrado Agregando el Modificador animation(_:)`:
   - Mejoré la animación de filtrado agregando el modificador animation(_:) que comienza cuando cambia el valor de filteredLandmarks.
4. `Antes de Continuar, Restaurar el Valor Predeterminado de showFavoritesOnly a false`:
   - Antes de seguir adelante, volví al valor predeterminado de showFavoritesOnly a false.
5. `Usar la Vista Previa en Vivo y Probar la Nueva Funcionalidad Tocando el Interruptor`:
   - Utilicé la vista previa en vivo y probé esta nueva funcionalidad tocando el interruptor.


## `Sección 4 Utilizar observación para el almacenamiento`

Para prepararme para que el usuario controle qué lugares emblemáticos particulares son favoritos, primero almacené los datos del lugar emblemático usando el macro Observable(). Con la observación, una vista en SwiftUI puede admitir cambios de datos sin usar envolturas de propiedades o enlaces. SwiftUI observa cualquier cambio en las propiedades observables que podrían afectar a una vista y muestra la versión correcta de la vista después de un cambio.

### `Resumen de los pasos de la sección`

`Pasos`:
1. `Seleccionar ModelData en el Panel de Navegación del Proyecto`:
   - Seleccioné ModelData en el panel de navegación del proyecto.
2. `Declarar un Nuevo Tipo de Modelo Utilizando la Macro Observable()`:
   - Declaré un nuevo tipo de modelo utilizando la macro Observable().
   - SwiftUI actualiza una vista solo cuando una propiedad observable cambia y el cuerpo de la vista lee la propiedad directamente.
3. `Mover la Matriz de Puntos de Referencia al Modelo`:
   - Moví la matriz de puntos de referencia al modelo.
   - `Consejo:` Puedes utilizar Command + Option + { o } para mover las líneas de código seleccionadas hacia arriba o hacia abajo, respectivamente.


## `Sección 5 Adoptar el objeto del modelo en tus vistas`

Ahora que he creado el objeto ModelData, necesito actualizar mis vistas para adoptarlo como el almacén de datos para mi aplicación.

### `Resumen de los pasos de la sección`

`Pasos`:
1. `En LandmarkList, Agregar el Marcador de Propiedad @Environment y el Modificador environment(_:) en la Vista Previa`:
   - En LandmarkList, añadí el marcador de propiedad @Environment a la vista y el modificador environment(_:) en la vista previa.
   - La propiedad modelData obtiene su valor automáticamente, siempre y cuando el modificador environment(_:) se haya aplicado a un padre. El marcador de propiedad @Environment te permite leer los datos del modelo de la vista actual. Agregar el modificador environment(_:) pasa el objeto de datos a través del entorno.
2. `Utilizar modelData.landmarks como Datos al Filtrar Puntos de Referencia`:
   - Utilicé modelData.landmarks como datos al filtrar puntos de referencia.
3. `Actualizar la Vista de Detalles (LandmarkDetail) para Trabajar con el Objeto ModelData en el Entorno`:
   - Actualicé la vista de detalles (LandmarkDetail) para trabajar con el objeto ModelData en el entorno.
4. `Actualizar la Vista Previa de LandmarkRow para Trabajar con el Objeto ModelData`:
   - Actualicé la vista previa de LandmarkRow para trabajar con el objeto ModelData.
5. `Actualizar la Vista Previa de ContentView para Agregar el Objeto Model al Entorno`:
   - Actualicé la vista previa de ContentView para agregar el objeto Model al entorno, lo que hace que el objeto esté disponible para cualquier subvista.
   - Una vista previa falla si alguna subvista requiere un objeto de modelo en el entorno, pero la vista que estás previsualizando no tiene el modificador environment(_:).
6. `Actualizar LandmarksApp para Crear una Instancia del Modelo y Suministrarla a ContentView Utilizando el Modificador environment(_:)`:
   - Actualicé LandmarksApp para crear una instancia del modelo y suministrarla a ContentView utilizando el modificador environment(_:).
   - Utilicé el atributo @State para inicializar un objeto de modelo de la misma manera que se usa para inicializar propiedades dentro de una vista. Al igual que SwiftUI inicializa el estado en una vista solo una vez durante la vida útil de la vista, inicializa el estado en una aplicación solo una vez durante la vida útil de la aplicación.
7. `Regresar a LandmarkList para Verificar que Todo Funciona Correctamente`:
   - Regresé a LandmarkList para verificar que todo funciona correctamente.

## `Sección 6 Crear un botón de favoritos para cada lugar emblemático`

Ahora la aplicación Landmarks puede cambiar entre una vista filtrada y no filtrada de los lugares emblemáticos, pero la lista de lugares emblemáticos favoritos aún está codificada. Para permitir que el usuario agregue y elimine favoritos, necesito agregar un botón de favoritos a la vista de detalle del lugar emblemático.

### `Resumen de los pasos de la sección`

`Pasos`:
1. `Crear una Nueva Vista Llamada FavoriteButton.swift:`
   - Creé una nueva vista llamada `FavoriteButton.swift`.
2. `Agregar un Enlace (binding) isSet que Indica el Estado Actual del Botón:`
   - Añadí un enlace (binding) `isSet` que indica el estado actual del botón y proporcioné un valor constante para la vista previa.
   - El envoltorio de propiedad binding te permite leer y escribir entre una propiedad que almacena datos y una vista que muestra y cambia los datos. Debido al uso de un enlace (binding), los cambios realizados dentro de esta vista se propagan de nuevo a la fuente de datos.
3. `Crear un Botón con una Acción que Alterna el Estado y Cambia su Apariencia Basándose en el Estado:`
   - Creé un botón con una acción que alterna el estado de `isSet` y cambia su apariencia basándose en el estado.
   - La cadena de título que proporcionas para la etiqueta del botón no aparece en la interfaz de usuario cuando usas el estilo de etiqueta `iconOnly`, pero VoiceOver la utiliza para mejorar la accesibilidad.
4. `Agrupar los Archivos de Propósito General en un Grupo de Ayudantes (Helpers), y las Vistas de Puntos de Referencia en un Grupo de Puntos de Referencia (Landmarks):`
   - Recopilé los archivos generales de propósito, como CircleImage, MapView y FavoriteButton, en un grupo de Helpers, y las vistas de puntos de referencia en un grupo de Landmarks.
5. `Agregar el FavoriteButton a la Vista de Detalles, Enlazando la Propiedad isSet del Botón con la Propiedad isFavorite de un Punto de Referencia Específico:`
   - Cambié a LandmarkDetail y calculé el índice del punto de referencia de entrada comparándolo con los datos del modelo.
   - Para admitir esto, también necesitas acceso a los datos del modelo en el entorno.
6. `Dentro de la Propiedad body, Agregar los Datos del Modelo Usando un Envoltorio Bindable. Incrustar el Nombre del Punto de Referencia en un HStack con un Nuevo FavoriteButton; Proporcionar un Enlace a la Propiedad isFavorite con el Símbolo del Dólar ($):`
   - Dentro de la propiedad body, añadí los datos del modelo utilizando un envoltorio Bindable. Incrusté el nombre del punto de referencia en un HStack con un nuevo FavoriteButton; proporcioné un enlace a la propiedad `isFavorite` con el símbolo del dólar ($).
   - Utilicé `landmarkIndex` con el objeto `modelData` para asegurar que el botón actualice la propiedad `isFavorite` del punto de referencia almacenado en tu objeto de modelo.
7. `Volver a LandmarkList y Asegurarse de que la Vista Previa en Vivo Esté Activada:`
   - Volví a LandmarkList y me aseguré de que la vista previa en vivo estuviera activada.
   - A medida que navegas de la lista a los detalles y tocas el botón, esos cambios persisten cuando regresas a la lista. Debido a que ambas vistas acceden al mismo objeto de modelo en el entorno, las dos vistas mantienen la consistencia.
