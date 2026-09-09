from flask import Flask, request, jsonify

app = Flask(__name__)

personajes = []


@app.route("/personajes", methods=["GET"])
def listar_personajes():
    return jsonify([
        {
            "nombre": personaje["nombre"],
            "nivel": personaje["nivel"],
            "clase": personaje["clase"]
        }
        for personaje in personajes
    ])


@app.route("/personajes", methods=["POST"])
def crear_personaje():
    datos = request.get_json()

    personaje = {
        "nombre": datos["nombre"],
        "nivel": datos["nivel"],
        "clase": datos["clase"]
    }

    personajes.append(personaje)

    return jsonify(personaje), 201


if __name__ == "__main__":
    app.run(debug=True)