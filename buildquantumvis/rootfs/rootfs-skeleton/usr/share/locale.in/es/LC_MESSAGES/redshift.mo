��    �      l  �   �      �  �  �  P   �  U   �  %   2  b   X  <   �     �     �  
          )   $  /   N  1   ~  +   �  	   �     �       p   $  1   �     �     �     �     	  $   !  "   F  &   i     �     �     �  !   �     �  *   �     *  P   G     �  E   �     �  -   �            /   '     W     u  &   �     �     �     �  +     M   =     �     �  $   �  (   �     �       )   !     K  %   `     �     �  )   �      �            #        2     K  5   P     �     �     �     �     �     �  2   �     /     4  �   =  )   �            ;   4     p  3   �  :   �  ;   �     0     L     l     x     �  )   �     �  '   �  N       V  �   l  M   c  
   �  &   �     �  '     !   +  '   M     u  3   �  !   �     �            &   :  %   a     �  #   �     �     �           #   #   C   &   g      �   $   �       �   $   �       !      6!  "   W!  /   z!  6   �!  =   �!     "     3"     I"     b"  0   d"     �"     �"  �  �"  d  K$  b   �'  c   (  #   w(  l   �(  =   )     F)     M)  
   V)     a)  +   s)  1   �)  6   �)  K   *     T*      g*  *   �*  }   �*  2   1+     d+     r+     �+     �+  ,   �+  /   �+  ;   ,     M,     T,  !   i,  5   �,     �,  9   �,  &   -  \   >-     �-  Q   �-     �-  2   �-     2.     4.  3   =.  *   q.      �.  +   �.      �.     
/  5   (/  -   ^/  W   �/     �/     �/  (   0  )   40  
   ^0      i0  *   �0  (   �0  E   �0     $1     B1  ;   \1  &   �1     �1     �1  6   �1  "   �1     !2  7   )2     a2     v2     2     �2      �2      �2  5   �2     3     $3  �   -3  .   �3     4      4  B   14     t4  K   �4  M   �4  O   $5  *   t5  +   �5     �5     �5  $   �5  +   6     76  *   H6  ^   s6  /  �6     8  W   9     [9  +   g9  #   �9  ,   �9  '   �9  ,   :  %   9:  8   _:  &   �:  !   �:  #   �:     ;  5   %;  /   [;  )   �;  -   �;  .   �;  $   <     7<  %   U<  *   {<  2   �<  $   �<  /   �<  $   .=  +   S=  -   =  *   �=  *   �=  /   >  E   3>  @   y>     �>     �>     �>     
?  6   ?     C?     b?         6   Y   0   d       +   W   3   '   X          Z   ;       ~   �               j   $      L   p   
   <   T       n      t   	               u       1   w   2   f   D         B          )   M   �   |      S                        O   i   *   x          V   (   R       �   -   `   :       \   7          k   H   Q      c   N   C   m   s           _       A   I       r   >   �   5   K      &       �   E   �       �   !      ?                   y   8   o   ^       "      @   }   h          v       U       4       �   g      #             ]       ,       z   [      J          {              .         b           =      l   �   q               �      P   G                                 9   a   F   %       e       /   �      -b DAY:NIGHT	Screen brightness to apply (between 0.1 and 1.0)
  -c FILE	Load settings from specified configuration file
  -g R:G:B	Additional gamma correction to apply
  -l LAT:LON	Your current location
  -l PROVIDER	Select provider for automatic location updates
  		(Type `list' to see available providers)
  -m METHOD	Method to use to set color temperature
  		(Type `list' to see available methods)
  -o		One shot mode (do not continuously adjust color temperature)
  -O TEMP	One shot manual mode (set color temperature)
  -p		Print mode (only print parameters and exit)
  -x		Reset mode (remove adjustment from screen)
  -r		Disable temperature transitions
  -t DAY:NIGHT	Color temperature to set at daytime/night
   -h		Display this help message
  -v		Verbose output
  -V		Show program version
   card=N	Graphics card to apply adjustments to
  crtc=N	CRTC to apply adjustments to
   lat=N		Latitude
  lon=N		Longitude
   name=N	Name of Geoclue provider (or `default')
  path=N	Path of Geoclue provider (or `default')
   preserve={0,1}	Whether existing gamma should be preserved
 1 hour 2 hours 30 minutes <b>Status:</b> {} Adjust gamma ramps with the Windows GDI.
 Adjust gamma ramps with the X RANDR extension.
 Adjust gamma ramps with the X VidMode extension.
 Assignment outside section in config file.
 Autostart Available adjustment methods:
 Available location providers:
 Both values are expected to be floating point numbers,
negative values representing west / south, respectively.
 Brightness values must be between %.1f and %.1f.
 Brightness: %.2f
 Brightness: %.2f:%.2f
 CRTC %d does not exist.  CRTC %i lost, skipping
 CRTC must be a non-negative integer
 Can't set requirements for master
 Can't set requirements for master: %s
 Close Color temperature Color temperature adjustment Color temperature adjustment tool Color temperature: %uK
 Could not find a usable Geoclue provider.
 Could not get location: %s.
 DRM could not read gamma ramps on CRTC %i on
graphics card %i, ignoring device.
 Daytime Default values:

  Daytime temperature: %uK
  Night temperature: %uK
 Disabled Display device does not support gamma ramps.
 E Enabled Error obtaining location from CoreLocation: %s
 Failed to parse option `%s'.
 Failed to set %s option.
 Failed to start adjustment method %s.
 Failed to start provider %s.
 Gamma (%s): %.3f, %.3f, %.3f
 Gamma ramp size too small: %i
 Gamma value must be between %.1f and %.1f.
 High transition elevation cannot be lower than the low transition elevation.
 Info Initialization of %s failed.
 Latitude and longitude must be set.
 Latitude must be between %.1f and %.1f.
 Location Location: %.2f %s, %.2f %s
 Longitude must be between %.1f and %.1f.
 Malformed argument.
 Malformed assignment in config file.
 Malformed gamma argument.
 Malformed gamma setting.
 Malformed section header in config file.
 Malformed temperature argument.
 N Night No more location providers to try.
 No more methods to try.
 None Not authorized to obtain location from CoreLocation.
 Only CRTC 0 exists.
 Period Period: %s
 Period: %s (%.2f%% day)
 Please report bugs to <%s>
 Press ctrl-c to stop...
 Provider does not have a valid location available. Quit Redshift Redshift adjusts the color temperature of your screen according to your surroundings. This may help your eyes hurt less if you are working in front of the screen at night. Request for location was not authorized!
 S Screen %i could not be found.
 Set color temperature of display according to time of day.
 Solar elevation: %f
 Solar elevations: day above %.1f, night below %.1f
 Specify colon-separated options with `-m METHOD:OPTIONS'.
 Specify colon-separated options with`-l PROVIDER:OPTIONS'.
 Specify location manually.
 Started Geoclue provider `%s'.
 Status: %s
 Suspend for Temperature adjustment failed.
 Temperature must be between %uK and %uK.
 Temperature: %i
 Temperatures: %dK at day, %dK at night
 The Redshift information window overlaid with an example of the redness effect The color temperature is set according to the position of the sun. A different color temperature is set during night and daytime. During twilight and early morning, the color temperature transitions smoothly from night to daytime temperature to allow your eyes to slowly adapt. The neutral temperature is %uK. Using this value will not
change the color temperature of the display. Setting the
color temperature to a value higher than this results in
more blue light, and setting a lower value will result in
more red light.
 This program provides a status icon that allows the user to control Redshift. Transition Try -m %s:help' for more information.
 Try `-h' for more information.
 Try `-l %s:help' for more information.
 Try `-l PROVIDER:help' for help.
 Try `-m %s:help' for more information.
 Try `-m METHOD:help' for help.
 Try setting name and path to specify which to use.
 Trying location provider `%s'...
 Trying next method...
 Trying next provider...
 Unable to connect to GeoClue.
 Unable to get location from provider.
 Unable to obtain GeoClue Client: %s.
 Unable to obtain master client
 Unable to obtain master client: %s
 Unable to open device context.
 Unable to read system time.
 Unable to restore CRTC %i
 Unable to restore gamma ramps.
 Unable to save current gamma ramp.
 Unable to set distance threshold: %s.
 Unable to set gamma ramps.
 Unable to start GeoClue client: %s.
 Unknown adjustment method `%s'.
 Unknown configuration setting `%s'.
 Unknown location provider `%s'.
 Unknown method parameter: `%s'.
 Unsupported RANDR version (%u.%u)
 Usage: %s -l LAT:LON -t DAY:NIGHT [OPTIONS...]
 Use the location as discovered by a Geoclue provider.
 Use the location as discovered by the Corelocation provider.
 Using method `%s'.
 Using provider `%s'.
 Valid CRTCs are [0-%d].
 W Waiting for authorization to obtain location...
 X request failed: %s
 `%s' returned error %d
 Project-Id-Version: redshift
Report-Msgid-Bugs-To: https://github.com/jonls/redshift/issues
PO-Revision-Date: 2015-12-21 00:01+0000
Last-Translator: Francisca <Unknown>
Language-Team: Spanish <es@li.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Launchpad-Export-Date: 2016-01-02 22:24+0000
X-Generator: Launchpad (build 17865)
Language: es
   -b DAY:NIGHT	Brillo de la pantalla a aplicar (entre 0.1 y 1.0)
  -c FILE	Cargar ajustes desde un el archivo de configuración especificado
  -g R:G:B	Corrección gamma adicional a aplicar
  -l LAT:LON	Tu ubicación actual
  -l PROVIDER	Seleccionar proveedor para actualizaciones automáticas de ubicación
  		(Escribir `list' para ver los proveedores disponibles)
  -m METHOD	Método utilizado para determinar la temperatura de color
  		(Escribir `list' para ver los métodos disponibles)
  -o		Modo One shot (no ajustar la temperatura de color de manera continua)
  -O TEMP	Modo manual One shot (establecer la temperatura de color)
  -p		Modo impresión (solo imprimir los parámetros y salir)
  -x		Modo reset (remover los ajustes de la pantalla)
  -r		Desactivar transiciones de temperatura
  -t DAY:NIGHT	Temperatura de color para utilizar en el día/la noche
   -h		Mostrar este mensaje de ayuda
  -v		Salida detallada
  -V		Mostrar la versión del programa
   card=N 	 Tarjeta gráfica a la que aplicar los ajustes
crtc=N 	  CRTC al que aplicar los ajustes
   lat=N		Latitud
  lon=N		Longitud
   name=N	 Nombre del proveedor de Geoclue (o 'default')
path=N	 Path del proveedor de Geoclue (o 'default')
   preserve={0,1}	 Si el gamma existente debería preservarse
 1 hora 2  horas 30 minutos <b>Estado:</b> {} Ajustar los valores gamma con Windows GDI.
 Ajustar el valor gamma con la extensión X RANDR
 Ajustar los valores gamma con la extensión X VidMode
 Los datos asignados en archivo de configuración están fuera de sección.
 Inicio automático Métodos de ajuste disponibles:
 Proveedores de localización disponibles:
 Se espera que ambos valores sean números de punto flotante,
los valores negativos representan oeste / sur, respectivamente.
 Valores de brillo deben estar entre  %.1f y %.1f.
 Brillo: %.2f
 Brillo : %.2f:%.2f
 CRTC %d no existe.  CRTC %i perdidos, saltar
 CRTC debe ser un número entero no negativo
 No se puede establecer requisitos para maestro
 No se pueden aplicar los requerimientos para el master: %s
 Cerrar Temperatura de color Ajuste de la temperatura de color Herramienta para el ajuste de la temperatura de color Temperatura del color: %uK
 No se pudo encontrar un proveedor de Geoclue utilizable.
 No se pudo obtener la ubicación: %s.
 DRM no puede leer las rampas  gamma en CRTC %i
tarjeta gráfica %i,  ignorando dispositivo.
 Día Valores por defecto:

  Temperatura del día: %uK
  Temperatura de la noche: %uK
 Desactivadas El dispositivo de imagen no soporta rangos gamma.
 E Activado Error obteniendo ubicación desde CoreLocation: %s
 Falló el análisis de la opción «%s».
 Falló establecer la opción %s
 Falló el inicio del método de ajuste %s.
 Falló iniciar el proveedor %s.
 Gamma (%s): %.3f, %.3f, %.3f
 El tamaño del valor gamma es demasiado pequeño: %i
 El valor gamma debe estar entre %.1f y %.1f.
 Elevación alta de transición no puede ser inferior a elevación baja de transición.
 informacion Iniciación de %s falló.
 Latitud y longitud deben ser definidos.
 La latitud debe estar entre %.1f y %.1f.
 Ubicación Localización: %.2f %s, %.2f %s
 La longitud debe estar entre %.1f y %.1f.
 El formato del argumento es incorrecto.
 Los datos asignados en el archivo de configuración son incorrectos.
 Parámetro gamma no válido.
 Ajuste gamma incorrecto.
 El encabezado del archivo de configuración es incorrecto.
 Parámetro de temperatura no válido.
 N Noche No hay más proveedores de localización para probar.
 No hay más métodos para probar.
 Ninguno No autorizado a obtener ubicación desde CoreLocation.
 Solo existe CRTC 0.
 Período Periodo: %s
 Periodo: %s (%.2f%% dia)
 Por favor reporta fallos a <%s>
 Presione ctrl-c para detener...
 Proveedor no tiene una ubicación válida disponible. Salir Redshift Redshift ajusta la temperatura de color de tu pantalla, de acuerdo a tu alrededor. Esto puede ayudar a que tus ojos duelan menos si trabajas frente a tu pantalla por las noches. La solicitud de ubicación no fue autorizada!
 S No se encontró la pantalla %i.
 La temperatura de color es establecida según a la hora del día.
 Elevación solar: %f
 Elevaciones solares: días anteriores  %.1f, noche que figuran abajo  %.1f
 Señalar opciones separadas con "dos puntos" mediante `-m MÉTODO:OPCIONES'.
 Señalar opciones separadas con "dos puntos" mediante `-l PROVEEDOR:OPCIONES'.
 Especificar la localización manualmente.
 Se inició el proveedor de Geoclue «%s».
 Estado: %s
 Suspender para El ajuste de la temperatura falló.
 La temperatura debe estar entre %uK y %uK.
 Temperatura: %i
 Temperaturas: % dK de día, dK%  de noche
 La ventana de información de Redshift sobrepuesta con un ejemplo del efecto de enrojecimiento La temperatura de color se determina según la posición del sol. Temperaturas de color diferentes son establecidas para el día y la noche. Durante el atardecer y el amanecer, la temperatura de color transiciona suavemente, de temperatura nocturna a diurna, permitiendo a tus ojos adaptarse lentamente. La temperatura neutral es %uK. Usando este valor no
cambiará el color del monitor. Cambiando el valor de
la temperatura del color a un valor más alto, dará como
resultado un tono más azulado; cambiándolo a un valor
más bajo, el tono será más rojo.
 Este programa provee de un ícono de estado, que permite al usuario controlar Redshift. Transición Prueba -m %s:help' para más información.
 Tipee `-h' para más información.
 Prueba `-l %s:help' para más información.
 Prueba `-l PROVEEDOR:help' para ayuda.
 Prueba `-m %s:help' para más información.
 Prueba `-m MÉTODO:help' para ayuda.
 Pruebe colocar nombre y ruta para especificar qué usar
 Tratando proveedor ubicación `%s'...
 Probando el siguiente método...
 Probando el siguiente proveedor...
 No se pudo conectar a GeoClue.
 Incapaz de obtener localización desde el proveedor.
 No fue posible obtener un Cliente GeoClue: %s.
 No se puede obtener el cliente principal
 No se puede obtener el cliente principal: %s
 Incapaz de abrir del dispositivo de contexto.
 Imposible leer la hora del sistema.
 Incapaz de restituir CRTC %i
 Incapaz de restaurar el rango gamma.
 Incapaz de guardar el rango gamma actual.
 No se pudo determinar el umbral de distancia: %s.
 Incapaz de establecer rangos gamma.
 No se pudo inicializar el cliente GeoClue: %s.
 Método de ajuste desconocido `%s'.
 Ajuste de configuración desconocido `%s'.
 Proveedor de localización `%s' desconocido.
 Parámetro del método desconocido: `%s'.
 No se admite la versión de RANDR (%u.%u)
 Uso: %s -l LAT:LON -t DÍA:NOCHE [OPCIONES...]
 Usar la ubicación como sea descubierta por un proveedor de Geoclue.
 Usar la ubicación descubierta por el poveedor de Corelocation.
 Usando el método `%s'.
 Usando el proveedor `%s'.
 CRTCs válidos son [0-%d].
 O Esperando autorización para obtener la ubicación...
 Requerimiento de X falló: %s
 «%s» devolvió el error %d
 