



## 内存池
- 
- 一般的系统接口申请内存：
- C/C++ malloc/free
- java new/delete
- 在内存碎片中寻找最接近申请大小的内存块，返回给申请者，容易造成众多小块内存碎片，无法利用
-
- 内存池：
  - 定长分配，每次分配固定长度
  - 变长分配
- 定长分配：每次申请固定长度，使用时利用栈，例如存储一个变量，申请malloc内存，便入栈一个，直到这个长度的内存使用完毕，再一次申请定长内存；free即出栈
-
-
-
-