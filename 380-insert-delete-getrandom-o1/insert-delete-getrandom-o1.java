import java.util.*;

class RandomizedSet {
    private Map<Integer, Integer> map; // value -> index
    private List<Integer> list;        // store values
    private Random rand;

    public RandomizedSet() {
        map = new HashMap<>();
        list = new ArrayList<>();
        rand = new Random();
    }
    
    public boolean insert(int val) {
        if (map.containsKey(val)) {
            return false; // already present
        }
        map.put(val, list.size());
        list.add(val);
        return true;
    }
    
    public boolean remove(int val) {
        if (!map.containsKey(val)) {
            return false;
        }
        int idx = map.get(val);
        int lastVal = list.get(list.size() - 1);
        
        // swap val with last element
        list.set(idx, lastVal);
        map.put(lastVal, idx);
        
        // remove last
        list.remove(list.size() - 1);
        map.remove(val);
        
        return true;
    }
    
    public int getRandom() {
        int randomIndex = rand.nextInt(list.size());
        return list.get(randomIndex);
    }
}
