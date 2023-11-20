import logging
from flask import Flask, request, jsonify
import firebase_admin
from firebase_admin import credentials
from firebase_admin import db
from datetime import datetime

app = Flask(__name__)

logging.basicConfig(level=logging.INFO)

cred = credentials.Certificate(
    "C:/back sgc/gvpneus-d819b-firebase-adminsdk-ticn0-b08252d37a.json"
)
firebase_admin.initialize_app(
    cred, {"databaseURL": "https://gvpneus-d819b-default-rtdb.firebaseio.com/"}
)


@app.route("/login", methods=["POST"])
def save_login_data():
    data = request.json
    username = data.get("username")
    password = data.get("password")

    if username and password:
        try:
            ref = db.reference("/LoginData")
            new_login_ref = ref.push()
            new_login_ref.set({"Username": username, "Password": password})
            logging.info(f"Login data saved successfully for user: {username}")
            return jsonify({"message": "Login data saved successfully."}), 201
        except Exception as e:
            logging.error(f"Error inserting login data: {str(e)}")
            return jsonify({"error": "Error inserting login data."}), 500
    else:
        logging.error("Provide a valid username and password.")
        return (
            jsonify({"error": "Provide a valid username and password."}),
            400,
        )


@app.route("/login/<username>", methods=["GET"])
def get_login_data(username):
    try:
        ref = db.reference("/LoginData")
        query = (
            ref.order_by_child("Username").equal_to(username).limit_to_first(1).get()
        )

        if query:
            login_data = list(query.values())[0]
            logging.info(f"Login data found for user: {username}")
            return (
                jsonify({"username": username, "password": login_data["Password"]}),
                200,
            )
        else:
            logging.error(f"User not found: {username}")
            return jsonify({"error": "User not found."}), 404
    except Exception as e:
        logging.error(f"Error fetching login data: {str(e)}")
        return jsonify({"error": "Error fetching login data."}), 500


@app.route("/veiculos_entrada", methods=["POST"])
def save_vehicle_data():
    data = request.json
    placa = data.get("placa")
    modelo = data.get("modelo")
    data_entrada = datetime.strptime(data.get("data_entrada"), "%d/%m/%Y").strftime(
        "%Y-%m-%d"
    )
    horario_entrada = data.get("horario_entrada")
    documento_motorista = data.get("documento_motorista")
    nome_motorista = data.get("nome_motorista")
    campo_int = data.get("campo_int", 1)

    if (
        placa
        and modelo
        and data_entrada
        and horario_entrada
        and documento_motorista
        and nome_motorista
    ):
        try:
            ref = db.reference("/Veiculos_entrada")
            new_vehicle_ref = ref.push()
            new_vehicle_ref.set(
                {
                    "Placa": placa,
                    "Modelo": modelo,
                    "DataEntrada": data_entrada,
                    "HorarioEntrada": horario_entrada,
                    "DocumentoMotorista": documento_motorista,
                    "NomeMotorista": nome_motorista,
                    "CampoInt": campo_int,
                }
            )
            logging.info("Vehicle entry data saved successfully.")
            return (
                jsonify({"message": "Vehicle entry data saved successfully."}),
                201,
            )
        except Exception as e:
            logging.error(f"Error inserting vehicle entry data: {str(e)}")
            return (
                jsonify({"error": "Error inserting vehicle entry data."}),
                500,
            )
    else:
        logging.error("Provide all mandatory fields.")
        return jsonify({"error": "Provide all mandatory fields."}), 400


@app.route("/Veiculos_entrada/<placa>/<int:campo_int>", methods=["GET"])
def get_vehicle_data_by_placa_entrada(placa, campo_int):
    try:
        ref = db.reference("/Veiculos_entrada")
        data = ref.order_by_child("Placa").equal_to(placa).get()

        # Filter results by campo_int
        filtered_data = {
            key: value
            for key, value in data.items()
            if value.get("CampoInt") == campo_int
        }

        if filtered_data:
            return jsonify(filtered_data), 200
        else:
            logging.error(
                f"Vehicle entry not found with plate {placa} and CampoInt {campo_int}"
            )
            return jsonify({"error": "Vehicle entry not found."}), 404
    except Exception as e:
        logging.error(f"Error fetching vehicle entry data: {str(e)}")
        return jsonify({"error": "Error fetching vehicle entry data."}), 500


@app.route("/veiculos_saida", methods=["POST"])
def save_vehicle_data_saida():
    data = request.json
    placa = data.get("placa")
    modelo = data.get("modelo")
    data_entrada = datetime.strptime(data.get("data_entrada"), "%d/%m/%Y").strftime(
        "%Y-%m-%d"
    )
    horario_entrada = data.get("horario_entrada")
    documento_motorista = data.get("documento_motorista")
    nome_motorista = data.get("nome_motorista")
    data_saida = datetime.strptime(data.get("data_saida"), "%d/%m/%Y").strftime(
        "%Y-%m-%d"
    )
    horario_saida = data.get("horario_saida")

    if (
        placa
        and modelo
        and data_entrada
        and horario_entrada
        and documento_motorista
        and nome_motorista
        and data_saida
        and horario_saida
    ):
        try:
            ref = db.reference("/Veiculos_saida")
            new_vehicle_ref = ref.push()
            new_vehicle_ref.set(
                {
                    "Placa": placa,
                    "Modelo": modelo,
                    "DataEntrada": data_entrada,
                    "HorarioEntrada": horario_entrada,
                    "DocumentoMotorista": documento_motorista,
                    "NomeMotorista": nome_motorista,
                    "DataSaida": data_saida,
                    "HorarioSaida": horario_saida,
                }
            )
            logging.info("Vehicle exit data saved successfully.")
            return (
                jsonify({"message": "Vehicle exit data saved successfully."}),
                201,
            )
        except Exception as e:
            logging.error(f"Error inserting vehicle exit data: {str(e)}")
            return (
                jsonify({"error": "Error inserting vehicle exit data."}),
                500,
            )
    else:
        logging.error("Provide all mandatory fields.")
        return jsonify({"error": "Provide all mandatory fields."}), 400


@app.route("/Veiculos_saida/<placa>", methods=["GET"])
def get_vehicle_data_by_placa_saida(placa):
    try:
        ref = db.reference("/Veiculos_saida")
        query = ref.order_by_child("Placa").equal_to(placa).limit_to_first(1).get()

        if query:
            vehicle_data = list(query.values())[0]
            logging.info(f"Vehicle exit data found for plate: {placa}")
            return jsonify(vehicle_data), 200
        else:
            logging.error(f"Vehicle exit not found with plate: {placa}")
            return jsonify({"error": "Vehicle exit not found."}), 404
    except Exception as e:
        logging.error(f"Error fetching vehicle exit data: {str(e)}")
        return jsonify({"error": "Error fetching vehicle exit data."}), 500


@app.route("/veiculos_entrada/<placa>", methods=["PUT"])
def update_vehicle_campoint(placa):
    try:
        ref = db.reference("/Veiculos_entrada")
        data = ref.order_by_child("Placa").equal_to(placa).get()

        vehicle_id = None
        for key, value in data.items():
            if value.get("CampoInt") == 1:
                vehicle_id = key
                break

        if vehicle_id:
            ref.child(vehicle_id).update({"CampoInt": 0})
            logging.info(f"CampoInt updated for vehicle with plate {placa}")
            return (
                jsonify(
                    {"message": f"CampoInt updated for vehicle with plate {placa}"}
                ),
                200,
            )
        else:
            logging.error(
                f"No vehicle found with plate {placa} and CampoInt equal to 1"
            )
            return jsonify({"error": "No vehicle found with specified conditions"}), 404
    except Exception as e:
        logging.error(f"Error updating CampoInt: {str(e)}")
        return jsonify({"error": "Error updating CampoInt"}), 500

    from datetime import datetime


@app.route("/veiculos_saida/data_entrada/<data_entrada>", methods=["GET"])
def get_vehicle_data_by_data_entrada(data_entrada):
    try:
        ref = db.reference("/Veiculos_saida")
        query = ref.order_by_child("DataEntrada").equal_to(data_entrada).get()

        if query:
            return jsonify(query), 200
        else:
            logging.error(f"No vehicles found with entry date: {data_entrada}")
            return (
                jsonify({"error": "No vehicles found with specified entry date"}),
                404,
            )
    except Exception as e:
        logging.error(f"Error fetching vehicle exit data by entry date: {str(e)}")
        return (
            jsonify({"error": "Error fetching vehicle exit data by entry date."}),
            500,
        )


if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
