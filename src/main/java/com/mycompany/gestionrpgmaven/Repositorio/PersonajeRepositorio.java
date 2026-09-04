
package com.mycompany.gestionrpgmaven.Repositorio;

import com.mycompany.gestionrpgmaven.Modelo.Personaje;
import java.util.ArrayList;
import java.util.List;

public class PersonajeRepositorio {

    private static List<Personaje> personajes = new ArrayList<>();

    static {
        personajes.add(
            new Personaje("Aragorn", "Guerrero", 10, 100)
        );
    }

    public static List<Personaje> obtenerTodos() {
        return personajes;
    }

    public static void guardar(Personaje personaje) {
        personajes.add(personaje);
    }
}