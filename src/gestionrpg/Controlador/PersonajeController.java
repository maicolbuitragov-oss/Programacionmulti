/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package gestionrpg.Controlador;


import gestionrpg.modelo.Personaje;
import gestionrpg.repositorio.PersonajeRepositorio;
import io.javalin.Javalin;

public class PersonajeController {

    public static void configurarRutas(Javalin app) {

        // GET /personajes
        app.get("/personajes", ctx -> {
            ctx.json(PersonajeRepositorio.obtenerTodos());
        });

        // POST /personajes
        app.post("/personajes", ctx -> {
            Personaje personaje = ctx.bodyAsClass(Personaje.class);

            PersonajeRepositorio.guardar(personaje);

            ctx.status(201).json(personaje);
        });
    }
}