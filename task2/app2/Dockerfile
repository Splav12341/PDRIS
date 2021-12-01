
FROM python:3.9.0-buster
WORKDIR /app2/
COPY app2.py .
COPY requirements.txt .
RUN pip install -q -r requirements.txt && apt-get -q update
ENTRYPOINT ["python", "app2.py"]
