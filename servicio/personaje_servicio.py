def validar_personaje(datos_personaje):
    nombre = datos_personaje.get("nombre")
    nivel = datos_personaje.get("nivel")
    clase = datos_personaje.get("clase")

    # Regla 1: el nombre no puede estar vacío
    if nombre is None or not isinstance(nombre, str) or nombre.strip() == "":
        return False

    # Regla 2: el nivel debe estar entre 1 y 100
    if nivel is None or not isinstance(nivel, int) or nivel < 1 or nivel > 100:
        return False

    # Regla 3: la clase debe ser Guerrero, Mago o Arquero
    clases_validas = ["guerrero", "mago", "arquero"]

    if clase is None or not isinstance(clase, str):
        return False

    if clase.strip().lower() not in clases_validas:
        return False

    return True