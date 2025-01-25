FROM python:3.11
WORKDIR /CODE
COPY ./requirement.txt /CODE/requirement.txt
RUN pip install -r /CODE/requirement.txt


#COPY ./train.py /CODE/train.py
COPY ./iris.csv /CODE/iris.csv
COPY ./model.joblib /CODE/model.joblib
COPY ./app.py /CODE/app.py

COPY ./app.py /CODE/app.py

EXPOSE 8000
CMD ["uvicorn","app:app","--host","0.0.0.0","--port","8000"]
