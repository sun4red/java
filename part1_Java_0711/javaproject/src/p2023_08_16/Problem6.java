package p2023_08_16;

import java.util.Iterator;
import java.util.Set;
import java.util.TreeSet;

public class Problem6 {

	public static void main(String[] args) {

		Set lotto = new TreeSet();

		for (int i = 0; lotto.size() < 6; i++) {

			int random = (int) (Math.random() * 45 + 1);
			lotto.add(random);

		}

		Iterator it = lotto.iterator();
		while (it.hasNext()) {
			System.out.print(it.next() + "\t");
		}

	}

}
