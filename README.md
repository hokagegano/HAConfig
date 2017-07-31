Ma config Home Assistant
=============================================================

![Screenshot](https://raw.githubusercontent.com/hokagegano/HAConfig/master/Hagit.png)

Les composants de la configuration :
- Media player : SqueezeBox, Télé Panasonic, Nvidia Shield ChromeCast, Nvidia Shield Plex, MPD
- Lights : Hue
- Google Calendar
- Camera : PS3Eye, Kinect et Webcam Nexus 7
- Presence Detection : Nut, Xiaomi MiBand2, Happy Bubbles
- RFXCom433E
- Devices 433mhz : 3 sondes Température/Humidité, 2 détecteurs de mouvement
- Devices ZigBee : Hue motion detector (mouvement, temperature, humidité)
- Mise en place de Telegram

Automations:
- Le reveil matin avec allumage des lumières progressif
- L'annonce du matin (rdv, conditions de surf, meteo, traffic sur la route)
- Extinction des lumières apres que la derniere personne quitte le logement
- Allumage des lumières quand le soleil se couche.
- Allumage des lumières une fois le soleil couché si quelqu'un rentre tard.
- Envoi des videos sur l'intrusion domicile (alarme)
- Allumage automatique des wc
- Allumage automatique de la salle de bain
- Allumage automatique de la chambre quand je monte à l'etage et que la télé est eteinte (à partir d'une certaine heure).
- Changement de couleur de toutes le lampes de couleurs HUE de manière synchronisée (mode soirée) toutes les minutes.
- Si le calendrier a un evenement RTT, la lumière ne s'allume pas le matin.
- La modification de l'heure du réveil Android a pour incidence la mise à jour du reveil sous Home Assistant (via Tasker).
- Mise en place d'un mode conversationnel avec telegram : envoi des conditions de surf en temps réel, et obtention des temperatures.
