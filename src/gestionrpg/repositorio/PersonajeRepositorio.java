/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package gestionrpg.repositorio;

import gestionrpg.modelo.Personaje;
import java.util.ArrayList;
import java.util.List;

public class PersonajeRepositorio {
    
    // 1. Lista estática que simula la base de datos
    private static List<Personaje> personajes = new ArrayList<>();

    // Personaje por defecto para pruebas
    static {
        personajes.add(new Personaje("Aragorn", "Guerrero", 5, 100));
    }

    // 2. Método para obtener todos los personajes
    public static List<Personaje> obtenerTodos() {
        return personajes;
    }

    // 3. Método para guardar un nuevo personaje
    public static void guardar(Personaje personaje) {
        personajes.add(personaje);
    }
}