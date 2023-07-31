package p2023_07_31;

import java.util.Iterator;
import java.util.TreeSet;

public class TreeSetTest {
	
	// TreeSet
	// 1. 데이터를 오름차순으로 정렬해서 저장하고 출력하는 기능을 제공.
	// 2. 중복데이터는 저장하지 않음
	// 
	
	// 오름차순 정렬 						내림차순 정렬
	// 숫자 : 작은숫자 -> 큰 숫자 ex) 1,2,3 / 큰숫자부터 작은숫자 순
	// 문자 : 사전순 정렬 ex) a, b, c, ..  / 사전 역순
	
	
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		TreeSet hs = new TreeSet();
		
		// 추가가 잘 되면 true값 return, 중복값은 false
		if(hs.add("korea")){
			System.out.println("첫 번째 korea 추가 성공");
		}
		else{
			System.out.println("첫 번째 korea 추가 실패");
		}
		if(hs.add("japan")){
			System.out.println("japan 추가 성공");
		}
		else{
			System.out.println("japan 추가 실패");
		}
		if(hs.add("america")){
			System.out.println("america 추가 성공");
		}
		else{
			System.out.println("america 추가 실패");
		}
		if(hs.add("britain")){
			System.out.println("britain 추가 성공");
		}
		else{
			System.out.println("britain 추가 실패");
		}
		if(hs.add("korea")){	// 중복 데이터 저장 불가 false값 출력
			System.out.println("두 번째 korea 추가 성공");
		}
		else{
			System.out.println("두 번째 korea 추가 실패");
		}
		// 반복자 Iterator
		Iterator it = hs.iterator();
		
		while(it.hasNext()){
			System.out.println(it.next());
			// next(); : 데이터를 1개씩 가져오는 역할
		}		
	}
}
