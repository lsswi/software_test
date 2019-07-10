package com.ascent.test;

import com.ascent.dao.test.ProductDAOTest;

import junit.framework.Test;
import junit.framework.TestSuite;
/**
 * 测试套件
 * @author ascent
 *
 */
public class AcesysDAOTest {
	public static Test suite() {
		TestSuite suite = new TestSuite("Test for acesys");
		// $JUnit-BEGIN$
		//添加ProductDAOTest测试类
		suite.addTestSuite(ProductDAOTest.class);
		
		//这里还可以添加其他测试类
		
		// $Junit-END$
		return suite;
	}

}
