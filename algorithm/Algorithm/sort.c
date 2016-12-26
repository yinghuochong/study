//
//  sort.c
//  Algorithm
//  整理常见的排序算法
//  Created by liulihua on 16/12/1.
//  Copyright © 2016年 liulihua. All rights reserved.
//

#include "sort.h"
#include <stdlib.h>
#include <time.h>

void printArray(int *a, int n){
    printf("\n------- start print --------------\n");
    for (int i = 0 ; i< n; i ++ ) {
        printf( "%d ",a[i] );
    }
    printf("\n------- end print --------------\n");
}


/*
 参考资料：
 https://www.toptal.com/developers/sorting-algorithms
 
 */


//==============  冒泡排序  =================
/*
 核心思想：它重复地走访要排序的数列，一次比较两个元素，如果他们的顺序错误就把他们交换过来。走访数列工作重复地进行直到没有再需要交换，也就是说该数列已经排序完成
 时间复杂度：O(n²)
 空间复杂度：需要O(1)辅助空间
 是否稳定排序：是
 最优时间复杂度是：O(n)
 最多交换次数 : O(n²)
 link: https://zh.wikipedia.org/wiki/冒泡排序
 */
void bubbleSort(int a[], int n){
    int temp = 0;
    int swaped = 0;  //标记本轮比较是否有交换，如果没有则完成排序
    for (int i = n; i > 1; i--) {
        swaped = 0;
        for (int j = 0; j < i; j++ ) {
            if(a[j] > a[j+1]){
                swaped = 1;
                temp = a[j];
                a[j] = a[j+1];
                a[j+1] = temp;
            }
        }
        if(swaped == 0) break;
    }
}

//============== 插入排序  =================
/*
 核心思想：每次从未排序数列中选出一个元素放在已排序的数列中
 时间复杂度：O(n²)
 空间复杂度：需要O(1)辅助空间
 是否稳定排序：是
 最优时间复杂度是：O(n²)
 最多交换次数 : O(n)
 比较次数：n-1 <   <n(n-1)/2
 ref:  https://zh.wikipedia.org/wiki/插入排序
 */
void insertionSort(int a[], int n){
    int temp;
    for (int i = 1; i<n; i++) {
        int insertIndex = 0;//找到要插入的位置
        for (int j = i-1; j>=0; j--) {
            if(a[i] > a[j]){
                insertIndex = j + 1;
                break;
            }
        }
        //插入并后移元素
        temp = a[i];
        for (int k = i; k > insertIndex; k--) {
            a[k] = a[k-1];
        }
        a[insertIndex] = temp;
    }
}


//==============  选择排序  =================
/*
 核心思想：每次从要排序的数列中找出一个最小的放到最前面
 时间复杂度：O(n²)
 空间复杂度：需要O(1)辅助空间
 是否稳定排序：否
 最优时间复杂度是：O(n²)
 最多交换次数 : O(n)
 比较次数：n(n-1)/2   （与原始顺序无关）
 ref: https://zh.wikipedia.org/wiki/选择排序
 */
void selectionSort(int a[], int n){
    int temp;
    for (int i = 0; i < n-1; i++) {
        int minIndex = i;
        for (int j = i+1; j < n; j ++) {
            if(a[minIndex] > a[j]){
                minIndex = j;
            }
        }
        //将数列最小值与第一个交换
        temp = a[i];
        a[i] = a[minIndex];
        a[minIndex] = temp;
    }
    
}


//==============  快速排序  =================
/*
 核心思想：每一轮排序将比某个数小的移到左边，大的移到右边，递归该操作
 时间复杂度：O(n²)
 空间复杂度：需要O(n)辅助空间
 是否稳定排序：否
 最优时间复杂度是：O(nlogn)
 最多交换次数 :
 ref:https://zh.wikipedia.org/wiki/快速排序
 */
void quickSort(int a[], int left, int right){ //[left,right]
    if(left >= right) return;
    int flagNum = a[left];
    int i = left;
    int j = right;
    
    while (i < j) {
        while ( a[j] >= flagNum && i < j ) {
            j--;
        }
        a[i] = a[j];
        while ( a[i] <= flagNum && i < j ) {
            i++;
        }
        a[j] = a[i];
    }
    a[i] = flagNum;
    quickSort(a, left, i-1);
    quickSort(a, i+1, right);
}

//==============  归并排序  =================
/*
 核心思想：将序列每相邻两个数字进行归并操作，形成n/2个序列，递归该操作
 时间复杂度：O(nlogn)
 空间复杂度：需要O(n)辅助空间
 是否稳定排序：是
 最优时间复杂度是：O(n)
 最多交换次数 :
 ref: https://zh.wikipedia.org/wiki/归并排序
 */

void merge(int a[],int temp[], int left,int right){
    if(left >= right) return;
    int len = right - left;
    int middle = len/2 + left; //实际分组的中间
    int start1 = left, end1 = middle;
    int start2 = middle + 1, end2 = right;
    merge(a, temp, start1, end1);
    merge(a, temp, start2, end2);
    int k = left;
    while (start1 <= end1 && start2 <= end2) {
        temp[k++] = a[start1] < a[start2] ? a[start1++] : a[start2++];
    }
    while (start1 <= end1) {
        temp[k++] = a[start1 ++ ];
    }
    while (start2 <= end2) {
        temp[k++] = a[start2 ++ ];
    }
    for (k = left; k <= right; k ++) {
        a[k] = temp[k];
    }
}

void mergeSort(int a[], int n){
    int temp[n];
    merge(a, temp, 0, n-1);
}



//==============  堆排序  =================
/*
 核心思想：将序列每相邻两个数字进行归并操作，形成n/2个序列，递归该操作
 时间复杂度：O(nlogn)
 空间复杂度：需要O(1)辅助空间  最坏的情况 O(n)
 是否稳定排序：否
 最优时间复杂度是：O(nlogn)
 最多交换次数 :
 link:  https://zh.wikipedia.org/wiki/堆排序
 */

void swap(int *a, int *b){
    int temp = *a;
    *a = *b;
    *b = temp;
}

void maxHeapify(int a[], int left, int right){
    int dad = left;
    int son = left * 2 + 1;
    while (son <= right) {// 子节点存在才比较
        //比较两个子节点大小，找出最大的
        if(son + 1 < right && a[son] < a[son+1]){
            son ++;
        }
        if(a[dad] > a[son]){
            return;
        }else{
            swap(&a[dad], &a[son]);
            dad = son;
            son = dad * 2 + 1;
        }
    }
}

void heapsSort(int a[],int n){
    int i;
    for (i = n/2 - 1; i >= 0 ; i --) {
        maxHeapify(a, i, n-1);
    }
    for (i = n - 1; i > 0; i --) {
        swap(&a[i], &a[0]);
        maxHeapify(a, 0, i -1);
    }
    
}


//==============  Shell排序  =================
/*
 核心思想：实质就是分组插入排序，可理解为按步长分成几列，对每列进行插入排序
 时间复杂度：O(nlogn)
 空间复杂度：需要O(n)辅助空间
 是否稳定排序：否
 最优时间复杂度是：O(n)
 最多交换次数 :
 ref:  https://zh.wikipedia.org/wiki/希尔排序
 */

void shellSort(int a[],int n){
    int gap ,i ,j ;
    int temp;
    for (gap = n/2; gap > 0; gap /= 2) {
        for (i = gap; i < n; i ++) {
            temp = a[i];
            for (j = i - gap; j > 0 && a[j] > temp; j -= gap) {
                a[j + gap] = a[j];
            }
            a[j + gap] = temp;
        }
    }
}



/*  从小到大排序
冒泡排序   Bubble Sort
插入排序   Insertion Sort
选择排序    Selection Sort
快速排序   quick sort
归并排序   merge sort
堆积排序   Heaps sort
 shell排序   Shell sort
*/




void testSort(){
    srand((unsigned)time(NULL));
    //生成一些随机数,并打印
    int n = 10;
    int a[n];
    for(int i = 0; i < n; i++){
        a[i] = rand()%100;
    }
    printArray(a, n);
    
    //排序
    clock_t start = clock();
    shellSort(a, n);  //可以在这个地方替换各种排序
    clock_t end = clock();
    printf("\n sort cost1: %f \n", (double)(end - start)/CLOCKS_PER_SEC );
    //打印结果
    printArray(a, n);
}

