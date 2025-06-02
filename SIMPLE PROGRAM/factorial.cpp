#include<iostream>
using namespace std;
int main ()
{
    int n,f,i;
    cout<<"enter the no.=";
    cin>>n;
    f=1;
    for (i=n;i>0;i--){    //we can find factorial as like this way's 6*5*4*3*2*1 i.e in reverse order :
           f=f*i;
    }
    cout<<"factorial of givin no. :"<<f<<endl;
    return 0;
}