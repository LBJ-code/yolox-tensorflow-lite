# 1. ベースとなるDockerイメージを選ぶ"https://hub.docker.com/"にて，用途に合わせたベースイメージを選べる．
#    今回はDebian上にpython3.8が事前にインストールされ，さらに容量が少ないslimイメージを選んだ．
FROM python:3.8-slim


# 2. opencv用に必要なUbunutパッケージをインストールする．
#    ("apt-get"はOSであるUbuntuにパッケージをインストールするときに使うコマンド)

# まずはインストール済みのパッケージをアップデート
RUN apt-get update && apt-get upgrade -y

# opencv用に必要なパッケージをインストール
RUN apt-get install -y libgl1-mesa-dev  \
    libglib2.0-0 \
    libsm6 \
    libxext6 \
    libxrender-dev \
    libx11-dev


# 3. main.pyを動かすためのpythonのライブラリをpip3経由でインストールする．

# "pip3"コマンド自体をアップグレード
RUN pip3 install --upgrade pip setuptools

# "pip3"コマンドに関わるwheelパッケージをアップデート
RUN pip3 install --upgrade wheel

# numpy, opencv, tensorflow-liteをインストール
# (通常これらパッケージは"requirements.txt"にまとめておく)
RUN pip3 install numpy==1.22.2 \
    opencv-python==4.5.5.62 \
    tflite-runtime==2.7.0


# 4. 環境変数を設定する．
#    具体的にはDockerコンテナ内でpythonによってGUIを出力する場合は，
#    "DISPLAY"環境変数を設定して，メインOS上でX serverを起動する必要がある．
ENV DISPLAY=host.docker.internal:0.0

# 5. デフォルトでDocker内ではrootディレクトリにいる．
#    rootディレクトリでの作業はシステムに関するディレクトリに抵触する可能性があるので,
#    カレントディレクトリを変える．
WORKDIR /code

# 6. メインOSでのカレントディレクトリのファイル・フォルダをDockerコンテナ内に追加する
ADD . .


# 6. "docker run"コマンドで実行されるコンテナ内のコマンドを定義
CMD python3 main.py
