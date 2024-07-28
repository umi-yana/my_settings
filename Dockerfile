FROM python:3.12.4-slim-bullseye
USER root

RUN apt-get update
RUN apt-get -y install locales && \
    localedef -f UTF-8 -i ja_JP ja_JP.UTF-8
ENV LANG ja_JP.UTF-8
ENV LANGUAGE ja_JP:ja
ENV LC_ALL ja_JP.UTF-8
ENV TZ JST-9
ENV TERM xterm


RUN apt-get install -y \
    vim \
    less \
    git \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN pip install --upgrade pip
RUN pip install --upgrade setuptools
RUN mkdir -p /Workspace

COPY requirements.txt .
RUN pip install -r requirements.txt

COPY . /Workspace

WORKDIR /Workspace/src
EXPOSE 8888
