#include <stdio.h>
#include <math.h>

int factorial(int n) {
    if (n == 0 ) {
        return 1;   
    } else {
        return n * factorial(n - 1);   
    }
}

double find_sh(double x) {
    double next = 0;
    double previous = 0;
    int n = 0;
    while (0 == 0) {
        next += pow(x, (2 * n + 1) * 1.0) / (factorial(2 * n + 1) * 1.0);   
        if (fabs(next - previous) * 1000 <= fabs(next)) {
            return next;
        } else {
            previous += pow(x, (2 * n + 1) * 1.0) / (factorial(2 * n + 1) * 1.0);
            n++;   
        }
    }
}

double find_ch(double x) {
    double next = 0;
    double previous = 0;
    int n = 0;
    while (0 == 0) {
        next += pow(x, (2 * n) * 1.0) / (factorial(2 * n) * 1.0);   
        if (fabs(next - previous) * 1000 <= fabs(next)) {
            return next;
        } else {
            previous += pow(x, (2 * n) * 1.0) / (factorial(2 * n) * 1.0);
            n++;   
        }
    }
}

int main() {
    printf("Enter a number 'x' satisfying the inequality: 0 < |x| < Pi: ");
    double x;
    scanf("%lf",&x);
    if (x == 0 || fabs(x) >= M_PI) {
        printf("Incorrect data");
    } else {
        printf("cth(x) = %lf\n", find_ch(x) / find_sh(x));
    }
    return 0;
}