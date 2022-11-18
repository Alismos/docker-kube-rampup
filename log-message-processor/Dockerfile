FROM python:3.6-slim as build

RUN apt-get update
RUN apt-get install -y --no-install-recommends \
build-essential gcc

# Create app directory

#WORKDIR /usr/log-processor
RUN python -m venv /opt/venv
ENV PATH="/opt/venv/bin:$PATH"

COPY requirements.txt .
RUN pip3 install -r requirements.txt

FROM python:3.6-slim

ARG REDIS_HOST
ARG REDIS_PORT
ARG REDIS_CHANNEL

ENV REDIS_HOST=$REDIS_HOST
ENV REDIS_PORT=$REDIS_PORT
ENV REDIS_CHANNEL=$REDIS_CHANNEL

COPY --from=build /opt/venv /opt/venv
COPY . .

ENV PATH="/opt/venv/bin:$PATH"

CMD [ "python3","-u","main.py" ]
