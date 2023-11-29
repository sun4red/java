package test;

import java.util.Scanner;

public class T090801 {
public static void main(String[] args) {
	

	
	 Scanner sc = new Scanner(System.in);
     String a = "abcdeEWRmnoWTpqrst";
     
     for (int i=0; i< a.length(); i++){
    	 
    	 String aa = "";
    	 
         if (a.charAt(i) != a.toUpperCase().charAt(i)) {
        	 aa += Character.isUpperCase(a.charAt(i));
         } else {
        	 aa += Character.isLowerCase(a.charAt(i));
         }
         
         
         System.out.print(aa);
        	 
     }
	
}
}
