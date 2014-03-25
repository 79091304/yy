package junit.test;

import com.ifeng.util.Util;



public class ResourcesServiceImplTest {

	/*@Test
	public void test() {
		        ApplicationContext ctx = new ClassPathXmlApplicationContext("spring-*.xml");  
		        ResourcesServiceImpl bean = (ResourcesServiceImpl)ctx.getBean("resourcesService");
		        bean.findAll();
		        bean.getById("1");
		        bean.getUserResources("1");
	}*/

	public static void main(String[] args) {
		String result = Util._callHttp("http://mm.yue.ifeng.com:8080/test/user/getUserInfoByToken.htm?", "source=fh&token=548704");
		System.out.println(result);
	}
}
