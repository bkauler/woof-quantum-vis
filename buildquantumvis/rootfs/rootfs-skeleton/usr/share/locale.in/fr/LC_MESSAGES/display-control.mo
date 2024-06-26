��    6      �  I   |      �  !  �  	   �     �  
   �     �     �  .   �     ,  #   <     `     w  -   �  %   �     �     �     �     �       &     &   @  .   g  1   �     �     �     �     �  %     %   ,     R     `     z     �     �     �     �     �     �           6     =     F     N     T     a     g  
   n     y     �     �     �     �     �     �    �  '  �     �  (        ,     8     ?  I   F     �  *   �     �     �  E     2   I     |     �     �  +   �     �  %   �  %      E   &  O   l     �     �  .   �  7     0   @  0   q     �  0   �  -   �  @        T  %   h     �  *   �  .   �  -   �          $     1     :     @     O     X     h  	   |     �     �     �     �     �     �     3              !   )          $                 &   4           (                           -   /      1      6             5         *              #   ,   '       
   +   	          "                                     0         %             .      2       <b><span size='x-large'>Display Control</span></b>

<b>Purpose</b>
The Display Control interface calls either xrandr or the optional sct utility to adjust the screen color temperature and brightness for optimal display illumination. A toggle button is available to switch between the xrandr and sct interfaces, each providing unique advantages for improved screen viewing.

Importantly, xrandr and sct do not change the actual backlight intensity, rather the observed screen appearance represents software modulation of available light.

<b>Tint and Brightness</b>
This application is particularly useful at night when bright screen illumination may be visually stressful and excessive blue light may be disruptive to sleep-wake cycles. In this scenario, lower color temperatures (below 4500K) and lesser brightness levels will provide viewing comfort. On the other hand, higher color temperatures (above 6500K) and greater brightness values may be helpful for gaming or for improved screen viewing when sunlight intensity is high.

The color temperature and brightness values are accessible in hscale slider widgets which are easily navigated. If you prefer single-click profiles to quickly adjust the screen tint and brightness please go to the Presets Option where you will find multiple preconfigured viewing profiles plus a custom option for your favorite profile.

<b>Backlight</b>
Alternatively, the backlight option may be useful to modulate backlight intensity of the primary screen through /sys/class/backlight, but this function is not supported by all hardware interfaces. For those with compatible hardware, the actual backlight intensity changes but the color temperature (screen tint) is not altered.

Display Control will hide this option if /sys/class/backlight is missing or empty. The default script (brightness-set) which mediates backlight brightness control is courtesy of James Budiono of Fatdog Linux. If you require an alternate mediator of backlight control, the optional and versatile brightnessctl utility will integrate seamlessly with Display Control. Backlight Blank screen immediately Brightness Close Delay Disable screen blanking 
 and power save mode. Display Control Display Control is already active ! Display identification Display settings Enable screen blanking 
 and power save mode. Hardware backlight intensity (1-100%) Help License Presets Processing, please wait... Quick _blank Relative screen illumination (30-100%) Relative screen illumination (30-130%) Rescan screens and reset default configuration Save current tint and brightness to custom preset Screen Screen Saver Screen Saver GUI Screen Saver GUI enabled Screen color temperature (1000-9500K) Screen color temperature (2500-9500K) Screen status Set screen blanking delay Set screen tint and brightness Set screensaver delay (timeout) Standard GUI Standard GUI enabled Tint Tint and brightness presets Toggle backlight control Toggle xrandr and sct interfaces Uptime _Disable _Enable _Help _Preferences _Quit _Reset _Set delay custom daylight gaming night-1 night-2 reading twilight Project-Id-Version: PACKAGE VERSION
Report-Msgid-Bugs-To: 
PO-Revision-Date: YEAR-MO-DA HO:MI+ZONE
Last-Translator: Esmourguit <jj@moulinier.net>
Language-Team: fr <LL@li.org>
Language: fr
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
 <b><span size='x-large'>Contrôle d'affichage</span></b>

<b>Purpose</b>
The Display Control interface calls either xrandr or the optional sct utility to adjust the screen color temperature and brightness for optimal display illumination. A toggle button is available to switch between the xrandr and sct interfaces, each providing unique advantages for improved screen viewing.

Importantly, xrandr and sct do not change the actual backlight intensity, rather the observed screen appearance represents software modulation of available light.

<b>Tint and Brightness</b>
This application is particularly useful at night when bright screen illumination may be visually stressful and excessive blue light may be disruptive to sleep-wake cycles. In this scenario, lower color temperatures (below 4500K) and lesser brightness levels will provide viewing comfort. On the other hand, higher color temperatures (above 6500K) and greater brightness values may be helpful for gaming or for improved screen viewing when sunlight intensity is high.

The color temperature and brightness values are accessible in hscale slider widgets which are easily navigated. If you prefer single-click profiles to quickly adjust the screen tint and brightness please go to the Presets Option where you will find multiple preconfigured viewing profiles plus a custom option for your favorite profile.

<b>Backlight</b>
Alternatively, the backlight option may be useful to modulate backlight intensity of the primary screen through /sys/class/backlight, but this function is not supported by all hardware interfaces. For those with compatible hardware, the actual backlight intensity changes but the color temperature (screen tint) is not altered.

Display Control will hide this option if /sys/class/backlight is missing or empty. The default script (brightness-set) which mediates backlight brightness control is courtesy of James Budiono of Fatdog Linux. If you require an alternate mediator of backlight control, the optional and versatile brightnessctl utility will integrate seamlessly with Display Control. Rétro-éclairage Mettre en veille l'écran immédiatement Luminosité Fermer Retard Désactiver les modes de mise en veille 
  et d'économie d'alimentation. Afficher le contrôle Le contrôle d'affichage est déjà actif! Afficher l'identification Paramètres d'affichage Activer les modes de mise en veille 
  et d'économie d'alimentation. Intensité du rétro-éclairage matériel (1-100%) Aide Licence Préréglages Traitement en cours, veuillez patienter ... _Mise en veille rapide Éclairage d'écran relatif (30-100%) Éclairage d'écran relatif (30-130%) Rechercher les écrans et réinitialiser la configuration par défaut Enregistrer le préréglage personnalisé de la teinte et la luminosité actuel Écran Économiseur d'écran Interface graphique de l'économiseur d'écran Interface graphique de l'économiseur d'écran activée Température de couleur de l'écran (1000-9500K) Température de couleur de l'écran (2500-9500K) État de l'écran Définir le délai de mise en veille de l'écran Définir la teinte d'écran et la luminosité Définir le délai de l'économiseur d'écran (délai d'attente) Interface graphique Interface graphique standard activée Nuance Préréglages de teintes et de luminosité Basculer vers le contrôle du rétroéclairage Basculer vers les interfaces de xrandr et sct Durée _Désactiver Activ_er _Aide _Préférences _Quitter _Réinitialiser Défini_r le délai personnel lumière du jour jeu nuit 1 nuit 2 lecture crépuscule 