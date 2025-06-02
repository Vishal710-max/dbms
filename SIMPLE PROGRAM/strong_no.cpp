#include<iostream>
using namespace std;
int main (){
    int i,s,n,r,t,f;
    cout<<"enter the no :";
    cin>>n;
    t=n;
    s=0;    
    i=1;
    while (i<=n){
           r=n%10;
           f=1;
           while (r>0){
                f=f*r;
                r--;
           }
           s=s+f;
           n=n/10;
    }
    if (s==t){
          cout<<t<<"is  strong :"<<endl;
    }
    else{ 
        cout<<t<<"is not a strong no :";
    }
    return 0;
}