FROM python:3.8.6-buster

COPY TaxiFareModel /TaxiFareModel
COPY api /api
COPY model.joblib /model.joblib
COPY requirements.txt /requirements.txt

RUN pip install --upgrade pip && pip install Cython && pip install numpy==1.19.2 && pip install scikit-learn==0.22
RUN pip install -r requirements.txt

CMD uvicorn api.fast:app --host 0.0.0.0 --port 8000
