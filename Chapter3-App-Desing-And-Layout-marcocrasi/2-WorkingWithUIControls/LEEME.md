# `Unidad 3.2 - Trabajando con controles de interfaz de usuario - Introducción`

En la aplicación Landmarks, los usuarios pueden crear un perfil para expresar su personalidad. Para darles a los usuarios la capacidad de cambiar su perfil, agregaré un modo de edición y diseñaré la pantalla de preferencias. Trabajaré con una variedad de controles de interfaz de usuario comunes para la entrada de datos y actualizaré los tipos de modelo de Landmarks cada vez que el usuario guarde sus cambios.

## `Sección 1 - Mostrar un perfil de usuario`

La aplicación Landmarks almacena localmente algunos detalles de configuración y preferencias. Antes de que el usuario edite sus detalles, se muestran en una vista resumen que no tiene controles de edición.

### `Resumen de los pasos de la sección`

`Pasos:`
1. `Definir un Perfil de Usuario en un Nuevo Archivo Swift Llamado Profile.swift:`
   - Empecé definiendo un perfil de usuario en un nuevo archivo Swift llamado Profile.swift, que añadí al grupo Model de mi proyecto.
2. `Crear un Nuevo Grupo llamado Perfiles debajo del Grupo Vistas, y Luego Agregar una Vista Llamada ProfileHost con un Texto que Muestra el Nombre de Usuario de un Perfil Almacenado:`
   - Creé un nuevo grupo llamado Perfiles bajo el grupo de Vistas y luego añadí una vista llamada ProfileHost a ese grupo, con un texto que muestra el nombre de usuario de un perfil almacenado.
   - La vista ProfileHost alojará tanto una vista estática de resumen de información de perfil como un modo de edición.
   - Nota: Establecí draftProfile aquí como un perfil predeterminado como marcador de posición hasta que introduzca el perfil de datos del modelo más adelante.
3. `Crear Otra Vista en el Grupo Perfiles Llamada ProfileSummary que Toma una Instancia de Perfil y Muestra Alguna Información Básica del Usuario:`
   - Creé otra vista en el grupo Perfiles llamada ProfileSummary que toma una instancia de Profile y muestra alguna información básica del usuario.
   - El resumen del perfil toma un valor de Profile en lugar de un enlace al perfil porque la vista principal, ProfileHost, gestiona el estado de esta vista.
4. `Actualizar ProfileHost para Mostrar la Nueva Vista de Resumen:`
   - Actualicé ProfileHost para mostrar la nueva vista de resumen.
5. `Crear una Nueva Vista Llamada HikeBadge en la Carpeta Hikes que Compone la Insignia de Senderismo con Texto Descriptivo sobre la Caminata:`
   - Creé una nueva vista llamada HikeBadge en la carpeta Hikes que compone la Insignia a partir de trazos y formas de dibujo junto con un texto descriptivo sobre la caminata.
   - La insignia es simplemente gráfica, así que el texto en HikeBadge junto con el modificador accessibilityLabel(_:), hacen que el significado de la insignia sea más claro para otros usuarios.
   - Nota: La lógica de dibujo de la insignia produce un resultado que depende del tamaño del marco en el que se renderiza. Para asegurar la apariencia deseada, rendericé en un marco de 300 x 300 puntos. Para obtener el tamaño deseado para el gráfico final, luego escalé el resultado renderizado y lo coloqué en un marco comparativamente más pequeño.
6. `Actualizar ProfileSummary para Agregar Varias Insignias con Tonos y Razones Variables para Ganar la Insignia:`
   - Actualicé ProfileSummary para agregar varias insignias con tonos y razones variables para ganar la insignia.
7. `Concluir el Resumen del Perfil Incluyendo una Vista HikeView de las Vistas y Transiciones Animadas:`
   - Concluí el resumen del perfil incluyendo una vista HikeView de las vistas y transiciones animadas.
   - Para usar los datos de caminata, también necesitas añadir una propiedad de entorno de datos del modelo.
8. `En CategoryHome, Agregar un Botón de Perfil de Usuario a la Barra de Navegación Usando el Modificador de Barra de Herramientas, y Presentar la Vista ProfileHost cuando el Usuario Toca el Botón:`
   - En CategoryHome, añadí un botón de perfil de usuario a la barra de navegación usando el modificador de barra de herramientas y presenté la vista ProfileHost cuando el usuario toca el botón.
9. `Agregar el Modificador listStyle para Seleccionar un Estilo de Lista que se Ajuste Mejor al Contenido:`
   - Añadí el modificador listStyle para seleccionar un estilo de lista que se ajuste mejor al contenido.
10. `Asegurarse de que se Esté en Vista Previa en Vivo y Probar Tocar el Botón de Perfil para Examinar el Resumen del Perfil:`
   - Me aseguré de que estuviera en la vista previa en vivo y probé tocar el botón de perfil para examinar el resumen del perfil.


## `Sección 2 - Agregar un modo de edición`

Los usuarios necesitan alternar entre ver o editar los detalles de su perfil. Agregaré un modo de edición añadiendo un botón de edición al ProfileHost existente, y luego creando una vista con controles para editar valores individuales.

### `Resumen de los pasos de la sección`

`Pasos:`

1. `Seleccionar ProfileHost y Agregar los Datos del Modelo como una Propiedad de Entorno a la Vista Previa:`
   - Seleccioné ProfileHost y añadí los datos del modelo como una propiedad de entorno a la vista previa.
   - Aunque esta vista no usa una propiedad con el envoltorio de propiedad @Environment, ProfileSummary, un hijo de esta vista, sí lo hace. Así que sin el modificador, la vista previa falla.

2. `Agregar una Propiedad de Vista de Entorno que Dependencia del .editMode del Entorno:`
   - Añadí una propiedad de vista de entorno que depende del .editMode del entorno.
   - SwiftUI proporciona almacenamiento en el entorno para valores a los que puedes acceder usando el envoltorio de propiedad @Environment. Anteriormente, usaste @Environment para recuperar una clase que almacenaste en el entorno. Aquí, lo usas para acceder al valor editMode que está integrado en el entorno para leer o escribir en el ámbito de edición.

3. `Crear un Botón de Edición que Alterna el Valor editMode del Entorno:`
   - Creé un botón de edición que alterna el valor editMode del entorno.
   - El botón de edición controla el mismo valor editMode del entorno al que accediste en el paso anterior.

4. `Actualizar la Clase ModelData para Incluir una Instancia del Perfil de Usuario que Persiste Incluso Después de que el Usuario Cierre la Vista del Perfil:`
   - Actualicé la clase ModelData para incluir una instancia del perfil de usuario que persiste incluso después de que el usuario cierre la vista del perfil.

5. `Leer los Datos del Perfil del Usuario desde el Entorno para Pasar el Control de los Datos al Host del Perfil:`
   - Leí los datos del perfil del usuario desde el entorno para pasar el control de los datos al host del perfil.
   - Para evitar actualizar el estado global de la aplicación antes de confirmar cualquier edición, como cuando el usuario ingresa su nombre, la vista de edición opera sobre una copia de sí misma.

6. `Añadir una Vista Condicional que Muestra ya Sea el Perfil Estático o la Vista para el Modo Edición:`
   - Añadí una vista condicional que muestra ya sea el perfil estático o la vista para el modo edición.
   - Puedes ver el efecto de entrar en el modo de edición ejecutando la vista previa en vivo y tocando el botón de edición. Por ahora, la vista del modo de edición es solo un campo de texto estático.


## `Sección 3 - Definir el editor de perfil`

El editor de perfil del usuario consiste principalmente en diferentes controles que cambian detalles individuales en el perfil. Algunos elementos en el perfil, como las insignias, no son editables por el usuario, por lo que no aparecen en el editor. Para mantener la consistencia con el resumen del perfil, agregaré los detalles del perfil en el mismo orden en el editor.

### `Resumen de los pasos de la sección`

`Pasos:`

1. `Crear una Nueva Vista Llamada ProfileEditor e Incluir un Enlace (binding) a la Copia Borrador del Perfil del Usuario:`
   - Creé una nueva vista llamada ProfileEditor e incluí un enlace (binding) a la copia borrador del perfil del usuario.
   - El primer control en la vista es un TextField, que controla y actualiza un enlace (binding) de cadena, en este caso, el nombre de visualización elegido por el usuario. Proporcionas una etiqueta y un enlace a una cadena al crear un campo de texto.

2. `Actualizar el Contenido Condicional en ProfileHost para Incluir el Editor de Perfiles y Pasar el Enlace (binding) del Perfil:`
   - Actualicé el contenido condicional en ProfileHost para incluir el editor de perfiles y pasar el enlace (binding) del perfil.
   - Ahora, la vista de edición de perfil se muestra cuando tocas "Editar".

3. `Agregar un Interruptor (Toggle) que Corresponde a la Preferencia del Usuario para Recibir Notificaciones sobre Eventos Relacionados con Puntos de Referencia:`
   - Añadí un interruptor (toggle) que corresponde a la preferencia del usuario para recibir notificaciones sobre eventos relacionados con puntos de referencia.
   - Los interruptores son controles que están encendidos o apagados, por lo que son adecuados para valores booleanos como una preferencia de sí o no.

4. `Colocar un Control Picker y su Etiqueta en el HStack para Hacer que las Fotos de Puntos de Referencia Tengan una Estación Preferida Seleccionable:`
   - Coloqué un control Picker y su etiqueta en el HStack para hacer que las fotos de puntos de referencia tengan una estación preferida seleccionable.

5. `Finalmente, Agregar un Selector de Fechas Debajo del Selector de Estación para Hacer Modificable la Fecha de Meta de Visita a un Punto de Referencia:`
   - Finalmente, añadí un DatePicker debajo del selector de estación para hacer modificable la fecha de meta de visita a un punto de referencia.


## `Sección 4 - Retrasar la propagación de la edición`

Para que las ediciones no surtan efecto hasta que el usuario salga del modo de edición, utilizo la copia provisional de su perfil durante la edición y luego asigno la copia provisional a la copia real solo cuando el usuario confirma una edición.

### `Resumen de los pasos de la sección`

**Pasos:**

`Pasos:`

1. `Agregar un Botón de Cancelar a ProfileHost:`
   - Añadí un botón de Cancelar a ProfileHost.
   - A diferencia del botón de Hecho (Done) que proporciona EditButton, el botón de Cancelar no aplica las ediciones a los datos reales del perfil en su bloque de cierre.

2. `Aplicar los Modificadores onAppear(perform:) y onDisappear(perform:) para Poblar el Editor con los Datos de Perfil Correctos y Actualizar el Perfil Persistente cuando el Usuario Toca el Botón de Hecho (Done):`
   - Apliqué los modificadores onAppear(perform:) y onDisappear(perform:) para poblar el editor con los datos de perfil correctos y actualizar el perfil persistente cuando el usuario toca el botón de Hecho (Done).
   - De lo contrario, los valores antiguos aparecen la próxima vez que se activa el modo de edición.


