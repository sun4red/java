package p2023_07_20;

public class Shared {
    public static void main( String[] args ) {
    
        StaticCount sc1 = new StaticCount();
        System.out.println("sc1.number = " + sc1.number);
        
        sc1.number++; // 이 값이 공유가된다.
        System.out.println("sc1.number = " + sc1.number);
        
        StaticCount sc2 = new StaticCount();
        System.out.println("sc2.number = " + sc2.number);
        
        sc2.number++;
        System.out.println("sc2.number = " + sc2.number);
        
        StaticCount.number ++;
        System.out.println(StaticCount.number);
        
    }
}
            
        
        
        