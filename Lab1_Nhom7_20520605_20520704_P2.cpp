#include <iostream>

using namespace std;

// write function bitAnd
// de morgan
int bitAnd(int x, int y)
{
    return ~(~x | ~y);
}

// write function int negative not using -
// 5 -> -5
// 0101 after getting ~ 1010 + 1 = 1011
int negative(int x)
{
    return ~x + 1;
}

// write function getBit
// 0000 0101 get pos number 1
// >> 1 time:  0000 0010
// & mask 1 to get 0
int getBit(int x, int n)
{
    return (x >> n) & 1;
}

// write function divpw2(x,n)
// move n bit
int divpw2(int x, int n)
{
    return x << (~n + 1);
}

// write function modulo 2n(x,n)
// n is the bit of modulo power 2
int modul2n(int x, int n)
{
    // return (x & (1 << n) + negative(1));
    return x & ((1 << n) + negative(1));
}

// write function nt isEven(x)
// xxxx xxx0 is Even
int isEven(int x)
{
    return (!(x & 1));
}

// write function int is16x(x)

// xxxx 0000 is 16x
int is16x(int x)
{
    return (!(x & 0xF));
}

// write function int isPositive(x)
// (x & (1 << 31)) neg
// !x 0

int isPositive(int x)
{
    return !((x & (1 << 31)) | !x);
}

// write function int isLess2n(int x, int n)
// 0000 0001 -> 0000 0010
// 8 -> 0000 1000
// x & (1 << n) -> 0000 0000
// turn 1
int isLess2n(int x, int n)
{
    return !(x & (1 << n));
}

int main(int argc, char **argv)
{
    float score = 0;
    int c;
    // check ket qua cac ham dua tren cac phep thu
    // 1.1
    printf("=== PART 1\n");
    printf("1.1 - bitAnd()\t\t");
    if (bitAnd(3, -9) == 3 & -9)
    {
        printf("Pass.\n");
        score += 1;
    }
    else
        printf("Failed. Please check again.\n");

    // 1.2
    printf("1.2 - negative()\t");
    if (negative(0) == 0 && negative(9) == -9 && negative(-5) == 5)
    {
        printf("Pass.\n");
        score += 1;
    }
    else
        printf("Failed. Please check again.\n");

    // 1.3
    printf("1.3 - getBit()\t\t");
    if (getBit(8, 3) == 1 && getBit(5, 0) == 1 && getBit(32, 3) == 0)
    {
        printf("Pass.\n");
        score += 2;
    }
    else
        printf("Failed. Please check again.\n");

    // 1.4
    printf("1.4 - divpw2()\t\t");
    if (divpw2(10, -1) == 20 && divpw2(15, -2) == 60 && divpw2(2, -4) == 32)
    {
        // printf("Pass.\n");
        cout << "Pass.\n";
        score += 2;
    }
    else
        printf("Failed. Please check again.\n");

    // 1.5
    printf("1.5 - modul2n()\t\t");
    if (modul2n(2, 1) == 0 && modul2n(30, 2) == 2 && modul2n(63, 6) == 63)
    {
        printf("Pass.\n");
        score += 4;
    }
    else
        printf("Failed. Please check again.\n");

    // 2.1
    printf("\n===Part 2\n");
    printf("2.1 - isEven()\t\t");
    if (isEven(2) && !isEven(5) && isEven(8))
    {
        printf("Pass.\n");
        score += 2;
    }
    else
        printf("Failed. Please check again.\n");

    // 2.2
    printf("2.2 - is16x()\t\t");
    if (is16x(16) && !is16x(15) && is16x(0))
    {
        printf("Pass.\n");
        score += 2;
    }
    else
        printf("Failed. Please check again.\n");

    // 2.3
    printf("2.3 - isPositive()\t");
    if (isPositive(10) && !isPositive(-5) && !isPositive(0))
    {
        printf("Pass.\n");
        score += 3;
    }
    else
        printf("Failed. Please check again.\n");

    // 2.4
    printf("2.4 - isLess2n()\t");
    if (isLess2n(12, 4) && !isLess2n(8, 3) && !isLess2n(15, 2))
    {
        printf("Pass.\n");
        score += 3;
    }
    else
        printf("Failed. Please check again.\n");

    score = (float)score / 2;

    printf("\n===\nYour final score: %.1f\n", score);
    if (score == 10)
        printf("Exellent!! You've got a genious mind and solved all problems. Want more? :)))");
    else if (score < 10 && score >= 8)
        printf("Good job! You're so closed, try more to solve failed problem(s).");
    else if (score < 8 && score >= 5)
        printf("Nice try! Think more carefully about your solutions.");
    else
        printf("Got any trouble in solving these problems? Contact your lecturer for some hints :)");
}