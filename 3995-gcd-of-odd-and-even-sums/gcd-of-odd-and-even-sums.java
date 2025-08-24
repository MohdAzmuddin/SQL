class Solution {
    public int gcdOfOddEvenSums(int n) {
       //return n; 
        //gcd(n^2,n(n+1)) = n
          int sumOdd = n*n;
          int sumEven = n*(n+1);
          int rem;
          while(sumOdd%sumEven!=0){
            rem = sumOdd%sumEven;
            sumOdd = sumEven;
            sumEven = rem;
          }
          int gcd = sumEven;
          return gcd;
    }
}