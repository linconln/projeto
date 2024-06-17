FROM python:3.12-alpine

RUN mkdir /app
WORKDIR /app
ADD kubernetes/app/* /app
RUN pip install -r requirements.txt
#CMD ["python", "consumer.py"]
