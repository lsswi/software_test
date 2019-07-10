package com.ascent.dao.test;

import java.sql.SQLException;
import java.util.List;

import junit.framework.TestCase;
import junit.framework.Assert;
import com.ascent.dao.OrderDAO;
/**
 * 订单单元测试类
 * @author ascent
 *
 */
public class OrderDAOTest extends TestCase {
	private OrderDAO orderDAO;
	protected void setUp() throws Exception {
		orderDAO = new OrderDAO();
	}

	protected void tearDown() throws Exception {
		orderDAO = null;
	}
	//查询所有订单测试方法
	public void testOrderAllList() {
		List list=null;
		try {
			list = orderDAO.OrderAllList();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		/**
		 * 数据库中订单为3个  期望值3
		 */
		Assert.assertEquals(3, list.size());
	}

}
