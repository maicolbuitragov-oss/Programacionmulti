package com.mycompany.gestionrpgmaven;

import com.mycompany.gestionrpgmaven.Controlador.PersonajeControlador;
import io.javalin.Javalin;

public class Main {

    public static void main(String[] args) {

        Javalin app = Javalin.create(config -> {
            config.staticFiles.add("/public");
        }).start(7077);

        app.get("/personajes", PersonajeControlador::obtenerPersonajes);

        app.post("/personajes", PersonajeControlador::crearPersonaje);

        System.out.println("Servidor iniciado en http://localhost:7077");
    }
}