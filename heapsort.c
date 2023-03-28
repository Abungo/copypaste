#include<stdio.h>
A[]={5,3,9,7,8,1,6};
int n=sizeof(A)/sizeof(A[0]);
int heapsize;

Build_Max_Heap(int A[],int heapsize);
Max_Heapify(int A[],int i,int heapsize);
Heapsort(int A[],int heapsize);
int main(int argc, char *argv[])
{    heapsize=n-1;
	Heapsort(A,heapsize);
	for(int i=0;i<n;i++){
	    printf("%d ",A[i]);
	    }
}

Build_Max_Heap(int A[],int heapsize){
    for(int i=heapsize/2;i>=0;i--){
        Max_Heapify(A,i,heapsize);
}
}
Heapsort(int A[],int heapsize){
    int tmp,i;
    Build_Max_Heap(A,heapsize);
    for(i=heapsize;i>0;i--){
        tmp=A[i];
        A[i]=A[0];
        A[0]=tmp;
        heapsize--;
        Max_Heapify(A,0,heapsize);
    }
}
Max_Heapify(int A[],int i,int heapsize){
    int tmp,largest=i,l,r;
    l= (2*i)+1;
    r=(2*i)+2;
    if((l<=heapsize) && (A[l]>A[i])){
        largest=l;
    }
    if((r<=heapsize)&&(A[r]>A[i])){
        largest=r;
    }
    if(largest!=i){
        tmp=A[i];
        A[i]=A[largest];
        A[largest]=tmp;
        Max_Heapify(A,largest,heapsize);
    }
}


