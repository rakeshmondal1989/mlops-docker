from fastapi import FastAPI
import joblib
import numpy


model = joblib.load("model.joblib")
classname = numpy.array(['Setosa','Versicolor','Virginica'])

app = FastAPI()

@app.get('/')
def welcome():
    return {"message":"Iris Classification"}

@app.post('/predict')
def predict(data:dict):
    features = numpy.array(data['features']).reshape(1,-1)
    prediction = model.predict(features)
    predicted_classname = prediction[0]

    return {"Predicted Class":predicted_classname}



