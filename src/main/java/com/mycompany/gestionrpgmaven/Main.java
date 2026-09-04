/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.gestionrpgmaven;

import com.mycompany.gestionrpgmaven.Controlador.PersonajeControlador;
import io.javalin.Javalin;

public class Main {

    public static void main(String[] args) {

        Javalin app = Javalin.create().start(7070);

        app.get("/personajes", PersonajeControlador::obtenerPersonajes);

        app.post("/personajes", PersonajeControlador::crearPersonaje);

        System.out.println("Servidor iniciado en http://localhost:7070");
    }
}