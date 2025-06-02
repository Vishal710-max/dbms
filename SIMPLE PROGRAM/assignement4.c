Programming using C
B.Sc.(ECS)- I
Practical Assignment no -4
//Write a programs to print the following pattern
 
1) 
 # # # # # 
 # # # # # 
 # # # # #
 # # # # #
 # # # # #

#include <stdio.h>
#include <conio.h>

int main() {
    int i, j;

    for (i = 1; i <= 5; i++) {
        for (j = 1; j <= 5; j++) {
            printf("# ");
        }
        printf("\n");
    }

    return 0;
}


2)
1 1 1 1 1
2 2 2 2 2
3 3 3 3 3
4 4 4 4 4 
5 5 5 5 5

#include <stdio.h>
#include <conio.h>

int main() {
    int i, j;

    for (i = 1; i <= 5; i++) {
        for (j = 1; j <= 5; j++) {
            printf("%d ", i);
        }
        printf("\n");
    }

    return 0;
}


3)
1 2 3 4 5
1 2 3 4 5
1 2 3 4 5
1 2 3 4 5

#include <stdio.h>
#include <conio.h>

int main() {
    int i, j;

    for (i = 1; i <= 4; i++) {
        for (j = 1; j <= 5; j++) {
            printf("%d ", j);
        }
        printf("\n");
    }

    return 0;
}


4)
 1
 1 2 
 1 2 3
 1 2 3 4
 1 2 3 4 5

#include <stdio.h>
#include <conio.h>

int main() {
    int i, j;

    for (i = 1; i <= 5; i++) {
        for (j = 1; j <= i; j++) {
            printf("%d ", j);
        }
        printf("\n");
    }

    return 0;
}


5) 
 *
 * *
 * * *
 * * * *
 * * * * *

#include <stdio.h>
#include <conio.h>

int main() {
    int i, j;

    for (i = 1; i <= 5; i++) {
        for (j = 1; j <= i; j++) {
            printf("* ");
        }
        printf("\n");
    }

    return 0;
}


6)
 1
 2 2
 3 3 3
 4 4 4 4
 5 5 5 5 5

#include <stdio.h>
#include <conio.h>

int main() {
    int i, j;

    for (i = 1; i <= 5; i++) {
        for (j = 1; j <= i; j++) {
            printf("%d ", i);
        }
        printf("\n");
    }

    return 0;
}


7)
 1 2 3 4 5
 1 2 3 4
 1 2 3
 1 2
 1

#include <stdio.h>
#include <conio.h>

int main() {
    int i, j;

    for (i = 5; i >= 1; i--) {
        for (j = 1; j <= i; j++) {
            printf("%d ", j);
        }
        printf("\n");
    }

    return 0;
}


8) 
* * * * *
* * * * 
* * *
* *
*

#include <stdio.h>
#include <conio.h>

int main() {
    int i, j;

    for (i = 5; i >= 1; i--) {
        for (j = 1; j <= i; j++) {
            printf("* ");
        }
        printf("\n");
    }

    return 0;
}


9)
1 1 1 1 1
2 2 2 2
3 3 3
4 4
5

#include <stdio.h>
#include <conio.h>

int main() {
    int i, j;

    for (i = 1; i <= 5; i++) {
        for (j = 5; j >= i; j--) {
            printf("%d ", i);
        }
        printf("\n");
    }

    return 0;
}


10)
	1
      1 2
    1 2 3
  1 2 3 4
1 2 3 4 5

#include <stdio.h>
#include <conio.h>

int main() {
    int i, j, k;

    for (i = 1; i <= 5; i++) {
        for (k = 1; k <= 5 - i; k++) {
            printf("   ");
        }
        for (j = 1; j <= i; j++) {
            printf("%2d ", j);
        }
        printf("\n");
    }

    return 0;
}

11)
	*
      * *
    * * *
  * * * *
* * * * *

#include <stdio.h>
#include <conio.h>

int main() {
    int i, j, k;

    for (i = 1; i <= 5; i++) {
        for (k = 1; k <= 5 - i; k++) {
            printf("   ");
        }
        for (j = 1; j <= i; j++) {
            printf("* ");
        }
        printf("\n");
    }

    return 0;
}



12)
	1
      2 2
    3 3 3
  4 4 4 4
5 5 5 5 5

#include <stdio.h>
#include <conio.h>

int main() {
    int i, j, k;

    for (i = 1; i <= 5; i++) {
        for (k = 1; k <= 5 - i; k++) {
            printf("   ");
        }
        for (j = 1; j <= i; j++) {
            printf("%d  ", i);
        }
        printf("\n");
    }

    return 0;
}


13)
1 2 3 4 5
  1 2 3 4
    1 2 3
      1 2
	1

#include <stdio.h>
#include <conio.h>

int main() {
    int i, j, k;

    for (i = 5; i >= 1; i--) {
        for (k = 1; k < i; k++) {
            printf("  ");
        }
        for (j = 1; j <= 6 - i; j++) {
            printf("%d ", j);
        }
        printf("\n");
    }

    return 0;
}



14)
* * * * *
  * * * *
    * * *
      * *
	*

#include <stdio.h>
#include <conio.h>

int main() {
    int i, j, k;

    for (i = 5; i >= 1; i--) {
        for (k = 1; k < i; k++) {
            printf("  ");
        }
        for (j = i; j <= 5; j++) {
            printf("* ");
        }
        printf("\n");
    }

  return 0;
}


15)
1 1 1 1 1
  2 2 2 2
    3 3 3
      4 4
	5

#include <stdio.h>
#include <conio.h>

int main() {
    int i, j, k;

    for (i = 1; i <= 5; i++) {
        for (k = 1; k < i; k++) {
            printf("  ");
        }
        for (j = i; j <= 5; j++) {
            printf("%d ", i);
        }
        printf("\n");
    }

    return 0;
}