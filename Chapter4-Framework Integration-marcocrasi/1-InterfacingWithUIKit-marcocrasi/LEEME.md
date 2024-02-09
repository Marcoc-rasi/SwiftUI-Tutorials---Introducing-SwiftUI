# `Unidad 4.1 - Interactuando con UIKit - Introducción`

Trabajé con SwiftUI para que funcionara perfectamente con los frameworks de interfaz de usuario existentes en todas las plataformas de Apple. Por ejemplo, pude colocar vistas y controladores de vista de UIKit dentro de vistas de SwiftUI, y viceversa. En este tutorial, convertí el lugar emblemático destacado de la pantalla de inicio para envolver instancias de UIPageViewController y UIPageControl. Usé UIPageViewController para mostrar un carrusel de vistas de SwiftUI, y utilicé variables de estado y enlaces para coordinar las actualizaciones de datos en toda la interfaz de usuario.

## `Sección 1 - Creé una vista para representar un UIPageViewController`

Para representar vistas y controladores de vista de UIKit en SwiftUI, creé tipos que se ajustan a los protocolos UIViewRepresentable y UIViewControllerRepresentable. Mis tipos personalizados crearon y configuraron los tipos de UIKit que representaban, mientras que SwiftUI gestionó su ciclo de vida y los actualizó cuando fue necesario.

### `Resumen de los pasos de la sección`

`Pasos:`

1. `Crear Grupo PageView y Agregar PageViewController:`
   - Creé un grupo llamado `PageView` en la carpeta `Views` de tu proyecto.
   - Agregué un nuevo archivo Swift llamado `PageViewController.swift` y declaré el tipo `PageViewController` como conforme a `UIViewControllerRepresentable`.
   - El controlador de vista de páginas almacena una matriz de instancias de `Page`, que deben ser de tipo `View`. Estas son las páginas que utilizas para desplazarte entre puntos de referencia.
   - Añadí los dos requisitos del protocolo `UIViewControllerRepresentable`.
   
2. `Implementar makeUIViewController(context:) Método:`
   - Añadí el método `makeUIViewController(context:)` que crea un `UIPageViewController` con la configuración deseada.
   - SwiftUI llama a este método una sola vez cuando está listo para mostrar la vista y luego gestiona el ciclo de vida del controlador de vista.
   
3. `Implementar updateUIViewController(_:context:) Método:`
   - Añadí el método `updateUIViewController(:context:)` que llama a `setViewControllers(:direction:animated:)` para proporcionar un controlador de vista para su visualización.
   - Por ahora, creas el `UIHostingController` que alberga la vista SwiftUI de la página en cada actualización. Más adelante, harás esto más eficiente inicializando el controlador solo una vez durante la vida del controlador de vista de página.
   
4. `Preparar una Tarjeta de Características para Usar como Página:`
   - Arrastré las imágenes del directorio `Resources` de los archivos del proyecto descargado a tu catálogo de activos de la aplicación.
   - La imagen de características de un punto de referencia, si existe, tiene dimensiones diferentes que la imagen regular.
   
5. `Agregar Propiedad Calculada a la Estructura Landmark:`
   - Añadí una propiedad calculada a la estructura `Landmark` que devuelve la imagen de características, si existe.
   
6. `Crear el Archivo FeatureCard.swift y Mostrar Texto en la Imagen:`
   - Agregué un nuevo archivo SwiftUI llamado `FeatureCard.swift` que muestra la imagen de características del punto de referencia.
   - Incluí el modificador de relación de aspecto para que imite la relación de aspecto de la vista donde `FeatureCard` se previsualizará más adelante.
   - Sobrepuse información de texto sobre la imagen.
   
7. `Crear el Archivo PageView.swift y Configurar PageViewController como una Vista Secundaria:`
   - Creé un nuevo archivo SwiftUI llamado `PageView.swift` y actualicé el tipo `PageView` para declarar `PageViewController` como una vista secundaria.
   - La vista previa falla porque Xcode no puede inferir un tipo para `Page`.
   
8. `Agregar el Modificador de Relación de Aspecto y Actualizar la Vista Previa:`
   - Añadí el modificador de relación de aspecto y actualicé la vista previa para pasar la matriz requerida de vistas, y la vista previa comienza a funcionar.


## `Sección 2 - Creé el origen de datos del controlador de vista`

En unos pocos pasos cortos, hice mucho: el PageViewController utiliza un UIPageViewController para mostrar contenido de una vista de SwiftUI. Ahora es el momento de habilitar las interacciones de deslizamiento para pasar de una página a otra.

### `Resumen de los pasos de la sección`

`Pasos:`

1. `Declarar una Clase Coordinador Anidada:`
   - Declaré una clase Coordinador anidada dentro de `PageViewController`.
   - SwiftUI administra el coordinador de tu tipo `UIViewControllerRepresentable` y lo proporciona como parte del contexto al llamar a los métodos que creaste anteriormente.
   
2. `Agregar un Método para Crear el Coordinador:`
   - Añadí otro método a `PageViewController` para crear el coordinador.
   - SwiftUI llama a este método `makeCoordinator()` antes de `makeUIViewController(context:)`, para que tengas acceso al objeto del coordinador al configurar tu controlador de vista.
   - Consejo: Puedes usar este coordinador para implementar patrones comunes de Cocoa, como delegados, fuentes de datos y responder a eventos de usuario mediante la acción del objetivo.
   
3. `Inicializar una Matriz de Controladores en el Coordinador:`
   - Inicialicé una matriz de controladores en el coordinador utilizando la matriz de vistas `pages`.
   - El coordinador es un buen lugar para almacenar estos controladores, porque el sistema los inicializa solo una vez y antes de que los necesites para actualizar el controlador de vista.
   
4. `Agregar Conformidad a UIPageViewControllerDataSource:`
   - Añadí la conformidad a `UIPageViewControllerDataSource` al tipo `Coordinator` y implementé los dos métodos requeridos.
   - Estos dos métodos establecen las relaciones entre los controladores de vista, para que puedas desplazarte hacia adelante y hacia atrás entre ellos.
   
5. `Agregar el Coordinador como el Origen de Datos del UIPageViewController:`
   - Añadí el coordinador como el origen de datos del `UIPageViewController`.
   
6. `Regresar a PageView y Probar las Interacciones de Desplazamiento:`
   - Volví a `PageView`, me aseguré de que estaba en el modo en vivo y probé las interacciones de desplazamiento.


## `Sección 3 - Seguí la página en el estado de una vista de SwiftUI`

Para prepararme para agregar un UIPageControl personalizado, necesitaba una forma de rastrear la página actual desde dentro de PageView. Para lograr esto, declaré una propiedad @State en PageView y pasé un enlace a esta propiedad hacia abajo a la vista PageViewController. El PageViewController actualiza el enlace para que coincida con la página visible.

### `Resumen de los pasos de la sección`

`Pasos:`

1. `Agregar un Enlace Bidireccional currentPage:`
   - Comencé añadiendo un enlace bidireccional `currentPage` como propiedad de `PageViewController`.
   - Además de declarar la propiedad `@Binding`, actualicé la llamada a `setViewControllers(_:direction:animated:)`, pasando el valor del enlace `currentPage`.
   
2. `Declarar la Variable @State en PageView:`
   - Declaré la variable `@State` en `PageView` y pasé un enlace a la propiedad al crear el `PageViewController` hijo.
   - Importante: Recuerda usar la sintaxis `$` para crear un enlace a un valor que se almacena como estado.
   
3. `Probar que el Valor Fluye a través del Enlace al PageViewController:`
   - Probé que el valor fluye a través del enlace al `PageViewController` cambiando su valor inicial.
   - Experimento: Añadí un botón a `PageView` que hace que el controlador de vista de página salte a la segunda vista.
   
4. `Añadir un Texto con la Propiedad currentPage:`
   - Añadí un texto con la propiedad `currentPage` para poder observar el valor de la propiedad `@State`.
   - Observé que al deslizar de una página a otra, el valor no cambia.
   
5. `Conformar el Coordinador a UIPageViewControllerDelegate:`
   - En `PageViewController.swift`, conformé el coordinador a `UIPageViewControllerDelegate` y añadí el método `pageViewController(_:didFinishAnimating:previousViewControllers:transitionCompleted completed: Bool)`.
   - Debido a que SwiftUI llama a este método cada vez que se completa una animación de cambio de página, pude encontrar el índice del controlador de vista actual y actualizar el enlace.
   
6. `Asignar el Coordinador como Delegado del UIPageViewController:`
   - Asigné el coordinador como el delegado para el `UIPageViewController`, además del origen de datos.
   - Con el enlace conectado en ambas direcciones, el texto se actualiza para mostrar el número de página correcto después de cada deslizamiento.


## `Sección 4 - Agregué un control de página personalizado`

Estaba listo para agregar un UIPageControl personalizado a mi vista, envuelto en una vista UIViewRepresentable de SwiftUI.

### `Resumen de los pasos de la sección`

`Pasos:`

1. `Crear un Nuevo Archivo de Vista SwiftUI:`
   - Creé un nuevo archivo de vista SwiftUI llamado `PageControl.swift`.
   - Actualicé el tipo `PageControl` para que conforme al protocolo `UIViewRepresentable`.
   
2. `Reemplazar el Cuadro de Texto con el Page Control en PageControl:`
   - Reemplacé el cuadro de texto con el control de página, cambiando de un `VStack` a un `ZStack` para el diseño.
   - Dado que estoy pasando el recuento de páginas y el enlace a la página actual, el control de página ya muestra los valores correctos.
   - A continuación, hice que el control de página fuera interactivo para que los usuarios puedan tocar un lado u otro para moverse entre páginas.
   
3. `Crear un Tipo de Coordinador Anidado en PageControl:`
   - Creé un tipo de coordinador anidado en `PageControl` y añadí un método `makeCoordinator()` para crear y devolver un nuevo coordinador.
   - Dado que las subclases de UIControl como UIPageControl utilizan el patrón de objetivo-acción en lugar de la delegación, este coordinador implementa un método `@objc` para actualizar el enlace de la página actual.
   
4. `Agregar el Coordinador como Objetivo para el Evento valueChanged:`
   - Añadí el coordinador como el objetivo para el evento `valueChanged`, especificando el método `updateCurrentPage(sender:)` como la acción a realizar.
   
5. `Finalmente, en CategoryHome, Reemplazar la Imagen de la Característica con la Nueva Vista de Página:`
   - Reemplacé la imagen de la característica de marcador de posición con la nueva vista de página en `CategoryHome`.
   
6. `Probar Todas las Diferentes Interacciones:`
   - Probé todas las interacciones diferentes. `PageView` demuestra cómo las vistas y controladores de UIKit y SwiftUI pueden trabajar juntos.

# Aplicación de unidad final

https://github.com/Marcoc-rasi/SwiftUI-Tutorials---Introducing-SwiftUI/assets/51039101/a004cc62-d8ce-42ed-86ad-cafa65cfdf9f
