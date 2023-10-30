package hell;
import hello.PackageHelloWorld;
//   import hello.*;
// hello 패키지에 있는 모든걸 불러온다~ 라는 뜻

public class UsePackageHelloWorld {

    public static void main( String[] args ) {
	PackageHelloWorld phw = new PackageHelloWorld();
	phw.printHello();
    }
}
