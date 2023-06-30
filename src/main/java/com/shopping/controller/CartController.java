package com.shopping.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.shopping.ajax.JasonResult;
import com.shopping.service.CartService;
import com.shopping.vo.AddressVO;
import com.shopping.vo.CartVO;
import com.shopping.vo.CustomerVO;
import com.shopping.vo.OrderVO;
import com.shopping.vo.ProductVO;

@RequestMapping("/cart")
@Controller
public class CartController {

	@Autowired
	CartService cartService;
	
	
	/*카트 보기*/
	@RequestMapping(value ="/viewCart")
	public String viewCart(@RequestParam(value = "customerNo", required = false, defaultValue= "0") int customerNo
							, Model model) { 
			System.out.println("viewCart()");
		
		
			List<ProductVO> cartList = cartService.viewCart(customerNo);
			model.addAttribute("cartList", cartList);

			return "product/cart";
		}
	
	
	
	/*카트에 제품 추가*/
	@ResponseBody
	@RequestMapping(value ="/addCart", method = RequestMethod.POST )
	public JasonResult addCart(@ModelAttribute CartVO cartVO) {
		
		System.out.println("addCart()");
		JasonResult jasonResult = new JasonResult();
		
		/* 추가한 제품 수량 리턴*/
		int productCnt = cartService.addCart(cartVO);
		jasonResult.success(productCnt);
		
		return jasonResult;
		
	}
	
	
	/* 카트에 있는 제품 삭제 */
	@ResponseBody
	@RequestMapping(value="/deleteList", method =RequestMethod.POST)
	public JasonResult deleteList(@ModelAttribute CartVO cartVO) { 
		
		System.out.println("deleteList()");
		JasonResult jasonResult = new JasonResult();
		
		boolean result = cartService.deleteList(cartVO);
		jasonResult.success(result);
		
		return jasonResult;
	}
	

	
	/*주문 데이터 추가*/
	@ResponseBody
	@RequestMapping(value = "/addOrder", method = RequestMethod.POST)
	public JasonResult addOrders(@RequestParam String jsonData
								,HttpSession session) {
		System.out.println("addOrders()");
		JasonResult jasonResult = new JasonResult();

	    //직렬화 시켜 가져온 오브젝트 배열을 JSONArray 형식으로 바꿔준다.
	    JSONArray jsonArray = new JSONArray(jsonData);
	    List<ProductVO> productList = new ArrayList<ProductVO>();
	    int totalPrice = 0;
	    
	    for(int i=0; i<jsonArray.length(); i++){
	    	ProductVO productVO = new ProductVO();
	        
	        //JSONArray 형태의 값을 가져와 JSONObject 로 풀어준다.    
	        JSONObject obj = (JSONObject)jsonArray.get(i);
	                
	        productVO.setProductNo((int)obj.get("productNo"));
	        productVO.setProductEa((int)obj.get("productEa"));
	        productVO.setPrice((int)obj.get("price"));
	        totalPrice += (int)obj.get("price");
	        
	        productList.add(productVO);
	    }
		
	    CustomerVO loginCustomer = (CustomerVO)session.getAttribute("authCustomer");
	    OrderVO orderVO = new OrderVO();
	    orderVO.setProductList(productList);
	    orderVO.setCustomerNo(loginCustomer.getCustomerNo());
	    orderVO.setTotalPrice(totalPrice);
	    
	    boolean result = cartService.addOrder(orderVO);
	    jasonResult.success(result);
	    
		return jasonResult;
	}
	
	/*바로 구매*/
	@RequestMapping(value ="/addOrderOne" , method = RequestMethod.GET)
	public String addOrderOne(@ModelAttribute ProductVO productVO
							,@ModelAttribute OrderVO orderVO) {
		
		System.out.println("addOrderOne()");
		
		List<ProductVO> list = new ArrayList<>();
		list.add(productVO);
		orderVO.setProductList(list);
		boolean result = cartService.addOrder(orderVO);
		
		return "redirect:orderPage/"+ orderVO.getCustomerNo() ;
	}
	
	
	/*고객이 카트에 담은 제품 정보*/
	@RequestMapping(value ="/orderPage/{customerNo}", method = RequestMethod.GET)
	public String orderPage(@PathVariable String customerNo
							, Model model) {
		
		Map<String, Object> orderInfo = cartService.getOrderInfo(customerNo);
		
		model.addAttribute("orderInfo", orderInfo.get("orderInfo"));
		model.addAttribute("addressList", orderInfo.get("addressList"));
		
		
		return "/product/orderPage";
	}//orderPage

	
	@ResponseBody
	@RequestMapping(value ="/addAddress", method = RequestMethod.POST)
	public JasonResult addAddress(@ModelAttribute AddressVO addressVO) {
		
		JasonResult jasonResult = new JasonResult();
		boolean result = cartService.addAdress(addressVO);
		
		jasonResult.success(result);
		
		return jasonResult;
	}

}
