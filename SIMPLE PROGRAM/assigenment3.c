Programming using C
B.Sc.(ECS)- I
Practical Assignment no -3
//1. Write a program for conversion number from decimal to binary.

#include <stdio.h>
#include <conio.h>

int main() {
    int n, b[32], i = 0;
    clrscr();
    
    printf("Enter a decimal number: ");
    scanf("%d", &n);
    
    while (n > 0) {
        b[i] = n % 2;
        n /= 2;
        i++;
    }
    
    printf("Binary representation: ");
    for (int j = i - 1; j >= 0; j--) {
        printf("%d", b[j]);
    }
    
    return 0;
}



//2. Write a program for conversion number from decimal to octal 
number.

#include <stdio.h>
#include <conio.h>

int main() {
    int n, o[32], i = 0;
    clrscr();
    
    printf("Enter a decimal number: ");
    scanf("%d", &n);
    
    while (n > 0) {
        o[i] = n % 8;
        n /= 8;
        i++;
    }
    
    printf("Octal representation: ");
    for (int j = i - 1; j >= 0; j--) {
        printf("%d", o[j]);
    }
    
    return 0;
}



//3. Write a program for conversion from binary number to decimal 
number.

#include <stdio.h>
#include <conio.h>
#include <math.h>

int main() {
    long long n;
    int d = 0, i = 0, r;
    clrscr();
    
    printf("Enter a binary number: ");
    scanf("%lld", &n);
    
    while (n != 0) {
        r = n % 10;
        d += r * pow(2, i);
        n /= 10;
        i++;
    }
    
    printf("Decimal representation: %d\n", d);
    
    return 0;
}



//4. Write a program to print prime numbers between 1 to 1000.

#include <stdio.h>
#include <conio.h>

int main() {
    int i, j, p;
    clrscr();
    
    printf("Prime numbers between 1 to 1000:\n");
    
    for (i = 2; i <= 1000; i++) {
        p = 1;
        
        for (j = 2; j <= i / 2; j++) {
            if (i % j == 0) {
                p = 0;
                break;
            }
        }
        
        if (p) {
            printf("%d ", i);
        }
    }
    
    return 0;
}



//5. Write a program to print Armstrong number between 1 to 
1000.

#include <stdio.h>
#include <conio.h>
#include <math.h>

int main() {
    int n, o, r, result;
    clrscr();
    
    printf("Armstrong numbers between 1 to 1000:\n");
    
    for (n = 1; n <= 1000; n++) {
        o = n;
        result = 0;
        
        while (o != 0) {
            r = o % 10;
            result += pow(r, 3);
            o /= 10;
        }
        
        if (result == n) {
            printf("%d ", n);
        }
    }
    
    return 0;
}



//6. Write a program for multiplication table of 2 to 20.

#include <stdio.h>
#include <conio.h>

int main() {
    int i, j;
    clrscr();
    
    printf("Multiplication tables from 2 to 20:\n\n");
    
    for (i = 2; i <= 20; i++) {
        printf("Multiplication table of %d:\n", i);
        for (j = 1; j <= 10; j++) {
            printf("%d * %d = %d\n", i, j, i * j);
        }
        printf("\n");
    }
    
    return 0;
}



//7. Write a program to print sum of first and last digit of given 
number.

#include <stdio.h>
#include <conio.h>

int main() {
    int n, first, last, s;
    clrscr();
    
    printf("Enter a number: ");
    scanf("%d", &n);
    
    last = n % 10;
    
    while (n >= 10) {
        n /= 10;
    }
    
    first = n;
    
    s = first + last;
    
    printf("Sum of first and last digit: %d\n", s);
    
    return 0;
}



//8. Write a program to print Fibonacci series up to n terms.

#include <stdio.h>
#include <conio.h>

int main() {
    int n, i, a = 0, b = 1, next;
    clrscr();
    
    printf("Enter the number of terms: ");
    scanf("%d", &n);
    
    printf("Fibonacci series up to %d terms:\n", n);
    
    for (i = 1; i <= n; ++i) {
        printf("%d, ", a);
        next = a + b;
        a = b;
        b = next;
    }
    
    return 0;
}



//9. Write a C program to check whether a number is Perfect 
number or not.

#include <stdio.h>
#include <conio.h>

int main() {
    int n, s = 0, i;
    clrscr();
    
    printf("Enter a number: ");
    scanf("%d", &n);
    
    for (i = 1; i < n; i++) {
        if (n % i == 0) {
            s += i;
        }
    }
    
    if (s == n) {
        printf("%d is a perfect number.\n", n);
    } else {
        printf("%d is not a perfect number.\n", n);
    }
    
    return 0;
}



//10. Write a C program to check whether a number is Strong number 
or not.

#include <stdio.h>
#include <conio.h>

int f(int n) {
    if (n == 0 || n == 1) {
        return 1;
    } else { 
        return n * f(n - 1);
    }
}

int main() {
    int num, orig, rem, s = 0;
    clrscr();
    
    printf("Enter a number: ");
    scanf("%d", &num);
    
    orig = num;
    
    while (num != 0) {
        rem = num % 10;
        s += f(rem);
        num /= 10;
    }
    
    if (s == orig) {
        printf("%d is a strong number.\n", orig);
    } else {
        printf("%d is not a strong number.\n", orig);
    }
    
    return 0;
}