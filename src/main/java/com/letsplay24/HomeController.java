package com.letsplay24;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.letsplay24.cart.Cart;
import com.letsplay24.cart.CartDAO;
import com.letsplay24.category.Category;
import com.letsplay24.category.CategoryDAO;
import com.letsplay24.product.Product;
import com.letsplay24.product.ProductDAO;
import com.letsplay24.user.User;
import com.letsplay24.user.UserDAO;

@Controller
public class HomeController {
	@Autowired
	CategoryDAO cdao;
	@Autowired
	ProductDAO pdao;
	@Autowired
	UserDAO udao;
	@Autowired
	ServletContext context;
	@Autowired
	CartDAO crdao;
	
	@RequestMapping("/index")  
	public String index()
	{
	return "index";
	}
	
	public String test()
	{
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	    if (auth != null && !auth.getName().equals("anonymousUser"))
	    {    
	    	System.out.println(auth.getName());
	    	//System.out.println("User present");
	    	return "false";
	    }
	    else
	    {
	    	System.out.println("User not present");
	    	return "true";
	    }
	 	
	}
	
	@RequestMapping("/head")  
	public String head()
	{
	return "head";
	}
	
	@RequestMapping("/head-meta")  
	public String head_meta()
	{
	return "head-meta";
	}
	
	@RequestMapping("/")  
	public String home1()
	{
	return "home";
	}
	

	@RequestMapping(value="/categories")
	public ModelAndView categories()
	{
		ModelAndView mav = new ModelAndView("categories");
		
		
		List<Category> list = cdao.getCategories();
		
		JSONArray jarr = new JSONArray();
		
		for( Category c: list )
		{
			JSONObject jobj = new JSONObject();
			
			jobj.put("CategoryId", c.getId());
			jobj.put("CategoryName", c.getName() );
			jobj.put("CategoryDescription", c.getDescription() );
			
			jarr.add(jobj);
		}
		
		System.out.println(jarr.toJSONString());
		
		mav.addObject("CategoryJSON", jarr.toJSONString());
		
		return mav;
	}
	
	@RequestMapping("/addcategory")
	public ModelAndView addcategory()
	{
		ModelAndView model= new ModelAndView("addcategories");
		
		model.addObject("category", new Category());
		return model;
				
	}
	
	@RequestMapping("/updatecategory/{id}")
	public ModelAndView updatecategory( @PathVariable("id") int id )
	{
		ModelAndView model= new ModelAndView("updatecategories");
		
		model.addObject("category", cdao.getCategories(id)  );
		return model;
				
	}
	
	@RequestMapping(value="/AddCategoryToDB" , method=RequestMethod.POST)
	public String AddCategoryToDB( @ModelAttribute("Category") Category c ){
				
		//System.out.println(c.getcName());
		cdao.insert(c);
		
		return "redirect:/categories";
	}
	
	@RequestMapping(value="/UpdateCategoryToDB" , method=RequestMethod.POST)
	public String UpdateCategoryToDB( @ModelAttribute("Category") Category c ){
				
		Category c1 = cdao.getCategories(c.getId());
		
		//System.out.println(c.getcName());
		cdao.update(c);
		
		List<Product> list = pdao.getproducts();
		
		for( Product p : list )
		{
			if( p.getCategory().equals(c1.getName()) )
			{
				p.setCategory(c.getName());
				
				pdao.update(p);
			}
		}
		
		return "redirect:/categories";
	}
	
	@RequestMapping(value="/DeleteCategoryFromDB", method=RequestMethod.POST)
	public String DeleteCategory(@RequestParam("text") int cId){
		System.out.println(cId);
		
		Category c = cdao.getCategories(cId);
		
		//Category c = cdao.getCategories(cId);
		cdao.delete(cId);
		
		List<Product> list = pdao.getproducts();
		
		for( Product p : list )
		{
			if( p.getCategory().equals(c.getName()) )
			{
				p.setCategory("-");
				
				pdao.update(p);
			}
		}
		
		return "redirect:/categories";

		}
	@RequestMapping("/home")  
	public String home()
	{
	return "home";
	}
	@RequestMapping("/loginpage")  
	public String login()
	{
	return "login";
	}
	@RequestMapping("/signup")  
	public ModelAndView signup()
	{
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("User", new User());
		
		return mav;
	}
	@RequestMapping("/contactus")  
	public String contactus()
	{
	return "contactus";
	}
	@RequestMapping("/aboutus")  
	public String aboutus()
	{
	return "aboutus";
	}

	@RequestMapping(value="/products")
	public ModelAndView products()
	{
		ModelAndView mav = new ModelAndView("products");
		
		
		
		List<Product> list = pdao.getproducts();
		
		JSONArray jarr = new JSONArray();
		
		for(Product p: list )
		{
			JSONObject jobj = new JSONObject();
			
			jobj.put("ProductId", p.getProductId());
			jobj.put("ProductName", p.getProductName() );
			jobj.put("ProductPrice", p.getPrice() );
			jobj.put("ProductQuantity", p.getQuantity() );
			jobj.put("ProductDescription", p.getProductDEscription() );
			jobj.put("Productategory", p.getCategory() );
			
			jarr.add(jobj);
		}
		
		System.out.println(jarr.toJSONString());
		
		mav.addObject("ProductJSON", jarr.toJSONString());
		
		return mav;
	}
	@RequestMapping("/addproduct")
	public ModelAndView addproduct()
	{
		ModelAndView model= new ModelAndView("addproducts");
		
		model.addObject("Product", new Product());
		
		model.addObject("catlist", cdao.getCategories());
		
		return model;
				
	}
	@RequestMapping("/updateproduct/{id}")
	public ModelAndView updateproduct( @PathVariable("id") int id )
	{
		ModelAndView model= new ModelAndView("updateproducts");
		
		model.addObject("Product", pdao.getProduct(id)  );
		
		model.addObject("catlist", cdao.getCategories());
		
		return model;
				
	}
	
	@RequestMapping(value="/AddProductToDB" , method=RequestMethod.POST)
	public String AddProductToDB( @ModelAttribute("Product") Product p ){
				
		//System.out.println(p.getproductsName());
		pdao.insert(p);
		Product i1 = pdao.getProductWithMaxId();

		System.out.println(i1.getProductId());
		try {
			String path = context.getRealPath("/");

			System.out.println(path);

			File directory = null;

		

			if (p.getFile().getContentType().contains("image")) {
				directory = new File(path + "\\resources\\images");

				System.out.println(directory);

				byte[] bytes = null;
				File file = null;
				bytes = p.getFile().getBytes();

				if (!directory.exists())
					directory.mkdirs();

				file = new File(directory.getAbsolutePath() + System.getProperty("file.separator") + "image_"
						+ i1.getProductId() + ".jpg");

				System.out.println(file.getAbsolutePath());

				BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(file));
				stream.write(bytes);
				stream.close();
				
			
			}

			i1.setImage("resources/images/image_" + i1.getProductId() + ".jpg");

			pdao.update(i1);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:/products";
	}
	
	@RequestMapping(value="/UpdateProductToDB" , method=RequestMethod.POST)
	public String UpdateProductToDB( @ModelAttribute("Product") Product p ){
				
		//System.out.println(p.getName());
		pdao.update(p);;
		
		Product i1 = p;

		
		System.out.println(i1.getProductId());
		try {
			String path = context.getRealPath("/");

			System.out.println(path);

			File directory = null;

		

			if (p.getFile().getContentType().contains("image")) {
				directory = new File(path + "\\resources\\images");

				System.out.println(directory);

				byte[] bytes = null;
				File file = null;
				bytes = p.getFile().getBytes();

				if (!directory.exists())
					directory.mkdirs();

				file = new File(directory.getAbsolutePath() + System.getProperty("file.separator") + "image_"
						+ i1.getProductId() + ".jpg");

				System.out.println(file.getAbsolutePath());

				BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(file));
				stream.write(bytes);
				stream.close();
				
			
			}

			i1.setImage("resources/images/image_" + i1.getProductId() + ".jpg");

			pdao.update(i1);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:/products";
	}
	@RequestMapping("/Viewproduct/{pid}")
	ModelAndView viewProduct(@PathVariable("pid") int pid)
	{
		
	ModelAndView modelAndview = new ModelAndView("Viewproduct");
	Product p = pdao.getProduct(pid);
	modelAndview.addObject("Product",p);
	
	return modelAndview;
	}
	@RequestMapping(value = "/addToCart" , method=RequestMethod.POST)
	public String addToCart(HttpServletRequest request) {
		
		System.out.println(request.getParameter("ProductId"));
		System.out.println(request.getParameter("productquantity"));
		int pid = Integer.parseInt(request.getParameter("ProductId"));
		int pqty = Integer.parseInt(request.getParameter("productquantity"));
		
		Cart cartItem = crdao.getCartByProductID(pid);
		
		if( cartItem == null )
		{
			Product p= pdao.getProduct(pid);
			Cart c= new Cart();
			
			c.setName(p.getProductName());
			c.setPrice(p.getPrice());
			c.setProductID(p.getProductId()+"");
			c.setQuantity(pqty+"");
			
			Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		    if (auth != null && !auth.getName().equals("anonymousUser"))
		    {    
		    	System.out.println(auth.getName());
		    	//System.out.println("User present");
		    	c.setUserName0(auth.getName());
		    }
		    else
		    {
		    	System.out.println("User not present");
		    	
		    }
		    
			crdao.add(c);
		}
		else
		{
			cartItem.setQuantity(pqty+"");
			crdao.update(cartItem);
		}
		
		
	
		return "redirect:initiateFlow";
	}
	@RequestMapping(value = "/initiateFlow", method = RequestMethod.GET)
	public String redirect(HttpServletRequest request) {

		String retval = "";

		if (request.getUserPrincipal() == null)
			retval = "redirect:/cart?user=none";
		else
			retval = "redirect:/cart?user=" + request.getUserPrincipal().getName();

		return retval;
	}
	
	
	@RequestMapping(value="/DeleteProductFromDB", method=RequestMethod.POST)
	public String DeleteProduct(@RequestParam("text") int pId){
		System.out.println(pId);
		
		//Category p = pdao.getProducts(pId);
		pdao.delete(pId);
		
		List<Cart> list = crdao.getProduct();
		
		for( Cart c : list )
		{
			if( Integer.parseInt(c.getProductID()) == pId )
			{
				crdao.delete(c.getID());
			}
		}
		
		return "redirect:/products";

		}
	@RequestMapping(value="AddUserToDB", method=RequestMethod.POST)
	public ModelAndView addSignup(@Valid @ModelAttribute("User") User u ,BindingResult bind)
	{
		System.out.println(u.getUserName());
		
		ModelAndView mav = new ModelAndView("login");

		System.out.println("In User Insert");
		
		System.out.println( bind.hasErrors() );
		
		if (bind.hasErrors()) {
			mav = new ModelAndView("signup");
			mav.addObject("User", u);
			return mav;
		} else {
			if (u.getPassword().equals(u.getConfirm_Password())) {
				List<User> list = udao.getAllUsers();

				System.out.println(list);

				boolean usermatch = false;

				for (User user : list) {
					if (user.getUserName().equals(u.getUserName())) {
						usermatch = true;
						break;
					}
				}

				if (usermatch == false) {
//					String password = u.getPassword();
//					BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
//					String hashedPassword = passwordEncoder.encode(password);
//					System.out.println(hashedPassword);
//					u.setPassword(hashedPassword);
					
					System.out.println(u.getPassword());
					
					udao.insertUser(u);

					mav.addObject("User", new User());

					mav.addObject("success", "success");
				} else
				{
					ModelAndView mav1 = new ModelAndView("signup");
					
					mav1.addObject("User", u);

					mav1.addObject("useralreadyexists", "useralreadyexists");
					
					return mav1;
				}
			} else
			{
				ModelAndView mav1 = new ModelAndView("signup");
				
				mav1.addObject("User", u);

				System.out.println("password mismatch");
				
				mav1.addObject("passwordmismatch", "passwordmismatch");
				
				return mav1;
				
				
			}

		}
		
		return mav;
		
	}
}
