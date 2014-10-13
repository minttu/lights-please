Lights-Please
=============

Light control UI in AngularJS and CoffeeScript. [Backend](https://github.com/JuhaniImberg/lights-please-backend)

Idea
----

Web UI for the living rooms DMX controlled LEDs. To be used on everything from a PC to a smart phone. All devices connected should have synchronized values via WebSockets. Should have a few different views. The main one being a very simple screen with a few switches, like you would have on your wall for regular lights. Also a overview of the room, where you can tap/click lights and groups of lights to turn them on or off. Possibly a more nerdy view also with sliders and configurable things. The current state of lighting should be savable and restorable as "mood" light settings. Should support RGB LEDs aswell as regular ones. The DMX will be handled with Open Lighting Architecture and the API it provides. The backend will translate the WebSocket to those API calls and save the state.

A bit like this:

![Main Page](https://raw.githubusercontent.com/JuhaniImberg/lights-please/master/mockup/Main_Page.png)
![Map Page](https://raw.githubusercontent.com/JuhaniImberg/lights-please/master/mockup/Map_Page.png)
![Details Page](https://raw.githubusercontent.com/JuhaniImberg/lights-please/master/mockup/Details_Page.png)
![Presets Page](https://raw.githubusercontent.com/JuhaniImberg/lights-please/master/mockup/Presets_Page.png)
