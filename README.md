# yolox-tensorflow-lite
研究室内容のDockerセミナー用リポジトリ

1. Dockerをインストールする.  
<Macの場合>  
[https://docs.docker.com/desktop/mac/install/](https://docs.docker.com/desktop/mac/install/)からダウンロードする．  
英語読めないよ～って人は[https://qiita.com/ama_keshi/items/b4c47a4aca5d48f2661c](https://qiita.com/ama_keshi/items/b4c47a4aca5d48f2661c)を参考にする.  

2. モデルと入力をダウンロード
佐藤が提供するYOLOXのモデルとサンプル用の入力動画を[https://drive.google.com/drive/folders/11Pp_9KuiRunPNnuYZ4t71QwQk3isCDGF?usp=sharing](https://drive.google.com/drive/folders/11Pp_9KuiRunPNnuYZ4t71QwQk3isCDGF?usp=sharing)からダウンロードする.  その後，それらファイルをrootディレクトリに配置する．このときのディレクトリ構造は以下の通り.
![ディレクトリ構造](/readme_img/dir.PNG)

3. X serverの導入  
最終的に物体検出の結果を表示するが，そのためにはX serverを導入する必要がある.  
<Macの場合>　　
[https://qiita.com/uedashuhei/items/3f6f8612b5c4a2b00b1a](https://qiita.com/uedashuhei/items/3f6f8612b5c4a2b00b1a)を参考にする．  
とにかくこのHPのここだけやればいい（と思われる）![macのX server](/readme_img/xquanz.PNG)  

4. Dockerによるビルドとプログラムの実行  
等ディレクトリまでターミナル上で移動する．そして，以下のコマンドを実行する.　　
```docker build  -t yolox .```  
Dockerのビルドが正常終了したことを確認した後に  
```docker run yolox```
を実行することで，物体検出の結果が表示される．

## Q&A  
Q. "error during connect: This error may indicate that the docker daemon is not running."が出る…  
A. dockerが起動していないのでWin10の場合はDocker Desktopを起動してください．  

<br>
