class Solution {
public:
    string convertToTitle(int columnNumber) {
        string result = "";
        while(columnNumber>0){
            columnNumber--;  // adjust because Excel is 1-indexed
            int rem = columnNumber%26;
            char c = 'A'+rem;
            result = c + result;
            columnNumber = columnNumber/26;
        }
        return result;
    }
};