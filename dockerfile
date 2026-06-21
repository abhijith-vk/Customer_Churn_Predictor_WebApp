FROM python:3.12-slim

WORKDIR /app

COPY requirements.txt .

RUN pip install --upgrade pip \
    && pip install -r requirements.txt \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

COPY . .

COPY src/serving/model /app/src/serving/model

COPY src/serving/model/d33bfa2cfe404bb19eca4337ee179eca/artifacts/model /app/model
COPY src/serving/model/d33bfa2cfe404bb19eca4337ee179eca/artifacts/feature_columns.txt /app/model/feature_columns.txt
COPY src/serving/model/d33bfa2cfe404bb19eca4337ee179eca/artifacts/preprocessing.pkl /app/model/preprocessing.pkl

ENV PYTHONUNBUFFERED=1 \ 
    PYTHONPATH=/app/src

EXPOSE 8000

CMD ["python", "-m", "uvicorn", "src.app.main:app", "--host", "0.0.0.0", "--port", "8000"]