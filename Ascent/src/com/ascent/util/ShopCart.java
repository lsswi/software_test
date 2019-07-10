package com.ascent.util;

import java.util.HashMap;

import com.ascent.bean.Product;

public class ShopCart {
	
	private HashMap<String,Product> hashmap;

	
    public HashMap<String, Product> getHashmap() {
		return hashmap;
	}

	public void setHashmap(HashMap<String, Product> hashmap) {
		this.hashmap = hashmap;
	}

	public ShopCart ()
    {hashmap= new HashMap(); }
    
    /**
	 * 检查hashmap中是否有了该pid对应的对象方法
	 * @param pid
	 * @return true：有   false：无
	 */
    
     public boolean CheckHashMapid(String pid)
     {
    	 boolean b=false;
    	 if(hashmap.containsKey(pid))
    	 {
    		b=true; 
    	 }
    	 return b;
     }
     /**
      * 购物车添加商品方法
 	 * 在判断hashmap中没有pid对应商品是为false情况下添加product
 	 * @param pid
 	 * @param product
 	 */
 	public void addProduct(String pid,Product product){
 		if(hashmap==null){
 			hashmap= new HashMap();
 		}
 		if(hashmap.containsKey(pid)==false)//购物车中不存在该商品
    	 {
 			hashmap.put(pid, product);
    	 }
 		 
 	}
     
     /**
 	 * 根据id删除hashmap中的product
 	 * @param pid
 	 */
     public void removeHashMap(String pid)
     {
    	 hashmap.remove(pid);
     }

     /**
 	 * 修改hashmap中pid对应product的数量
 	 * @param pid
 	 * @param quantity
 	 */
     public void UpdateProductNumbedr(String pid,String quantity)
     {
    	  hashmap.get(pid).setQuantity(quantity);
     }
     
     /**
 	 * 清除购物车
 	 */
     public void emptyCart()
     {
    	 hashmap.clear();
     }
}
