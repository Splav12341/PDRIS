FROM python:3.9.0-buster
WORKDIR .
COPY app1.py .
COPY requirements.txt .
RUN pip install -q -r requirements.txt && apt-get -q update
ENTRYPOINT ["python", "app1.py"]
