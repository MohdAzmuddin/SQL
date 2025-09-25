class Solution {
    public int numSquares(int n) {
        // dp[i] = minimum number of perfect squares to sum up to i
        int[] dp = new int[n + 1];
        
        // Initialize with large number
        for (int i = 1; i <= n; i++) {
            dp[i] = Integer.MAX_VALUE;
        }

        // Precompute all perfect squares ≤ n
        for (int i = 1; i * i <= n; i++) {
            int square = i * i;
            for (int j = square; j <= n; j++) {
                dp[j] = Math.min(dp[j], dp[j - square] + 1);
            }
        }

        return dp[n];
    }
}
