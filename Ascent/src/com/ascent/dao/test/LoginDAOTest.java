package com.ascent.dao.test;
import com.ascent.bean.Productuser;
import com.ascent.dao.LoginDAO;
import junit.framework.Assert;
import junit.framework.TestCase;
/**
 * 登录测试类
 * @author ascent
 *
 */
public class LoginDAOTest extends TestCase {
	private LoginDAO loginDAO;
	/**
	 * 在测试方法执行前执行
	 */ 
	protected void setUp() throws Exception {
		loginDAO = new LoginDAO();
	}
	/**
	 * 执行测试方法后释放资源
	 */
	protected void tearDown() throws Exception {
		loginDAO = null;
	}

	/**
	 * LoginDAO类中login方法对应的单元测试方法
	 */
	public void testLogin() {
		//用户ascentuser 密码123456 存在
		Productuser pu = loginDAO.login("ascentuser","123456");	
		/**
		 * 测试pu不为null的断言,如果pu为null登录查询失败
		 * 业务方法有误,测试失败,显示“查询错误”
		 * 如果测试正确，显示绿色成功进度条
		 */
		Assert.assertNotNull("查询错误",pu);
	}

}
