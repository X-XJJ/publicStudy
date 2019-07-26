#!/bin/bash
#九九乘法表
#for i in {1..9}
#do
#	for ((j=1;j<=i;j++))
#	do
#		printf "%-8s" $j*$i=$((j*i))
#	done
#	echo
#done

#for语句示例
#示例1
for NUM in {1..20}
do
	echo $NUM
done

#示例2
for ((i=0;i<=20;i++))
do
	#echo $i
	printf "%d\n" $i
done

arr1=(1 2 3 4 5)
arr2=([2]="a b" [5]="c" [8]=4 [10]="soft")
echo "arr1=${arr1[*]}"
echo "arr2=${arr2[*]}"

echo "for---------------arr1"
for ((i=0;i<${#arr1[@]};i++))
do
    echo ${arr1[$i]}
done

echo "for---------------arr2"
for ((i=0;i<${#arr2[@]};i++))
do
    echo ${arr2[$i]}
done

echo "for-----in--------arr1"
#通过遍历下标获取数组元素
for i in ${!arr1[@]}
do
	echo ${arr1[$i]}
done

echo "for-----in--------arr2"
#通过遍历下标获取数组元素
for i in ${!arr2[@]}
do
	echo ${arr2[$i]}
done

echo "for-----in--------arr1"
#直接遍历数组
for value in "${arr1[@]}"
do
	echo $value
done

echo "for-----in--------arr2"
#直接遍历数组
for value in "${arr2[@]}"
do
	echo $value
done

echo "while-------------arr1"
i=0
while [ $i -lt ${#arr1[@]} ]
do
    echo ${arr1[$i]}
	let i++   #let用于计算的工具,可以执行一个或多个表达式 let a=1+2
done

echo "while-------------arr2"
j=0
while [ $j -lt ${#arr2[@]} ]
do
    echo ${arr1[$j]}
	let j++   #let用于计算的工具,可以执行一个或多个表达式 let a=1+2
done
```
