from models.personaje import Personaje


personajes = [
    Personaje("Aragorn", "Guerrero", 5, 100)
]


def obtener_todos():
    return personajes


def guardar(personaje):
    personajes.append(personaje)