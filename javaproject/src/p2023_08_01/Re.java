package p2023_08_01;

import java.util.Iterator;
import java.util.Set;
import java.util.TreeSet;

public class Re {

	public static void main(String[] args) {
		Set lot = new TreeSet();

		for (int i = 0; lot.size() < 6; i++) {
			int ran = (int) (Math.random() * 45 + 1);
			lot.add(ran);
		}

		Iterator it = lot.iterator();

		System.out.print("로또번호 : ");
		while (it.hasNext()) {
			System.out.print(it.next() + "\t");
		}

	}

}
