//
//  GRETest.c
//  Algorithm
//
//  Created by liulihua on 16/12/18.
//  Copyright © 2016年 liulihua. All rights reserved.
//

#include "GRETest.h"
#include <stdlib.h>
#include <time.h>

/*==================================================
 对带有头结点的单链表按数据域值从小到大进行选择排序
 链表的头结点指针为list，头结点数据域中不放任何信息，结点类型为：
 typedef struct node{
    int data;
    struct node *link;
 }* LinkList;
 要求：
 不增加和使用新的链结点空间
 不改变链结点的数据域中的原有的内容
 */

typedef struct node{
    int data;
    struct node *link;
}* LinkList;

void printLinkList(LinkList list){
    printf("\n========== start =============\n");
    LinkList node = list->link;
    while (node) {
        printf("%d  ",node->data);
        node = node->link;
    }
    printf("\n========== end =============\n");
}

void selectSortLink(LinkList list){
    LinkList insertNode = list;
    while (insertNode->link) {
        //find selectNode
        LinkList preSelectNode = insertNode;
        LinkList node = preSelectNode;
        while (node->link) {
            if(node->link->data < preSelectNode->link->data){
                preSelectNode = node;
            }
            node = node->link;
        }
        //change position
        LinkList selectNode = preSelectNode->link;
        preSelectNode->link = selectNode->link;
        selectNode->link = insertNode->link;
        insertNode->link = selectNode;
        
        insertNode = selectNode;
    }
}



void testSelectSortLink(){
    srand((unsigned)time(NULL));
    //生成一些随机数,并打印
    int n = 10;
    int a[n];
    for(int i = 0; i < n; i++){
        a[i] = rand()%100;
    }
    //create link list
    LinkList list = (LinkList)malloc(sizeof(LinkList));
    LinkList curLink = list;
    for (int i = 0; i < n; i++) {
        LinkList newLink = (LinkList)malloc(sizeof(LinkList));
        newLink->link = NULL;
        newLink->data = a[i];
        curLink->link = newLink;
        curLink = newLink;
    }
    printLinkList(list);
    //sort
    selectSortLink(list);
    
    printLinkList(list);
    
}


//二分查找
void binaryFind(int a[], int s, int e, int x){
    if (s >= e) return ;
    int middle = (s + e)/2;
    if (a[middle] == x){
        printf("find it : %d \n",middle);
        return;
    }else if(a[middle] > x){
        binaryFind(a,s,middle,x);
    }else if(a[middle] < x){
        binaryFind(a,middle + 1,e,x);
    }
}


/*==================================================
 1、将用户通过键盘输入的若干字符（用EOF结束输入）存入一维数组s中
 2、找出数组中具有最大ASCII码值得字符
 3、输出该字符以及该字符对应的ASCII码
 要求：程序中有关输入、输出、以及查找等操作必须通过指针完成。
 */
void testMaxASCII(){
    while (1) {
        //input
        char *s = (char*)malloc(sizeof(char)*1000);
        printf("please input(end of EOF):");
        scanf("%s",s);
        //find max
        char *p = s;
        char *maxChar = p;
        while (*p++) {
            if(*p > *maxChar){
                *maxChar = *p;
            }
        }
        //print
        printf("maxchar: %c , ASCII: %d\n",*maxChar, *maxChar);
    }
}























void testGRE(){
    testMaxASCII();
}








