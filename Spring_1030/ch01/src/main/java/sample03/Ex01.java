package sample03;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.FileSystemXmlApplicationContext;

public class Ex01 {
	public static void main(String[] args) {
//		 BeanFactory bf = new XmlBeanFactory(new FileSystemResource("beans01.xml"));
		ApplicationContext bf = new FileSystemXmlApplicationContext("beans01.xml");
		// MessageBean mb = bf.getBean("mb", MessageBean.class);
		MessageBean mb = (MessageBean) bf.getBean("mb");
							// 오브젝트 객체로 주기 때문에 다운캐스팅
		// MessageBean mb = bf.getBean(MessageBean.class);
		// MessageBean mb = (MessageBean)bf.getBean("a");
		mb.sayHello("Spring");
	}
}