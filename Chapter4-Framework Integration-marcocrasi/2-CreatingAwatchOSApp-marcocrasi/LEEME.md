# `Unidad 4.2 - Creando una aplicación para watchOS - Introducción`

En este tutorial, tuve la oportunidad de aplicar gran parte de lo que ya había aprendido sobre SwiftUI y, con poco esfuerzo, migrar la aplicación Landmarks a watchOS. Comencé agregando un objetivo de watchOS a mi proyecto, antes de copiar los datos y vistas compartidos que creé para la aplicación iOS. Con todos los recursos en su lugar, personalicé las vistas de SwiftUI para mostrar las vistas de detalle y lista en watchOS.

## `Sección 1 - Añadí un objetivo de watchOS`

Para crear una aplicación para watchOS, comencé agregando un objetivo de watchOS al proyecto. Xcode añadió grupos y archivos para la aplicación de watchOS a mi proyecto, junto con los esquemas necesarios para compilar y ejecutar la aplicación.

### `Resumen de mis pasos en esta sección.`

`Pasos:`

1. `Crear un Nuevo Destino:`
   - Elige File > New > Target.
   - En la ventana de plantillas, selecciona la pestaña de watchOS.
   - Selecciona la plantilla de App y haz clic en Next.
   
2. `Configurar el Nuevo Destino de la Aplicación watchOS:`
   - En la ventana de configuración, ingresa `WatchLandmarks` como el Nombre del Producto.
   - Selecciona la opción Watch App for Existing iOS App.
   - Haz clic en Finish.
   
3. `Activar el Esquema de la Aplicación WatchLandmarks:`
   - Cuando Xcode solicite activar el esquema `WatchLandmarks` Watch App, haz clic en Activate.
   - Esto habilita el inicio del trabajo con el nuevo destino.
   
4. `Seleccionar un Dispositivo de watchOS:`
   - Selecciona `Apple Watch Series 9 (45mm)` en el menú desplegable de Simuladores de watchOS.
   
5. `Configurar Opciones del Destino:`
   - Selecciona el objetivo `WatchLandmarks Watch App`.
   - Ve a la pestaña General del objetivo.
   - Selecciona la casilla Supports Running Without iOS App Installation.


## `Sección 2 - Compartí archivos entre objetivos`

Con el objetivo de watchOS configurado, necesité compartir algunos recursos del objetivo de iOS. Reutilicé el modelo de datos de la aplicación Landmark, algunos archivos de recursos, así como cualquier vista que ambas plataformas pudieran mostrar sin modificación.

### `Resumen de mis pasos en esta sección.`

En primer lugar, eliminé el punto de entrada para la aplicación de watchOS. No lo necesitaba porque reutilizaría el punto de entrada definido en LandmarksApp en su lugar.

`Pasos:`

1. `Eliminar Archivo WatchLandmarksApp:`
   - Navegué al Project navigator y eliminé el archivo `WatchLandmarksApp` en la carpeta `WatchLandmarks Watch App`. Cuando se me preguntó, seleccioné "Mover a la papelera".

2. `Seleccionar Archivos Compartidos con watchOS:`
   - Mantuve presionada la tecla Command y seleccioné los archivos que mi objetivo watchOS puede compartir con la aplicación iOS existente, incluyendo el punto de entrada de la aplicación.

3. `Agregar Archivos de Vista Compartidos:`
   - Continué manteniendo presionada la tecla Command y seleccioné archivos de vista clave como `LandmarksApp`, `LandmarkList`, `LandmarkRow`, `CircleImage`, `MapView`. Estos archivos son vistas que la aplicación puede mostrar en watchOS sin cambios.

4. `Agregar Archivos de Modelo Compartidos:`
   - Continué manteniendo presionada la tecla Command y añadí archivos de modelo importantes como `ModelData`, `Landmark`, `Hike`, `Profile`. Estos archivos definen el modelo de datos de la aplicación.

5. `Agregar Archivos de Recursos Compartidos:`
   - Terminé manteniendo presionada la tecla Command para agregar archivos de recursos necesarios para el modelo: `landmarkData`, `hikeData`, y `Assets`.

6. `Asignar Archivos al Objetivo watchOS:`
   - En el inspector de archivos, seleccioné la casilla `WatchLandmarks Watch App` en la sección "Target Membership". Esto hace que los símbolos seleccionados en los pasos anteriores estén disponibles para la aplicación watchOS.

7. `Agregar Icono de la Aplicación watchOS:`
   - Seleccioné el archivo `Assets` en la carpeta `WatchLandmarks Watch App` y navegué hasta el conjunto vacío de `AppIcon`.

8. `Arrastrar el Archivo PNG:`
   - Arrastré el único archivo PNG desde la carpeta de Recursos del proyecto descargado hasta el conjunto vacío de `AppIcon` existente.

9. `Configurar Icono de la Aplicación watchOS:`
   - Asegurándome de que más adelante, cuando cree una notificación, el sistema presente el ícono de mi aplicación para ayudar a identificar la fuente de la notificación.


## `Sección 3 - Creé la vista detallada`

Ahora que los recursos del objetivo de iOS están en su lugar para trabajar en la aplicación de reloj, necesité crear una vista específica para el reloj para mostrar los detalles del lugar emblemático. Para probar la vista detallada, creé vistas previas personalizadas para los tamaños de reloj más grandes y más pequeños, y realicé algunos cambios en la vista circular para que todo encajara en la esfera del reloj.

### `Resumen de mis pasos en esta sección.`

`Pasos:`

1. `Agregar Vista Personalizada:`
   - Añadí una nueva vista personalizada a la carpeta `WatchLandmarks Watch App` llamada `LandmarkDetail.swift`. Este archivo se distingue del archivo con el mismo nombre en el proyecto de iOS por su pertenencia al objetivo, aplicándose solo al objetivo `WatchLandmarks Watch App`.

2. `Agregar Propiedades al LandmarkDetail:`
   - Añadí las propiedades `modelData`, `landmark`, y `landmarkIndex` a la nueva estructura `LandmarkDetail`. Estas son idénticas a las propiedades que se agregaron en el paso de "Handling user input".

3. `Configurar Vista Previa:`
   - En la vista previa, creé una instancia de los datos del modelo y la usé para pasar un objeto `landmark` al inicializador de la estructura `LandmarkDetail`. También establecí el entorno de la vista.

4. `Seleccionar Dispositivo:`
   - Establecí el selector de dispositivo para que la vista previa muestre un "Large Watch".

5. `Retornar CircleImage:`
   - Devolví una vista `CircleImage` desde el método `body()`. Reutilicé la vista `CircleImage` del proyecto de iOS. Como creé una imagen redimensionable, la llamada a `scaledToFill()` ajusta el tamaño del círculo para que llene la pantalla.

6. `Cambiar Tamaño del Dispositivo:`
   - Cambié el selector de dispositivo para que la vista previa muestre un "Small Watch". Al probar contra las caras de reloj más grandes y más pequeñas, se puede ver cómo se ajusta la aplicación a diferentes tamaños de pantalla.

7. `Agregar Información en VStack:`
   - Incrusté la imagen circular en un `VStack`. Mostré el nombre del lugar destacado y su información debajo de la imagen.

8. `Envolver en ScrollView:`
   - Envolví el stack vertical en un `ScrollView`. Esto activa el desplazamiento de la vista, pero crea otro problema: la imagen circular ahora se expande al tamaño completo y redimensiona otros elementos de la interfaz de usuario para que coincidan con el tamaño de la imagen.

9. `Ajustar Escala y Agregar Padding:`
   - Cambié `scaleToFill()` a `scaleToFit()` y añadí relleno. Esto escala la imagen circular para que coincida con el ancho de la pantalla y asegura que el nombre del lugar destacado sea visible debajo de la imagen circular.

10. `Agregar MapView y Divider:`
    - Añadí el `MapView` después de un divisor. El mapa aparece fuera de la pantalla, pero se puede desplazar hacia abajo para verlo.

11. `Agregar Título al Botón de Retroceso:`
    - Añadí un título al botón de retroceso. Esto establece el texto del botón de retroceso como "Landmarks".


## `Sección 4 - Agregué la lista de lugares emblemáticos`

La LandmarkList que creé para iOS funciona también para mi aplicación de reloj, y automáticamente navega a la vista detallada específica del reloj que acabo de crear cuando se compila para watchOS. A continuación, conecté la lista al ContentView del reloj, para que actúe como la vista de nivel superior para la aplicación de reloj.

### `Resumen de mis pasos en esta sección.`

`Pasos:`

1. `Seleccionar ContentView:`
   - Seleccioné `ContentView` en la carpeta `WatchLandmarks Watch App`. Al igual que `LandmarkDetail`, la vista de contenido para el objetivo de watchOS tiene el mismo nombre que la del objetivo de iOS. Mantener los nombres e interfaces iguales facilita compartir archivos entre objetivos.

2. `Modificar ContentView:`
   - Modifiqué `ContentView` para que muestre la vista `List`. Asegurándome de proporcionar los datos del modelo como un entorno para la vista previa. `LandmarksApp` ya proporciona esto a nivel de la aplicación en tiempo de ejecución, al igual que lo hace para iOS, pero también es necesario proporcionarlo para cualquier vista previa que lo necesite.

3. `Ver Vista Previa en Tiempo Real:`
   - Asegurándome de estar en la vista previa en tiempo real para observar el comportamiento de la aplicación.


## `Sección 5 - Creé una interfaz de notificación personalizada`

Mi versión de Landmarks para watchOS está casi completa. En esta sección final, creé una interfaz de notificación que muestra información del lugar emblemático cada vez que recibo una notificación que indica que estoy cerca de uno de mis lugares favoritos.

### `Resumen de mis pasos en esta sección.`

`Pasos:`

1. `Agregar una Nueva Vista Personalizada:`
   - Agregué una nueva vista personalizada llamada `NotificationView.swift` a la carpeta `WatchLandmarks Watch App`. Creé una vista que muestra información sobre un hito, título y mensaje.

2. `Agregar Vista Previa:`
   - Añadí una vista previa que establece las propiedades de título, mensaje y hito para la vista de notificación. Esto muestra una vista previa de la notificación cuando se proporcionan datos. Como cualquier valor de notificación puede ser nulo, es útil mantener la vista previa predeterminada de la vista de notificación cuando no se proporcionan datos.

3. `Crear Controlador de Notificaciones:`
   - Creé un nuevo archivo Swift llamado `NotificationController.swift` y añadí una estructura de controlador de alojamiento que incluye las propiedades `landmark`, `title` y `message`. Estas propiedades almacenan valores sobre una notificación entrante.

4. `Actualizar Método `body()`:`
   - Actualicé el método `body()` para usar estas propiedades. Este método instancia la vista de notificación que se creó anteriormente.

5. `Definir la Clave `landmarkIndexKey`:`
   - Definí la clave `landmarkIndexKey`. Se utiliza esta clave para extraer el índice del hito de la notificación.

6. `Agregar el Método `didReceive(_:)`:`
   - Añadí el método `didReceive(_:)` para analizar datos de la notificación. Este método actualiza las propiedades del controlador. Después de llamar a este método, el sistema invalida la propiedad `body` del controlador, lo que actualiza tu vista de notificación. Luego, el sistema muestra la notificación en Apple Watch.

7. `Agregar Escena de Notificación a `LandmarksApp`:`
   - Fui a `LandmarksApp` y agregué una `WKNotificationScene` usando la categoría `LandmarkNear`. La escena solo tiene sentido para watchOS, así que añadí la compilación condicional.

8. `Solicitar Autorización para Notificaciones:`
   - Fui a `ContentView` y solicité autorización para habilitar notificaciones desde el Centro de Notificaciones. Hice la solicitud usando un modificador de tarea asíncrona que SwiftUI llama cuando la vista de contenido aparece por primera vez. Configuré la carga de prueba para usar la categoría `LandmarkNear` y pasar los datos esperados por el controlador de notificaciones.

9. `Agregar Archivo de Simulación de Notificaciones:`
   - Añadí un nuevo archivo de simulación de notificaciones llamado `PushNotificationPayload.apns` a la carpeta `WatchLandmarks Watch App`. No añadí el archivo `PushNotificationPayload` a ningún objetivo, porque no forma parte de la aplicación.

10. `Actualizar Propiedades del Archivo de Simulación:`
    - Actualicé las propiedades de título, cuerpo, categoría, landmarkIndex y `Simulator Target Bundle`. Asegurándome de establecer la categoría en `LandmarkNear`. También eliminé cualquier clave que no se usara en el tutorial, como el subtítulo, WatchKit Simulator Actions y customKey.

11. `Compilar y Ejecutar en el Simulador:`
    - Compilé y ejecuté el esquema `WatchLandmarks Watch App` en un simulador. La primera vez que ejecutas la aplicación, el sistema solicita permiso para enviar notificaciones. Seleccioné `Allow`.

12. `Simular una Notificación:`
    - Después de otorgar permiso, utilicé Xcode para detener la aplicación y luego arrastré el archivo `PushNotificationPayload` sobre la cara del reloj en el simulador. El simulador muestra una notificación desplazable que incluye: el ícono de la aplicación para ayudar a identificar la aplicación de Landmarks como el remitente, la vista de notificación y botones para las acciones de la notificación.


