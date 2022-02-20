# tfjs_pose_estimation_3d

研究室内容の Docker セミナー用リポジトリ
C:\Users\user\Desktop\yolox-tensorflow-lite

## Q&A

Q. "error during connect: This error may indicate that the docker daemon is not running."が出る…  
A. docker が起動していないので Win10 の場合は Docker Desktop を起動してください．

<br>

docker build -f .devcontainer/Dockerfile -t httpd .
docker run --rm -p 8080:80 httpd
