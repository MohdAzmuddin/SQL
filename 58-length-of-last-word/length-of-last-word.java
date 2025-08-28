class Solution {
    public int lengthOfLastWord(String s) {
        // remove spaces from start and end
        s = s.trim();  
        
        // split the string by spaces
        String[] words = s.split(" ");  
        
        // get the last word
        String lastWord = words[words.length - 1];  
        
        // return its length
        return lastWord.length();  
    }
}
