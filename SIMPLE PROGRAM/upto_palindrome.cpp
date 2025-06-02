#include <iostream>
using namespace std;
int main ()
{
    int t,r,i,s,c=0;
    cout<<"\nEnter the range:";
    for (i=1;i<=500;i++){
    t=i;
    s=0;
    while (t > 0)
        {
            r=t%10;
            s=s*10+r;
            t=t/10;
        }
    if (i==s)
        {
            cout<<"\n"<<i;
            c++;
        }
    }
    cout<<"\nTotal no. between 1 to 500 is :"<<c;
    return (0);
}