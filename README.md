在colab上运行要求：

1、需要提前下载好模型文件，并上传到云端硬盘。

2、打开colab连接云端硬盘。

3、用git来获取代码。

   !git config --global user.name 'xsy-kucha'
   
   !git config --global user.email '2279038930@qq.com'

   !git clone https://github.com/xsy-kucha/UU-NLP.git
   
4、在run.sh中将路径设置完毕

5、在colab代码框中输入

   !pip install tensorflow-gpu==1.15.2
   
   并运行完毕。
   
6、cd run.sh的文件路径

7、!sh run.sh  ./script 2>&1 | tee terminal.log;

