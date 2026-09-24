/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Servicio;


import com.mycompany.gestionrpgmaven.Modelo.Personaje;

public class PersonajeServicio {

    public boolean validarPersonaje(Personaje personaje) {

        if (personaje == null) {
            return false;
        }

        if (personaje.getNombre() == null
                || personaje.getNombre().trim().isEmpty()) {
            return false;
        }

        if (personaje.getNivel() < 1
                || personaje.getNivel() > 100) {
            return false;
        }

        if (personaje.getClase() == null) {
            return false;
        }

        if (!personaje.getClase().equalsIgnoreCase("Guerrero")
                && !personaje.getClase().equalsIgnoreCase("Mago")
                && !personaje.getClase().equalsIgnoreCase("Arquero")) {
            return false;
        }

        return true;
    }
}