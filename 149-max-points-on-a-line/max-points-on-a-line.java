import java.util.*;

class Solution {
    public int maxPoints(int[][] points) {
        if (points.length <= 2) return points.length;

        int maxPoints = 0;

        for (int i = 0; i < points.length; i++) {
            Map<String, Integer> slopeCount = new HashMap<>();
            int duplicate = 0;
            int localMax = 0;

            for (int j = i + 1; j < points.length; j++) {
                int dx = points[j][0] - points[i][0];
                int dy = points[j][1] - points[i][1];

                // Handle duplicate points
                if (dx == 0 && dy == 0) {
                    duplicate++;
                    continue;
                }

                // Reduce dx, dy by gcd to avoid floating precision issues
                int gcd = gcd(dx, dy);
                dx /= gcd;
                dy /= gcd;

                // Normalize slope: ensure uniqueness for negative slopes
                if (dx < 0) {
                    dx = -dx;
                    dy = -dy;
                } else if (dx == 0) { // vertical line
                    dy = 1;
                } else if (dy == 0) { // horizontal line
                    dx = 1;
                }

                String slopeKey = dx + "/" + dy;
                slopeCount.put(slopeKey, slopeCount.getOrDefault(slopeKey, 0) + 1);
                localMax = Math.max(localMax, slopeCount.get(slopeKey));
            }

            maxPoints = Math.max(maxPoints, localMax + duplicate + 1);
        }

        return maxPoints;
    }

    private int gcd(int a, int b) {
        if (b == 0) return a;
        return gcd(b, a % b);
    }
}
