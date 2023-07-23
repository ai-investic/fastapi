FROM python:3.11

WORKDIR /fastapi

COPY . .

RUN pip install --upgrade pip && \
    pip install \
    	sklearn \
      joblib \
      fastapi \
    	uvicorn

EXPOSE 8000

ENTRYPOINT ["/bin/bash", "-c", "uvicorn src.main:app --host 0.0.0.0 --port 8000"]
