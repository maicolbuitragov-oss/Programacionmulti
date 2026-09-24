package com.mycompany.gestionrpgmaven.Controlador;

import com.mycompany.gestionrpgmaven.Modelo.Personaje;
import com.mycompany.gestionrpgmaven.Repositorio.PersonajeRepositorio;
import Servicio.PersonajeServicio;
import io.javalin.http.Context;

public class PersonajeControlador {

    public static void obtenerPersonajes(Context ctx) {
        ctx.json(PersonajeRepositorio.obtenerTodos());
    }

    public static void crearPersonaje(Context ctx) {

        // Mensaje para comprobar que la petición está llegando
        System.out.println("LLEGO AL METODO CREAR PERSONAJE");

        // Convertir el JSON recibido en un objeto Personaje
        Personaje personaje = ctx.bodyAsClass(Personaje.class);

        // Crear el servicio
        PersonajeServicio servicio = new PersonajeServicio();

        // Validar el personaje
        if (!servicio.validarPersonaje(personaje)) {
            ctx.status(400).result("Datos del personaje no válidos");
            return;
        }

        // Guardar el personaje si es válido
        PersonajeRepositorio.guardar(personaje);

        // Responder que fue creado correctamente
        ctx.status(201).json(personaje);
    }
}