from flask import Flask, request, render_template

app = Flask(__name__)

personajes = []


@app.route("/personajes", methods=["GET"])
def listar_personajes():
    return render_template("personajes.html", personajes=personajes)


@app.route("/personajes", methods=["POST"])
def crear_personaje():
    nombre = request.form["nombre"]
    clase = request.form["clase"]
    nivel = request.form["nivel"]
    vida = request.form["vida"]

    personaje = {
        "nombre": nombre,
        "clase": clase,
        "nivel": nivel,
        "vida": vida
    }

    personajes.append(personaje)

    return render_template("personajes.html", personajes=personajes)


if __name__ == "__main__":
    app.run(debug=True)