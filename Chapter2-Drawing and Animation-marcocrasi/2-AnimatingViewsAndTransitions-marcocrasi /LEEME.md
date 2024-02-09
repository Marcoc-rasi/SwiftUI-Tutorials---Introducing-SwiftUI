### `Unit 2.2 - Animando vistas y transiciones - Introducción`

Cuando usé SwiftUI, pude animar individualmente los cambios en las vistas o en el estado de una vista, sin importar dónde estuvieran los efectos. SwiftUI maneja toda la complejidad de estas animaciones combinadas, superpuestas e interrumpibles por ti.
En este tutorial, animaré una vista que contiene un gráfico para seguir las caminatas que un usuario realiza mientras usa la aplicación Landmarks. Usando el modificador `animation(_ :)`, verás lo fácil que es animar una vista.

#### `Sección 1 - Agregar datos de senderismo a la aplicación`

Antes de poder agregar animación, necesitaré algo que animar. En esta sección, importaré y modelaré datos de senderismo, y luego agregaré algunas vistas preconstruidas para mostrar esos datos estáticamente en un gráfico.

#### Resumen de los pasos de la sección

`Pasos:`
1. `Arrastrar el Archivo hikeData.json al Grupo de Recursos del Proyecto:`
   - Arrastré el archivo `hikeData.json` desde la carpeta de recursos descargada al grupo de recursos del proyecto.
   - Aseguré seleccionar "Copiar elementos si es necesario" antes de hacer clic en "Finalizar".
2. `Crear un Nuevo Archivo Swift llamado Hike.swift en el Grupo del Modelo:`
   - Creé un nuevo archivo Swift llamado `Hike.swift` en el grupo del modelo utilizando la opción de menú "File > New > File".
   - Al igual que la estructura `Landmark`, la estructura `Hike` cumple con el protocolo `Codable` y tiene propiedades que coinciden con las claves en el archivo de datos correspondiente.
3. `Cargar el Array de Excursiones en tu Modelo:`
   - Cargué el array de excursiones en el modelo.
4. `Arrastrar la Carpeta Hikes al Grupo de Vistas del Proyecto:`
   - Arrastré la carpeta `Hikes` desde la carpeta de recursos descargada al grupo de vistas del proyecto.
   - Aseguré seleccionar "Copiar elementos si es necesario" y "Crear grupos" antes de hacer clic en "Finalizar".
   - Me familiaricé con las nuevas vistas. Trabajan juntas para mostrar los datos de las excursiones cargados en el modelo.
5. `En HikeView, Experimentar con Mostrar y Ocultar el Gráfico:`
   - Experimenté con mostrar y ocultar el gráfico en `HikeView`.
   - Aseguré utilizar la vista previa en vivo durante todo este tutorial para poder experimentar con los resultados de cada paso.


### `Sección 2 - Agregar animaciones a vistas individuales`

Cuando utilicé el modificador `animation(_:)` en una vista equatable, SwiftUI animó cualquier cambio en las propiedades animables de la vista. El color, la opacidad, la rotación, el tamaño y otras propiedades de una vista son todas animables. Cuando la vista no es equatable, puedo usar el modificador `animation(_:value:)` para iniciar animaciones cuando cambia el valor especificado.

#### Resumen de los pasos de la sección

`Pasos:`
1. `Activar la Animación para la Rotación del Botón en HikeView:`
   - En `HikeView`, activé la animación para la rotación del botón agregando un modificador `animation` que comienza en cambios del valor `showDetail`.
2. `Agregar otro Cambio Animable para Agrandar el Botón cuando el Gráfico es Visible:`
   - Añadí otro cambio animable haciendo que el botón sea más grande cuando el gráfico es visible.
   - El modificador `animation` se aplica a todos los cambios animables dentro de las vistas que envuelve.
3. `Cambiar el Tipo de Animación de easeInOut a spring():`
   - Cambié el tipo de animación de `easeInOut` a `spring()`.
   - SwiftUI incluye animaciones básicas con funciones de aceleración predefinidas o personalizadas, así como animaciones de tipo resorte y fluidas. Se pueden ajustar la velocidad de una animación, establecer un retraso antes de que comience una animación o especificar que una animación se repita.
4. `Intentar Desactivar la Animación para la Rotación:`
   - Probé desactivar la animación para la rotación agregando otro modificador `animation` justo encima del modificador `scaleEffect`.
   - Experimenté con SwiftUI. Intenté combinar diferentes efectos de animación para explorar las posibilidades.
5. `Eliminar Ambos Modificadores de Animación Antes de Continuar con la Siguiente Sección:`
   - Eliminé ambos modificadores de animación antes de pasar a la siguiente sección.


### `Sección 3 - Animar los efectos de los cambios de estado`

Ahora que aprendí cómo aplicar animaciones a vistas individuales, es hora de agregar animaciones en lugares donde cambio el valor de mi estado. Aquí, aplicaré animaciones a todos los cambios que ocurren cuando un usuario toca un botón y alterna la propiedad de estado `showDetail`.

#### Resumen de los pasos de la sección

`Pasos:`
1. `Envolver la Llamada a showDetail.toggle() con withAnimation:`
   - Envuelvo la llamada a `showDetail.toggle()` con una llamada a la función `withAnimation`.
   - Ambas vistas afectadas por la propiedad `showDetail` — el botón de divulgación y la vista `HikeDetail` — ahora tienen transiciones animadas.
   - Ralento la animación para observar cómo las animaciones en SwiftUI son interrumpibles.
2. `Pasar una Animación Básica de Cuatro Segundos a withAnimation:`
   - Paso una animación básica de cuatro segundos a la función `withAnimation`.
   - Puedo pasar los mismos tipos de animaciones a la función `withAnimation` que pasé al modificador `animation(_:value:)`.
3. `Experimentar con la Apertura y Cierre de la Vista del Gráfico en Mitad de la Animación:`
   - Experimento con la apertura y cierre de la vista del gráfico en mitad de la animación.
4. `Antes de Continuar a la Siguiente Sección, Restaurar la Función withAnimation para Usar la Animación Predeterminada Eliminando el Parámetro de Entrada de la Llamada:`
   - Antes de pasar a la siguiente sección, restauro la función `withAnimation` para usar la animación predeterminada eliminando el parámetro de entrada de la llamada.


### `Sección 4 - Personalizar transiciones de vista`

De forma predeterminada, las vistas hacen transiciones dentro y fuera de la pantalla mediante fundidos. Puedo personalizar esta transición utilizando el modificador `transition(_ :)`.

#### Resumen de los pasos de la sección

`Pasos:`
1. `Agregar el Modificador transition(_:) a HikeView para la Transición Condicional:`
   - Añadí el modificador `transition(_:)` a la vista condicionalmente visible `HikeView`.
   - Ahora, el gráfico aparece y desaparece deslizándose dentro y fuera de la vista.
2. `Extraer la Transición Agregada como una Propiedad Estática de AnyTransition:`
   - Extraje la transición que acabo de agregar como una propiedad estática de `AnyTransition`.
   - Accedí a la nueva propiedad en el modificador de transición de la vista.
   - Esto mantiene limpio tu código a medida que expandes la transición personalizada.
3. `Cambiar a la Transición move(edge:) para que el Gráfico Deslice desde el Mismo Lado:`
   - Cambié a usar la transición `move(edge:)`, de modo que el gráfico se deslice hacia dentro y fuera desde el mismo lado.
4. `Usar el Modificador asymmetric(insertion:removal:) para Proporcionar Transiciones Diferentes al Aparecer y Desaparecer de la Vista:`
   - Usé el modificador `asymmetric(insertion:removal:)` para proporcionar transiciones diferentes cuando la vista aparece y desaparece.


### `Sección 5 - Componer animaciones para efectos complejos`

El gráfico cambia entre tres conjuntos diferentes de datos cuando haces clic en los botones debajo de las barras. En esta sección, utilizaré una animación compuesta para dar a las cápsulas que componen el gráfico una transición dinámica y ondulada.

#### Resumen de los pasos de la sección

`Pasos:`
1. `Cambiar el Valor Predeterminado de showDetail a Verdadero en HikeView:`
   - En `HikeView`, cambié el valor predeterminado para `showDetail` a true.
   - Fijé la vista previa en el lienzo para poder ver el gráfico en contexto mientras trabajo en la animación en otro archivo.
2. `Definir una Nueva Animación de Ondulación en HikeGraph:`
   - En `HikeGraph`, definí una nueva animación de ondulación y la apliqué a cada cápsula de gráfico generada.
3. `Cambiar la Animación a una Animación Spring para Hacer que las Barras Salten:`
   - Cambié la animación a una animación spring, con una fracción de amortiguación reducida para hacer que las barras salten.
   - Puedes observar el efecto de la animación cambiando entre elevación, ritmo cardíaco y velocidad en la vista previa en vivo.
4. `Acelerar un Poco la Animación para Reducir el Tiempo que Toma Cada Barra para Moverse a su Nueva Posición:`
   - Aceleré un poco la animación para reducir el tiempo que cada barra toma para moverse a su nueva posición.
5. `Agregar un Retraso a Cada Animación Basado en la Posición de la Cápsula en el Gráfico:`
   - Agregué un retraso a cada animación basado en la posición de la cápsula en el gráfico.
6. `Observar Cómo la Animación Personalizada Proporciona un Efecto Ondulante al Transicionar Entre Gráficos:`
   - Observé cómo la animación personalizada proporciona un efecto ondulante al hacer la transición entre gráficos.
   - Asegúrate de desfijar la vista previa antes de pasar al siguiente tutorial.


