package test;

public class T091101 {
	public static void main(String[] args) {
		
	
  String pdate = "2020.10.10";
  String tdate = "2021.08.20";
 
  String[] m = new String[6];
  m.
  
  
int x = m.length;
System.out.println(x);
		  
  
  int pd = (
		  (Integer.parseInt(tdate.substring(0,4)) 
		  - Integer.parseInt(pdate.substring(0,4))
		  )*12
		  
		  + Integer.parseInt(tdate.substring(5,7))
		  - Integer.parseInt(pdate.substring(5,7))
			)*28
		  + Integer.parseInt(tdate.substring(8,9))
		  - Integer.parseInt(pdate.substring(8,9));
  
  
  System.out.println(pd);
  
	}
}