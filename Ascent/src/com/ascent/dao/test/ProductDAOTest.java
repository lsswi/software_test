package com.ascent.dao.test;
import java.util.List;
import com.ascent.dao.ProductDAO;
import junit.framework.Assert;
import junit.framework.TestCase;
/**
 * 商品模块功能实现测试类
 * @author ascent
 *
 */
public class ProductDAOTest extends TestCase {
	private ProductDAO productDAO;
	/**
	 * 单元测试初始化执行方法
	 */
	protected void setUp() throws Exception {
		productDAO = new ProductDAO();
	}
	/**
	 * 单元测试释放资源方法
	 */
	protected void tearDown() throws Exception {
		productDAO = null;
	}
	/**
	 * 查询所有商品方法测试
	 */
	public void testGetallProduct() {
		//调用查询所有商品业务方法
		List list = productDAO.getallProduct();
		/**
		 * 数据库  商品表中一共7条记录
		 * 判断期望值7  和 实际值list.size()是否相等
		 */
		Assert.assertEquals(7, list.size());
	}

}
