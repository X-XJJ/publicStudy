

# AI 人工智能 Artificial Intelligence

# ML 机器学习 Machine Learning
- 机器学习是基础，神经网络、深度学习都属于机器学习

- 机器学习包括以下几大类：
  - 线性回归


# DL 深度学习 Deep Learning

# NN 神经网络 Neural Network

神经网络的训练过程主要包含以下几个步骤：

- 初始化：对神经网络中的权重初始化。可以随机分配or预定义，如Xavier初始化等。
- 前向传播（Forward Propagation）：进行各种线性代数的矩阵运算，一轮中从输入数据、到输出结果。
- 计算损失（Loss）：预测值与实际值之间的差异通过损失函数量化，损失函数的设计取决于任务的性质（例如，对于回归任务常用均方误差MSE，对于分类任务常用交叉熵损失）。损失函数在此步骤中起关键作用，它提供了衡量模型预测性能的标准。
- 反向传播（Backward Propagation）：基于计算出的损失值，通过反向传播算法计算出每一层权重对损失的影响程度，即梯度。这一过程从输出层开始，逐层向前计算直至输入层。
- 权重更新：利用计算得到的梯度信息，通过优化算法（如梯度下降法、Adam等）调整网络中的权重，以减小损失值。这一步骤的目标是最小化损失函数，从而提高模型的预测准确性。
- 迭代训练：上述过程构成了一个训练周期（epoch），通常需要多次迭代整个训练集，直到模型的性能满足预期或者达到预设的停止条件（如最大迭代次数、最小损失阈值等）。
- 损失函数在整个训练过程中至关重要，它不仅定义了模型预测与真实标签之间的差距，还指导着权重的更新方向。通过最小化损失函数，模型能够逐步学习到输入与输出之间的映射关系，从而实现有效的预测。


- 前馈神经网络 Feedforward Neural Network，FNN
  - 是一个大的概念范围？
[前馈神经网络详解](https://blog.csdn.net/m0_64357419/article/details/129768728)
[AI算法05-前馈神经网络Feedforward Neural Network | FNN](https://blog.csdn.net/yangguangjiujiu99/article/details/140178649)

- 多层感知机 MLP ？？？


- DNN

- RNN

- CNN 卷积神经网络


-  五层研究领域
  - 第一层：基础设施建设 = 数据 + 计算能力
  - 第二层：机器学习算法 = {卷积神经网络，LSTM序列学习，Q-Learning，深度学习算法，...}
  - 第三层：技术方向和问题 = {计算机数视觉，语音智能，自然语言处理，决策系统，大数据分析的统计系统，...}
  - 第四层：具体技术 = {图像识别，语音识别，机器翻译，...}
  - 第五层：行业解决方案 = AI在各领域的应用，金融、医疗、交通、游戏、互联网……


- kaggle 线上
[动手学深度学习——Kaggle小白入门](https://blog.csdn.net/xiaojia1001/article/details/139467176)




# 常见概念 区分
## 机器学习的库
PyTorch是一个开源的机器学习库，由Facebook的人工智能研究团队开发。它提供了两个主要功能：张量计算（类似于NumPy），用于执行各种数学运算；自动梯度计算，用于深度学习模型的训练。PyTorch Lightning是一个基于PyTorch的高级库，旨在简化深度学习模型的开发和训练过程。

TensorFlow是一个由Google开发的开源机器学习，提供了丰富的API来构建、训练和部署机器学习模型。TensorFlow支持多种类型的模型，包括深度神经网络、卷积神经网络（CNN）、循环神经网络（RNN）以及Transformer等。TensorFlow的特点包括灵活的架构、丰富的API、动态计算图和强大的社区支持。


Transformer：神经网络，是一种深度学习模型架构，最初在2017年的论文《Attention is All You Need》中提出，基于自注意力机制，广泛应用于自然语言处理（NLP）领域，特别是在机器翻译任务中取得了显著的成果。Transformer模型的特点包括自注意力机制、多头注意力、位置编码和编码器-解码器结构。

Keras是一个高级神经网络API，可以运行在多个深度学习框架上，包括TensorFlow。Keras设计的初衷是提供一种易于使用且用户友好的接口，主要关注模型的快速构建和训练。Keras可以作为TensorFlow的前端接口，通过Keras可以使用TensorFlow的底层功能。在TensorFlow 2.0版本中，Keras成为了TensorFlow的默认高级API。


- 模型：本质其实是 数学函数

- 训练：一步一步找到参数的过程？

- 训练批次：batch，训练集A分拆成n个批次，一批一批进行训练，一批完成一次梯度下降迭代。eg：训练集有1000个样本，batch size=32，则约有1000/32≈31个批次。

- 训练轮次：epoch，完整训练一次数据集A，称为一轮、一个epoch。当训练集分为n个batch时，一个epoch中需要完整完成n个batch的训练

- 模型类别：分类模型，回归模型，聚类模型

- 超参数：

- 数据集：完整的应该有 训练集、验证集、测试集三个，互不重合
(①用训练集训练出模型-eg训练10轮会产生10个模型，模型们的参数不再变化。
 ②用模型在验证集的表现来选择模型、调整超参数-eg用训练出的10个模型在验证集上跑，看哪个更好，就定哪个-eg第7个模型在验证集上的效果最好。。用模型在测试集上的表现来评估模型优劣。同时，可以一边训练，一边验证，找到好的就停（即 早停）
 ③用测试集，对选出来的模型进行测试、评估好坏-eg用模型7来套测试集，进行误差比较)
  - 训练集 = Training Set，
      目的：用于训练模型，即通过优化算法调整模型的参数以最小化损失函数。
      使用：模型在训练集上学习数据的特征和模式。
      特点：通常是数据集中最大的一部分。
  - 验证集 = Validation Set，
      目的：用于模型选择（Model Selection）和超参数调优（Hyperparameter Tuning）。在训练过程中，用于评估模型的性能，帮助防止过拟合。
      使用：在训练过程中，用于调整模型的复杂度，如选择正则化强度、学习率等。
      特点：通常比训练集小，但足够大以提供可靠的性能估计。
  - 测试集 = Test Set，
    目的：用于评估模型的最终性能，即在看不见的数据上的表现。
    使用：在模型训练和验证过程完成后，用于最终评估模型的泛化能力。
    特点：在模型开发过程中，测试集不应该被用来调整模型参数或选择模型。
联系
数据划分：原始数据集通常被随机划分为训练集、验证集和测试集。这种划分确保了数据的独立性，使得每个集合都能在模型开发过程中发挥其独特的作用。
模型评估：通过在验证集上的表现来调整模型参数，然后在测试集上评估最终模型的性能，这有助于了解模型在新数据上的表现。
泛化能力：通过在训练集上训练、验证集上调整和测试集上评估，可以全面了解模型的泛化能力，即模型对新、未见过数据的处理能力。

避免过拟合：通过使用独立的验证集和测试集，可以检测并防止模型过拟合，确保模型在新数据上也能有良好的表现。
性能估计：测试集提供了模型在实际应用中的性能估计，这对于模型部署至关重要。
模型选择：验证集用于在多个模型或模型配置之间进行选择，选择在验证集上表现最好的模型。 

- 标签 = 
- 特征 = 
- 样本 = 
- 模型 = 

- 表征 = 网络提取出的特征？？数据的表示 or 数据的特征？？
  - 特征表示 = feature representation，
  - 表征学习 = representation learning？？对数据表示和特征的学习？机器通过学习数据的表示或特征来发现数据中潜在的结构和模式的过程。表征学习的目标是自动提取出能够代表数据本质特征的表示，这些特征随后可以用于各种下游任务，如分类、聚类、回归等。

- 编码 = encoder，其实本质是通过一系列的数学转换（即编码？）来提取数据的特征，理解“en，向内浓缩”
- 解码 = decoder，

- 张量 = 多维数组or多维数据结构？？？
  - 数学和物理学中的张量
  在数学和物理学中，张量是一个多线性映射，它将多个向量与一个标量相乘，并将结果映射到另一个标量。张量可以被看作是向量和矩阵概念的推广。在物理学中，张量用于描述具有多个分量的物理量，如应力、应变、惯性矩等，这些物理量在坐标变换下按照特定的规则变化。
  - 计算机科学和机器学习中的张量
  在计算机科学和机器学习领域，张量通常指的是多维数组。这种用法源自于线性代数中的张量概念，但在这里张量更多地被用作数据结构，用于存储和处理数据。例如，在深度学习中，输入数据、模型的权重和神经网络的激活都可以表示为张量。

- 熵 = 

- 交叉熵 = 

- 池化 = spool？，只是直译，其实是，

- 门控 = 

- 基线 = baseline，用来比较测试结果的基准结果
- 基准测试 = benchmark（工作台 标记），

- 评价指标：

- 消融实验：

- 散度 = ？？？散度是向量分析中的一个向量算子，它将向量空间上的一个向量场对应到一个标量场上。在物理学中，散度描述的是向量场中某点的源或汇的特性，即该点的向量是主要向外发散还是向内汇聚。例如，在流体力学中，散度可以表示单位体积内流体的变化率，正散度表示流体从某点向外流动，负散度则表示流体向该点汇聚

- 损失 = 差异？？即，预测数据 比 真实数据【损失】了多少内容？真实数据 和 训练出的模型求出的数据 的 差异ro误差

- 前向传播 = 

- 反向传播 = 

- 损失函数 = loss function，输入 模型预测值 和 真实值，输出非负实数来表示损失。
  - 散度损失 = 用来衡量两个概率分布之间差异的损失函数

- softmax()：归一化函数（进行概率转换），将一个实数向量或矩阵映射到一个概率分布上。具体来说，Softmax 函数可以确保经过它处理的输出值在 0 到 1 之间，并且所有输出值的总和为 1，这使得这些输出可以被解释为概率。

- sigmoid()：非线性函数？？将输出归一化到0~1？？用于激活

- ReLU()：？非线性函数？？用于激活

- 激活：
- 激活函数 = 用于激活神经元的函数

- 消融实验 = ？？

- logits = 神经网络模型最后一层输出的原始分数，这些分数通常是由神经网络的输出层计算得到的。在进行 softmax 操作之前，这些分数被称为“未经归一化的 logits”，因为它们还没有被转换成概率分布。
[深度学习中 logits 名称的由来](https://zhuanlan.zhihu.com/p/570134472)

[深度学习核心概念解析：Sota、Benchmark、Baseline等](https://developer.baidu.com/article/details/3335192)



- 模态 = modality，直译“形态、样式、感觉模式”，机器学习中，可以理解为 分类为同一个类型的数据？比如 文本是一种模态，RGB图像是一种模态，骨骼序列是一种模态？


- 硬负样本 = 在机器学习和深度学习中，特别是在涉及到分类或检索任务时，“硬负样本”（Hard Negative Samples）是指那些对于模型来说特别难以正确分类的负样本。这类样本通常与正样本非常相似，甚至可能被错误地分类为正样本。硬负样本的存在增加了模型学习的难度，但也同时提供了重要的学习信号，帮助模型更好地区分正类和负类。

# 优化器

ADAM = 自适应抑制学习率，可以调整loss的抖动程度
SGD = 梯度下降得较为平滑，即loss抖动少





## 常见问题
- 欠拟合：
- 过拟合： 

- 冷启动：
- 模型复杂：参数量大、啥复杂？？

- 长尾分布


# 机器学习

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

# 3blue1Brown 视频
机器学习系列，目前有7个
[【官方双语】深度学习之神经网络的结构 Part 1 ver 2.0](https://www.bilibili.com/video/BV1bx411M7Zx)



