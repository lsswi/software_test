package com.ascent.util;
import java.util.ArrayList;
/**
 * @author Administrator
 * @version 负责页面控制的 JavaBean
 */
public class PageBean {			
	public int currentPage;				// 当前页数
	public int totalPage;				// 总页数
	public int totalRows;				// 总行数
	public int rowsPage = 5;			// 每页显示多少行
	public ArrayList data;				// 封装页面显示的数据
	public PageBean(){}
	public void countTotalPage(){		// 计算总页数
		if(totalRows%rowsPage==0){
			this.totalPage = totalRows/rowsPage;
		}
		else{
			this.totalPage = totalRows/rowsPage + 1;
		}
	}
	public ArrayList getData(){		
		return data;
	}
	
	public PageBean(int totalRows){
		this.totalRows = totalRows;
		this.countTotalPage();
	}
}
