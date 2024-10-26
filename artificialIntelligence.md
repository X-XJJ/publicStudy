

# 人工智能 AI Artificial Intelligence

# 机器学习 Machine Learning
- 

-  五层研究领域
  - 第一层：基础设施建设 = 数据 + 计算能力
  - 第二层：机器学习算法 = {卷积神经网络，LSTM序列学习，Q-Learning，深度学习算法，...}
  - 第三层：技术方向和问题 = {计算机数视觉，语音智能，自然语言处理，决策系统，大数据分析的统计系统，...}
  - 第四层：具体技术 = {图像识别，语音识别，机器翻译，...}
  - 第五层：行业解决方案 = AI在各领域的应用，金融、医疗、交通、游戏、互联网……


- kaggle 线上
[动手学深度学习——Kaggle小白入门](https://blog.csdn.net/xiaojia1001/article/details/139467176)




# 常见 区分
PyTorch是一个开源的机器学习库，由Facebook的人工智能研究团队开发。它提供了两个主要功能：张量计算（类似于NumPy），用于执行各种数学运算；自动梯度计算，用于深度学习模型的训练。PyTorch Lightning是一个基于PyTorch的高级库，旨在简化深度学习模型的开发和训练过程。

TensorFlow是一个由Google开发的开源机器学习框架，提供了丰富的API来构建、训练和部署机器学习模型。TensorFlow支持多种类型的模型，包括深度神经网络、卷积神经网络（CNN）、循环神经网络（RNN）以及Transformer等。TensorFlow的特点包括灵活的架构、丰富的API、动态计算图和强大的社区支持。

Transformer是一种深度学习模型架构，最初在2017年的论文《Attention is All You Need》中提出，基于自注意力机制，广泛应用于自然语言处理（NLP）领域，特别是在机器翻译任务中取得了显著的成果。Transformer模型的特点包括自注意力机制、多头注意力、位置编码和编码器-解码器结构。

Keras是一个高级神经网络API，可以运行在多个深度学习框架上，包括TensorFlow。Keras设计的初衷是提供一种易于使用且用户友好的接口，主要关注模型的快速构建和训练。Keras可以作为TensorFlow的前端接口，通过Keras可以使用TensorFlow的底层功能。在TensorFlow 2.0版本中，Keras成为了TensorFlow的默认高级API。

- 常见词
训练集
验证集
测试集

标签 = 
特征 = 
样本 = 
模型 = 


- 模型：分类模型，回归模型，聚类模型
- 训练：一步一步找到参数






## Pytorch
- pytorch = torch的Python版本
[PyTorch官网](https://pytorch.org/)

[面向Windows的Pytorch完整安装教程](https://blog.csdn.net/qianbin3200896/article/details/104244538)

[pytorch安装过程中遇到的下载失败/下载中断问题](https://blog.csdn.net/fat_sheep1/article/details/129519499)

[版本对应](https://lightning.ai/docs/pytorch/latest/versioning.html#compatibility-matrix)

[torch对应Python版本](https://lightning.ai/docs/pytorch/latest/versioning.html#compatibility-matrix)

- Torch官网
https://pytorch.org/
https://pytorch.org/get-started/previous-versions/
- 2.3版本 cpu版 无显卡
conda install pytorch==2.3.0 torchvision==0.18.0 torchaudio==2.3.0 cpuonly -c pytorch
pip install theano keras
pip install tensorflow keras
conda install transformers
conda install scikit-learn

“I tensorflow/core/util/port.cc:153] oneDNN custom operations are on. You may see slightly different numerical results due to floating-point round-off errors from different computation orders. To turn them off, set the environment variable `TF_ENABLE_ONEDNN_OPTS=0`.”
是一条 TensorFlow 的日志信息。它表明 TensorFlow 使用了一DNN (one Deep Neural Network) 的自定义操作。可以通过环境变量或者配置文件来禁用它们。具体方法是在启动 TensorFlow 程序之前，设置环境变量 TF_ENABLE_ONEDNN_OPTS 为 0。
import os
os.environ['TF_ENABLE_ONEDNN_OPTS'] = '0'


# 回归模型




# tqdm 进度显示
[深度学习进度显示神器：tqdm详解](https://blog.csdn.net/lsb2002/article/details/133754470)


# AI应用最大的领域：图像，是很好的参考资源
- 顶会 CVPR


# 吴恩达《机器学习》视频
[吴恩达《机器学习》](https://www.bilibili.com/video/BV1Bq421A74G)



