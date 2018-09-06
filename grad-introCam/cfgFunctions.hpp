class GRAD_introCam {

    class flyrecord {
            file = grad-introCam\functions\flyrecord;

            class ah64;
            class heli;
            class heli2;
            class heli3;
            class heli4;
            class heli5;
            class mh6_2;
            class playRecord;
    };

    class client {
            file = grad-introCam\functions\client;

            class camAttached;
            class camCommands;
            class camFree;
            class camRotate;
            class marchStart;
            class play;
            class textEffects;
    };

    class server {
            file = grad-introCam\functions\server;

            class addShot;
            class init;
            class shotDefinitions { postInit = 1; };
    };

};
