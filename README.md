# yolox-tensorflow-lite
研究室内容のDockerセミナー用リポジトリ

## Q&A  
Q. "error during connect: This error may indicate that the docker daemon is not running."が出る…  
A. dockerが起動していないのでWin10の場合はDocker Desktopを起動してください．  

<br>

docker build -f .devcontainer/Dockerfile -t yolox .
docker run --rm yolox