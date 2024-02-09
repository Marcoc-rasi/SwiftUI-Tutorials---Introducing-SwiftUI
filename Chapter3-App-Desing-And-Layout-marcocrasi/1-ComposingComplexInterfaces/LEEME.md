# `Unidad 3.1 - Componiendo interfaces complejas - Introducción`

La vista de categoría para Landmarks muestra una lista de desplazamiento vertical de lugares emblemáticos de desplazamiento horizontal. Mientras construyo esta vista y la conecto con mis vistas existentes, exploraré cómo las vistas compuestas pueden adaptarse a diferentes tamaños y orientaciones de dispositivo.

## `Sección 1 - Agregar una vista de categoría`

Puedo proporcionar una forma diferente de explorar los lugares emblemáticos creando una vista que clasifique los lugares emblemáticos por categoría, mientras destaco un lugar emblemático destacado en la parte superior de la vista.

### `Resumen de los pasos de la sección`

`Pasos:`
1. `Crear un Grupo de Categorías en el Grupo de Vistas del Proyecto y una Vista Personalizada llamada CategoryHome:`
   - Creé un grupo llamado "Categorías" en el grupo de vistas de tu proyecto.
   - Creé una vista personalizada llamada "CategoryHome" en el nuevo grupo.
2. `Agregar un NavigationSplitView para Alojar las Diferentes Categorías:`
   - Añadí un NavigationSplitView para albergar las diferentes categorías.
   - Se utilizan vistas de navegación dividida junto con instancias de NavigationLink y modificadores relacionados para construir estructuras de navegación jerárquicas en tu aplicación.
3. `Establecer el Título de la Barra de Navegación a "Destacados":`
   - Establecí el título de la barra de navegación a "Destacados".


## `Sección 2 - Creé una lista de categorías`

En la vista de categoría, mostré todas las categorías en filas separadas dispuestas en una columna vertical para facilitar la navegación. Logré esto combinando pilas verticales y horizontales, y agregando desplazamiento a la lista.

### `Resumen de los pasos de la sección`

Comencé leyendo los datos de categoría del archivo landmarkData.json.

`Pasos:`
1. `En Landmark, Agregar una Enumeración Category y una Propiedad category a la Estructura Landmark:`
   - Añadí una enumeración llamada "Category" y una propiedad llamada "category" a la estructura "Landmark".
   - El archivo landmarkData ya incluye un valor de categoría para cada punto de referencia con uno de tres valores de cadena. Al coincidir con los nombres en el archivo de datos, puedes confiar en la conformidad de Codable de la estructura para cargar los datos.
2. `En ModelData, Agregar un Diccionario de Categorías Calculado, con Nombres de Categorías como Claves y un Array de Puntos de Referencia Asociados para Cada Clave:`
   - Añadí un diccionario calculado llamado "categories" en ModelData.
   - Las claves del diccionario son nombres de categorías, y cada clave tiene un array de puntos de referencia asociados.
3. `En CategoryHome, Crear una Propiedad modelData:`
   - Creé una propiedad llamada "modelData" en CategoryHome.
   - Necesitarás acceso a las categorías ahora, así como a otros datos de puntos de referencia más adelante.
4. `Mostrar las Categorías en Landmarks Utilizando una Lista:`
   - Mostré las categorías en Landmarks usando un componente "List".
   - El nombre del caso "Landmark.Category" identifica cada elemento en la lista, y debe ser único entre otras categorías porque es una enumeración.


## `Sección 3 - Creé una fila de categoría`

En Landmarks, mostré cada categoría en una fila que se desplaza horizontalmente. Añadí un nuevo tipo de vista para representar la fila, luego mostré todos los lugares emblemáticos para esa categoría en la nueva vista. Reutilicé partes de la vista Landmark que creé en Creación y combinación de vistas para crear previsualizaciones familiares de un lugar emblemático.

### `Resumen de los pasos de la sección`

`Pasos:`
1. `Definir una Nueva Vista Personalizada llamada CategoryRow para Contener el Contenido de una Fila:`
   - Creé una nueva vista personalizada llamada "CategoryRow" para contener el contenido de una fila.
2. `Agregar Propiedades para el Nombre de la Categoría y la Lista de Elementos en esa Categoría:`
   - Añadí propiedades para el nombre de la categoría y la lista de elementos en esa categoría.
3. `Mostrar el Nombre de la Categoría:`
   - Mostré el nombre de la categoría en la vista.
4. `Colocar los Elementos de la Categoría en un HStack, y Agrupar eso con el Nombre de la Categoría en un VStack:`
   - Coloqué los elementos de la categoría en un HStack y agrupé eso con el nombre de la categoría en un VStack.
5. `Darle Espacio al Contenido Especificando un Marco Alto (frame) y Agregando Relleno (padding), Envuelto en un ScrollView:`
   - Dí espacio al contenido especificando un marco alto (frame) y agregando relleno (padding), y luego envolví el HStack en un ScrollView.
   - Actualicé la vista previa con una muestra más grande de datos para asegurarme de que el comportamiento de desplazamiento sea correcto.
6. `Crear una Nueva Vista Personalizada llamada CategoryItem que Muestra un Punto de Referencia:`
   - Creé una nueva vista personalizada llamada "CategoryItem" que muestra un punto de referencia.
7. `En CategoryRow, Reemplazar el Texto que Contiene el Nombre del Punto de Referencia con la Nueva Vista CategoryItem:`
   - En CategoryRow, reemplacé el texto que contiene el nombre del punto de referencia con la nueva vista "CategoryItem".



## `Sección 4 - Completé la vista de categoría`

Añadí las filas y la imagen destacada a la página de inicio de la categoría.

### `Resumen de los pasos de la sección`

`Pasos:`
1. `Actualizar el Cuerpo de CategoryHome para Pasar Información de la Categoría a las Instancias del Tipo de Fila:`
   - Actualicé el cuerpo de CategoryHome para pasar información de la categoría a las instancias del tipo de fila.
2. `En Landmark, Agregar una Nueva Propiedad isFeatured:`
   - En Landmark, agregué una nueva propiedad "isFeatured".
   - Al igual que otras propiedades de puntos de referencia que has agregado, este booleano ya existe en los datos; solo necesitas declarar una nueva propiedad.
3. `En ModelData, Agregar un Nuevo Array Calculado de Características que Contenga Solo los Puntos de Referencia Destacados:`
   - En ModelData, añadí un nuevo array calculado "features" que contiene solo los puntos de referencia que tienen "isFeatured" establecido como true.
4. `En CategoryHome, Agregar la Imagen del Primer Punto de Referencia Destacado en la Parte Superior de la Lista:`
   - En CategoryHome, añadí la imagen del primer punto de referencia destacado en la parte superior de la lista.
   - Más adelante, convertirás esta vista en un carrusel interactivo en un tutorial posterior. Por ahora, muestra uno de los puntos de referencia destacados con una imagen previa escalada y recortada.
5. `Establecer los Bordes a Cero en Ambos Tipos de Vistas Previa de Puntos de Referencia para que el Contenido Pueda Extenderse a los Bordes de la Pantalla:`
   - Establecí los bordes a cero en ambos tipos de vistas previas de puntos de referencia para que el contenido pueda extenderse a los bordes de la pantalla.


## `Sección 5 - Agregué la navegación entre secciones`

Con todos los lugares emblemáticos categorizados de manera diferente visibles en la vista, el usuario necesitaba una forma de llegar a cada sección en la aplicación. Utilicé las API de navegación y presentación para hacer que la página de inicio de la categoría, la vista detallada y la lista de favoritos fueran navegables desde una vista de pestañas.

### `Resumen de los pasos de la sección`
    
`Pasos:`
1. `En CategoryRow, Envolver el CategoryItem Existente con un NavigationLink:`
   - En CategoryRow, envolví el CategoryItem existente con un NavigationLink.
   - El propio elemento de la categoría es la etiqueta para el botón, y su destino es la vista de detalles del punto de referencia representado por la tarjeta.
   - Fijé la vista previa para ver el efecto del próximo paso en CategoryRow.
2. `Cambiar la Apariencia de Navegación de los Elementos de la Categoría Aplicando los Modificadores renderingMode(:) y foregroundStyle(:):`
   - Cambié la apariencia de navegación de los elementos de la categoría aplicando los modificadores renderingMode(:) y foregroundStyle(:).
   - El texto que pasas como etiqueta para un enlace de navegación se representa utilizando el color de acento del entorno, y las imágenes pueden representarse como imágenes de plantilla. Puedes modificar cualquiera de estos comportamientos para adaptarlo mejor a tu diseño.
3. `Desfijar la Vista Previa, Cambiar a ContentView y Agregar una Enumeración de las Pestañas a Mostrar:`
   - Desfijé la vista previa, cambié a ContentView y añadí una enumeración de las pestañas a mostrar.
4. `Añadir una Variable de Estado para la Selección de la Pestaña, y Darle un Valor Predeterminado:`
   - Añadí una variable de estado para la selección de la pestaña y le di un valor predeterminado.
5. `Crear una Vista de Pestañas que Envuelva LandmarkList, así como la Nueva CategoryHome:`
   - Creé una vista de pestañas que envuelve LandmarkList y la nueva CategoryHome.
   - El modificador tag(_:) en cada una de las vistas coincide con uno de los posibles valores que la propiedad de selección puede tomar, de modo que TabView pueda coordinar qué vista mostrar cuando el usuario realiza una selección en la interfaz de usuario.
6. `Darle un Nombre a Cada Pestaña:`
   - Le di un nombre a cada pestaña.
7. `Asegurarse de que la Vista Previa en Vivo Esté Activada y Probar la Nueva Navegación:`
   - Me aseguré de que la vista previa en vivo estuviera activada y probé la nueva navegación.


# Aplicación de unidad final

https://github.com/Marcoc-rasi/SwiftUI-Tutorials---Introducing-SwiftUI/assets/51039101/2f954566-ec75-4b67-9e4f-68ba14fab0f1
