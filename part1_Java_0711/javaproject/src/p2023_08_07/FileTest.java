package p2023_08_07;

// File 클래스는 데이터들이 입.출력 하면서 사용하는 파일이나
// 디렉토리 체제를 관리하는 클래스임.
import java.io.File;

public class FileTest {

    public static void main( String[] args ) {
	try {
	    // File 객체 생성
		// c:/java01/temp 폴더가 생성되고, 현 위치 하위에 
		//  test폴더가 생성됨
	    File temp = new File( "C:/java01", "temp" );
	    File tempFile = new File( "test" );

	    // 디렉토리 생성(mkdirs()는 디렉토리를 만들면 true를 
		// 반환함)
	    System.out.println( "create directory state : " + temp.mkdirs() );
	    System.out.println( "create directory state : " + tempFile.mkdirs() );

	    // 1. 디렉토리 삭제! : 비어있는 디렉토리가 삭제됨
	    tempFile.delete();
	    // 자식 디렉토리만 삭제가됨
	    // test 디렉토리가 지워짐, 폴더내에 다른 파일들이 있으면 지워지지않음
	    
	    // 2. 비어있지 않은 디렉토리 삭제(과제)
	    
	    // 3. 자식 디렉토리 삭제? 
	    temp.delete(); // temp 디렉토리 삭제
	    
	    // 4. 부모 디렉토리 삭제
	    temp.getParentFile().delete();
	    
	    // 과제 -------------------------------
	    
	    File[] fl =  tempFile.listFiles();
	    
	    for (int i = 0 ; i < fl.length ; i++) {
	    	System.out.println("삭제 파일 : " + fl[i]);
	    	fl[i].delete();
	    }
	    tempFile.delete();
	    System.out.println("폴더 확인 : "+tempFile.exists());
	    System.out.println("삭제완료");
	    
	    // 과제 -------------------------------
	    
	    // File 클래스에서 제공하는 메소드로 파일 시스템에 대한 
		// 여러가지 정보를 얻을수 있음
		
	    System.out.println( "temp canRead : " + temp.canRead() );
	    System.out.println( "temp canWrite : " + temp.canWrite() );
	    System.out.println( "temp getAbsoluteFile : " + temp.getAbsoluteFile());
	    System.out.println( "temp getName : " + temp.getName() );
	    System.out.println( "temp getParent : " + temp.getParent() );
	    System.out.println( "temp getPath : " + temp.getPath() );
	    System.out.println( "temp isDirectory : " + temp.isDirectory() );
	    System.out.println( "temp isFile : " + temp.isFile() );	// 파일이 없으면 false, 있으면 true
        } catch ( Exception e ) {
	}
    }
}
