package edu.miu.controller;

import java.text.SimpleDateFormat;
import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import edu.miu.domain.Customer;
import edu.miu.service.CustomerService;

@Controller
@RequestMapping(value = "customer")
public class CustomerController {

	@Autowired
	CustomerService customerService;

	@RequestMapping(value = { "/", "/list" }, method = RequestMethod.GET)
	public String displayCustomers(Model model) {
		List<Customer> customers = customerService.findAll();
		model.addAttribute("customers", customers);
		System.out.println("list");
		return "customer-list";
	}

	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public String toCustomer(@ModelAttribute("newCustomer") Customer newCustomer, Model model) {
		System.out.println("works");
		return "customer-add";
	}

	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public String addCustomer(@Valid @ModelAttribute("newCustomer") Customer newCustomer, Model model,
			BindingResult result) {
		System.out.println(newCustomer.toString());

		if (result.hasErrors()) {
			return "customer-add";
		}

		customerService.saveCustomer(newCustomer);
		return "redirect:list";
	}

	@RequestMapping(value = "/details/{customerId}", method = RequestMethod.GET)
	public String addForm(@PathVariable String customerId, @ModelAttribute("updatedcustomer") Customer updatedcustomer,
			Model model) {
		System.out.println(customerId);
		Customer customer = customerService.findCustomer(Long.valueOf(customerId));
		model.addAttribute("birthday", new SimpleDateFormat("yyyy/MM/dd").format(customer.getBirthday()).toString());
		model.addAttribute("customer", customer);
		return "customer-details";
	}

	@RequestMapping(value = "/details/update", method = RequestMethod.POST)
	public String updateCustomer(@Valid @ModelAttribute("updatedcustomer") Customer updatedcustomer, Model model,
			BindingResult result) {

		if (result.hasErrors()) {
			return "customer-details";
		}
		
		customerService.saveCustomer(updatedcustomer);
		Customer newcustomer = customerService.findCustomer(updatedcustomer.getId());
		model.addAttribute("birthday", new SimpleDateFormat("yyyy/MM/dd").format(updatedcustomer.getBirthday()).toString());
		model.addAttribute("customer", newcustomer);
		return "customer-details";
	}

	@RequestMapping(value = { "details/delete" }, method = RequestMethod.GET)
	public String deleteCustomer(@RequestParam("id") Long Id) {
		System.out.println(Id);
		customerService.deleteCustomer(Id);

		return "redirect:list";
	}
//	@RequestMapping(value = "/find")
//	public String findCustomer(@RequestParam("passporId") String passportId ) {
//		
//		Customer customer = customerService.findCustomerbyPassportId(passportId);
//		if(customer==null) {
//			return "";
//		}
//		return "";
//	}
//	

}
