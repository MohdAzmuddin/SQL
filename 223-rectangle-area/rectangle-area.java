class Solution {
    public int computeArea(int ax1, int ay1, int ax2, int ay2,
                           int bx1, int by1, int bx2, int by2) {
        
        // Area of first rectangle
        int areaA = (ax2 - ax1) * (ay2 - ay1);
        
        // Area of second rectangle
        int areaB = (bx2 - bx1) * (by2 - by1);
        
        // Find overlap width
        int overlapWidth = Math.max(0, Math.min(ax2, bx2) - Math.max(ax1, bx1));
        
        // Find overlap height
        int overlapHeight = Math.max(0, Math.min(ay2, by2) - Math.max(ay1, by1));
        
        // Overlap area
        int overlap = overlapWidth * overlapHeight;
        
        // Total area
        return areaA + areaB - overlap;
    }
}
