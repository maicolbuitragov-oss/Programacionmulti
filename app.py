from flask import Flask, request, render_template
from servicio.personaje_servicio import validar_personaje

app = Flask(__name__)

personajes = []


@app.route("/personajes", methods=["GET"])
def listar_personajes():
    return render_template("personajes.html", personajes=personajes)


@app.route("/personajes", methods=["POST"])
def crear_personaje():
    datos = request.get_json()

    if not validar_personaje(datos):
        return {"mensaje": "Datos del personaje no válidos"}, 400

    personajes.append(datos)

    return {"mensaje": "Personaje creado correctamente", "personaje": datos}, 201


if __name__ == "__main__":
    app.run(debug=True)