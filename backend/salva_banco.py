import logging
from flask import Flask, request, jsonify
import firebase_admin
from firebase_admin import credentials
from firebase_admin import db

app = Flask(__name__)

logging.basicConfig(level=logging.INFO)

cred = credentials.Certificate(
    "C:/back sgc/gvpneus-d819b-firebase-adminsdk-ticn0-b08252d37a.json"
)
firebase_admin.initialize_app(
    cred, {"databaseURL": "https://gvpneus-d819b-default-rtdb.firebaseio.com/"}
)


# Endpoint para salvar dados de login
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
            logging.info(
                f"Dados de login salvos com sucesso para o usuário: {username}"
            )
            return jsonify({"message": "Dados de login salvos com sucesso."}), 201
        except Exception as e:
            logging.error(f"Erro ao inserir dados de login: {str(e)}")
            return jsonify({"error": "Erro ao inserir dados de login."}), 500
    else:
        logging.error("Informe um nome de usuário e uma senha válidos.")
        return (
            jsonify({"error": "Informe um nome de usuário e uma senha válidos."}),
            400,
        )


# Endpoint para obter dados de login
@app.route("/login/<username>", methods=["GET"])
def get_login_data(username):
    try:
        ref = db.reference("/LoginData")
        query = (
            ref.order_by_child("Username").equal_to(username).limit_to_first(1).get()
        )

        if query:
            login_data = list(query.values())[0]
            logging.info(f"Dados de login encontrados para o usuário: {username}")
            return (
                jsonify({"username": username, "password": login_data["Password"]}),
                200,
            )
        else:
            logging.error(f"Usuário não encontrado: {username}")
            return jsonify({"error": "Usuário não encontrado."}), 404
    except Exception as e:
        logging.error(f"Erro ao buscar dados de login: {str(e)}")
        return jsonify({"error": "Erro ao buscar dados de login."}), 500


# Endpoint para salvar dados de veículos Entrada
@app.route("/veiculos_entrada", methods=["POST"])
def save_vehicle_data():
    data = request.json
    placa = data.get("placa")
    modelo = data.get("modelo")
    data_entrada = data.get("data_entrada")
    horario_entrada = data.get("horario_entrada")
    documento_motorista = data.get("documento_motorista")
    nome_motorista = data.get("nome_motorista")
    # documento_ajudante = data.get("documento_ajudante")
    # nome_ajudante = data.get("nome_ajudante")

    if (
        placa
        and modelo
        and data_entrada
        and horario_entrada
        and documento_motorista
        and nome_motorista
        # and documento_ajudante
        # and nome_ajudante
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
                    # "DocumentoAjudante": documento_ajudante,
                    # "NomeAjudante": nome_ajudante,
                }
            )
            logging.info("Dados do veículo salvos com sucesso.")
            return jsonify({"message": "Dados do veículo salvos com sucesso."}), 201
        except Exception as e:
            logging.error(f"Erro ao inserir dados do veículo: {str(e)}")
            return jsonify({"error": "Erro ao inserir dados do veículo."}), 500
    else:
        logging.error("Informe todos os campos obrigatórios.")
        return jsonify({"error": "Informe todos os campos obrigatórios."}), 400


# Endpoint para obter dados de veículos pelo modelo Entrada
@app.route("/Veiculos_entrada/<modelo>", methods=["GET"])
def get_vehicle_data_by_model(modelo):
    try:
        ref = db.reference("/Veiculos_entrada")
        query = ref.order_by_child("Modelo").equal_to(modelo).limit_to_first(1).get()

        if query:
            vehicle_data = list(query.values())[0]
            logging.info(f"Dados do veículo encontrados para o modelo: {modelo}")
            return jsonify(vehicle_data), 200
        else:
            logging.error(f"Veículo não encontrado com o modelo: {modelo}")
            return jsonify({"error": "Veículo não encontrado."}), 404
    except Exception as e:
        logging.error(f"Erro ao buscar dados do veículo: {str(e)}")
        return jsonify({"error": "Erro ao buscar dados do veículo."}), 500


# Endpoint para salvar dados de veículos Saída
@app.route("/veiculos_saida", methods=["POST"])
def save_vehicle_data_saida():
    data = request.json
    placa = data.get("placa")
    modelo = data.get("modelo")
    data_entrada = data.get("data_entrada")
    horario_entrada = data.get("horario_entrada")
    horario_saida = data.get("horario_saida")
    documento_motorista = data.get("documento_motorista")
    nome_motorista = data.get("nome_motorista")
    # documento_ajudante = data.get("documento_ajudante")
    # nome_ajudante = data.get("nome_ajudante")
    data_saida = data.get("data_saida")
    horario_saida = data.get("horario_saida")

    if (
        placa
        and modelo
        and data_entrada
        and horario_entrada
        and documento_motorista
        and nome_motorista
        # and documento_ajudante
        # and nome_ajudante
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
                    # "DocumentoAjudante": documento_ajudante,
                    # "NomeAjudante": nome_ajudante,
                    "DataSaida": data_saida,
                    "HorarioSaida": horario_saida,
                }
            )
            logging.info("Dados do veículo salvos com sucesso.")
            return jsonify({"message": "Dados do veículo salvos com sucesso."}), 201
        except Exception as e:
            logging.error(f"Erro ao inserir dados do veículo: {str(e)}")
            return jsonify({"error": "Erro ao inserir dados do veículo."}), 500
    else:
        logging.error("Informe todos os campos obrigatórios.")
        return jsonify({"error": "Informe todos os campos obrigatórios."}), 400


# Endpoint para obter dados de veículos pelo modelo Saída
@app.route("/Veiculos_saida/<modelo>", methods=["GET"])
def get_vehicle_data_by_model_saida(modelo):
    try:
        ref = db.reference("/Veiculos_saida")  # Mudou para Veiculos_saida
        query = ref.order_by_child("Modelo").equal_to(modelo).limit_to_first(1).get()

        if query:
            vehicle_data = list(query.values())[0]
            logging.info(f"Dados do veículo encontrados para o modelo: {modelo}")
            return jsonify(vehicle_data), 200
        else:
            logging.error(f"Veículo não encontrado com o modelo: {modelo}")
            return jsonify({"error": "Veículo não encontrado."}), 404
    except Exception as e:
        logging.error(f"Erro ao buscar dados do veículo: {str(e)}")
        return jsonify({"error": "Erro ao buscar dados do veículo."}), 500


if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
