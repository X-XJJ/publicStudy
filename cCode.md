# 线性表
- 插入x到表长pn的线性表的i位置
~~~
int sq_insert(int list[], int *pn, int i, int x)
{
    if(i < 0 || i > *pn) return 1;	//i不在可插范围
    if(*pn == MAXSIZE) return 2;		//表满
    for(int j = *pn; j > i; j--)	//倒着挪
        list[j] = list[j-1];
    list[j] = x;
    ++(*pn);
    return 0;
}
~~~

# 查找
- 二分查找
~~~
int binarySearch(int key, int list[], int n)
{//key-查找项 n-表长
    int low, high, mid;
    low = 0;
    high = n - 1;
    while(low <= high)
    {
        mid = (low + high)/2;
        if(x < list[mid])
            high = mid - 1;
        else if(x > list[mid])
            low = mid + 1;
        else //找到查找项
            return mid;
    }
    return -1;
}
~~~

# 内部排序
## 插入排序
- 直接插入排序
~~~
int insertSort(int v[], int n)
{//n-表长
	int temp;
	int i;
	for(i = 1; i < n; i++)		//i=1 第一个元素已是一个有序子表
	{
			if(v[i] < v[i - 1])		//若v[i]<有序子表的末尾最大值 则需要找位置 v[i] 直接插入有序子表
			{
					temp = v[i];
					for(int j = i-1; temp < v[j]; j--)
					{
							v[j+1] = v[j];		//有序子表向后挪位
					}
					v[j+1] = temp;		//找到 temp > v[j] 的位置 插入 temp 到 v[j] 后 
			}
	}
}

~~~

## 交换排序
- 
~~~
~~~

- 希尔排序
~~~
int shellSort(int v[], int n)
{
	int i,temp;
	int dk;  //dk-元素间隔

	//控制步长间隔递减
	for(dk = n/2; dk > 0 ;dk /= 2）
	{
		//划分希尔子表 [i-dk,i,i+dk,i+2dk,...] 即[j,j+dk,j+2dk,...]
		for(i = dk; i < n; i++)
		{
			//1 子表排序使用 直接插入排序
			if(v[i] < v[i - dk])
			{
				temp = v[i];
				for(int j = i - dk; temp < v[j]; j -= dk)
				{
					v[j+dk] = v[j];
				}
				v[j+dk] = temp;
			}

			//2 子表排序使用 有序子表的交换排序???
			for(int j = i-dk; (j >= 0) && (v[j] > v[j+dk]); j -= dk)
			{
				temp = v[j];
				v[j] = v[j+dk];
				v[j+dk] = temp;
			}
		}
	}
}
~~~

- 冒泡排序
~~~
~~~

- 快速排序
~~~
void quickSort(int A[], int low, int high)
{
	//数组 A 中 low~high 之间的数是尚未排序的
	if(low >= high)
		return;	//low~high之间已经没有没排序的了 跳出递归
	
	int mid;	//划分的中心分界位置 下标 枢纽
	mid = partition(A, low, high);
	quickSort(A, low, mid-1);
	quickSort(A, mid+1, high);
}

int partition(int A[], int low, int high)
{	//将数组 A 中 low~high 之间的数 即尚未分组的数 进行划分 返回分界位置下标
	//即 一趟排序
	int midVal = A[low];	//均取未排序的第一个值midVal为分界 A[low]的位置用作容器 放找到的数 最后才能确认midVal的位置
	
	while(low < high)	//遍历完 low~high 之间的数
	{
		while(low < high && A[high] > midVal)	//先从 high 端找小的 因为开始是 A[low] 空出来？？？
			high--;	//找到当前 low high 间第一个比 A[mid] 小的 挪到左边
		A[low] = A[high];
		
		while(low < high && A[low] < midVal)
			low++;	//找到当前 log high 间第一个比 midVal 大的 此时 A[high]原值 已挪到右边 high位空做容器
		A[high] = A[low];
	}
	A[low] = midVal;	//已跳出 low = high A[low]为最终位置 放分界
	return low;
}
~~~

# 外部排序

