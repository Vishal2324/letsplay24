package com.letsplay24;

import java.security.cert.CRL;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.util.UriComponentsBuilder;

import com.letsplay24.cart.Cart;
import com.letsplay24.cart.CartDAO;

@RestController
public class RESTController {

	@Autowired
	CartDAO cdao;
	
	@RequestMapping(value="/getAllItemsInCart",method=RequestMethod.POST)
	public ResponseEntity<String> getAllItemsInCart()
	{
		JSONArray jsonArray = new JSONArray();
		
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	    if (auth != null && !auth.getName().equals("anonymousUser"))
	    {    
	    	System.out.println(auth.getName());
	    	String user = (auth.getName());
	    	
	    	List<Cart> list = cdao.getCartByUserName(user);
	    	
	    	for(Cart c:list)
	    	{
	    		jsonArray.add(c.toJSON());
	    	}
	    }
		
		return new ResponseEntity<String>(jsonArray.toJSONString(),HttpStatus.OK);
	}
	
@RequestMapping(value="/deleteAllFromCart",method=RequestMethod.POST)
public ResponseEntity<String> deleteAllFromCart()
{
	
	Authentication auth = SecurityContextHolder.getContext().getAuthentication();
    if (auth != null && !auth.getName().equals("anonymousUser"))
    {    
    	System.out.println(auth.getName());
    	String user = (auth.getName());
    	
    	List<Cart> list = cdao.getCartByUserName(user);
    	
    	for(Cart c:list)
    	{
    		cdao.delete(c.getID());
    	}
    }
	
	JSONObject jsonObject = new JSONObject();
	
	jsonObject.put("deleted", "deleted");
	
	return new ResponseEntity<String>(jsonObject.toJSONString(),HttpStatus.OK);
}
	
	
	@RequestMapping(value="/deleteFromCart",method=RequestMethod.POST)
	public ResponseEntity<String> deleteFromCart(@RequestBody String data)
	
	{
		System.out.println(data);
		
		int cartId = Integer.parseInt(data);
		
		cdao.delete(cartId);
		
		JSONObject jsonObject = new JSONObject();
		
		jsonObject.put("deleted", "deleted");
		
		return new ResponseEntity<String>(jsonObject.toJSONString(),HttpStatus.OK);
	}
	
	@RequestMapping(value="/updateAddresses",method=RequestMethod.POST)
	public ResponseEntity<String> updateAddresses(@RequestBody String data)
	{
		System.out.println(data);
		
		JSONParser jsonParser = new JSONParser();
		
		try {
			JSONObject addressDetails = (JSONObject)jsonParser.parse(data);
			
			String shippingAddress = addressDetails.get("shippingAddress").toString();
			String billingAddress = addressDetails.get("billingAddress").toString();
			
			Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		    if (auth != null && !auth.getName().equals("anonymousUser"))
		    {    
		    	System.out.println(auth.getName());
		    	String user = (auth.getName());
		    	
		    	List<Cart> list = cdao.getCartByUserName(user);
		    	
		    	for(Cart c:list)
		    	{
		    		c.setAddress(shippingAddress);
		    		c.setBillingAddress(billingAddress);
		    		
		    		cdao.update(c);
		    	}
		    }
			
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		JSONObject jsonObject = new JSONObject();
		
		jsonObject.put("updated", "updated");
		
		return new ResponseEntity<String>(jsonObject.toJSONString(),HttpStatus.OK);
	}
	
}
