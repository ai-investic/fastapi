import joblib
from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware

app = FastAPI()
model = joblib.load('model/gbm.pkl')

app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)


@app.get("/predict")
def predict(
    num_street: float,
    zip_code: float,
    dep_code: float,
    type_local_code: float,
    nb_rooms: float,
    nb_lots: float,
    actual_floor_area: float,
    ground_area: float,
) -> dict:
    return {
        "prediction": float(model.predict([[
            num_street,
            zip_code,
            dep_code,
            type_local_code,
            nb_rooms,
            nb_lots,
            actual_floor_area,
            ground_area,
        ]])[0])
    }
