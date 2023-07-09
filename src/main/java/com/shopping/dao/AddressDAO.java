package com.shopping.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.shopping.vo.AddressVO;

@Repository
public class AddressDAO {
	
	@Autowired
	SqlSession session;
	
	/*저장된 고객 주소 가져오기*/
	public List<AddressVO> getCustomerAddress(String customerNo){
		System.out.println("getCustomerAddress DAO()");	
		List<AddressVO> addressList = session.selectList("address.getAddressList", customerNo);
		
		return addressList; 
	}
	/*저장된 고객의 주소 수량 세기(최대 3개 저장 가능)*/
	public int addressCount(AddressVO addressVO) {
		System.out.println("addressCount DAO()");	
		int cnt = session.selectOne("address.AddressCnt", addressVO);

		return cnt;
	}
	
	/*오래된 주소 삭제*/
	public int deleteOldAddress(AddressVO addressVO) {		      
		System.out.println("deleteOldAddress DAO()");
	    int rows = session.delete("address.deleteAddress",addressVO);
	    
		return rows;
	}
	   
	/*주소 추가*/
	public int insertAddress(AddressVO addressVO) {
		System.out.println("insertAddress DAO()");
		int row = session.insert("address.insertAddress", addressVO);

		return row;
	}
	
	
	
}
