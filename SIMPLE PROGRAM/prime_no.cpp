#include<iostream>
using namespace std;
int main (){
    int i,k,n;
    cout<<"enter the no :";
    cin>>n;
    k=0;
    i=1;
    while (i<=n){
          if (n%i==0)
               k++;
               i++;
    }
    if (k==2){
          cout<<n<<"is  prime :"<<endl;
    }
    else{
        cout<<n<<"is not a prime no :";
    }
    return 0;
}