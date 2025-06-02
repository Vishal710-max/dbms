#include<iostream>
using namespace std;
int main ()
{
    int n,a,b,c,i;
    cout<<"enter the no.=";
    cin>>n;
    a=0;
    b=1;
    cout<<"fibinosia series upto "<<n<<":"<<endl;
    for (i=0;i<=n;i++){
        cout<<a<<"\t";
         c=a+b;
         a=b;
         b=c;
    }
    return 0;
}