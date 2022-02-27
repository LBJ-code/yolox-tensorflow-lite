FROM python:3.8-slim

RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y libgl1-mesa-dev  \
    libglib2.0-0 \
    libsm6 \
    libxext6 \
    libxrender-dev \
    libx11-dev

RUN pip3 install --upgrade pip setuptools
RUN pip3 install --upgrade wheel
RUN pip3 install numpy==1.22.2
RUN pip3 install opencv-python==4.5.5.62
RUN pip3 install tflite-runtime==2.7.0

ENV DISPLAY host.docker.internal:0.0

ADD . .

CMD python3 main.py
