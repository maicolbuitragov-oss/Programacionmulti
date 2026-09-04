/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.gestionrpgmaven.Controlador;

import com.mycompany.gestionrpgmaven.Modelo.Personaje;
import com.mycompany.gestionrpgmaven.Repositorio.PersonajeRepositorio;
import io.javalin.http.Context;

public class PersonajeControlador {

    public static void obtenerPersonajes(Context ctx) {
        ctx.json(PersonajeRepositorio.obtenerTodos());
    }

    public static void crearPersonaje(Context ctx) {
        Personaje personaje = ctx.bodyAsClass(Personaje.class);

        PersonajeRepositorio.guardar(personaje);

        ctx.status(201).json(personaje);
    }
}