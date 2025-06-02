#include<iostream>
using namespace std;
int main (){
    int i,s,n;
    cout<<"enter the no :";
    cin>>n;
    s=0;
    i=1;
    while (i<n){
          if (n%i==0)
               s=s+i;
               i++;
    }
    if (s==n){
          cout<<n<<"is  perfect :"<<endl;
    }
    else{
        cout<<n<<"is not a perfect no :";
    }
    return 0;
}