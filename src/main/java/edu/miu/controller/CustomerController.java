package edu.miu.controller;

import java.text.SimpleDateFormat;
import java.util.List;

import javax.validation.Valid;

import edu.miu.domain.Response;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import edu.miu.domain.Customer;
import edu.miu.service.CustomerService;

@Controller
@RequestMapping(value = "customer")
public class CustomerController {

	@Autowired
	CustomerService customerService;

	@RequestMapping(value = { "","/", "/list" }, method = RequestMethod.GET)
	public String displayCustomers(@RequestParam int page, @RequestParam int limit,Model model) {
		Page<Customer> customers = customerService.findAll(page, limit);
		int total = customers.getTotalPages();
        model.addAttribute("customers", customers.getContent());
        model.addAttribute("page", page);
        model.addAttribute("limit", limit);
        model.addAttribute("pages", total);
       
		return "customer-list";
	}

	@RequestMapping(value = "add", method = RequestMethod.GET)
	public String toCustomer(@ModelAttribute("newCustomer") Customer newCustomer, Model model) {
		System.out.println("works");
		return "customer-add";
	}

	@RequestMapping(value = "add", method = RequestMethod.POST)
	public String addCustomer(@Valid @ModelAttribute("newCustomer") Customer newCustomer, Model model,
			BindingResult result) {
		System.out.println(newCustomer.toString());

		if (result.hasErrors()) {
			return "customer-add";
		}

		customerService.saveCustomer(newCustomer);
		return "redirect:/customer?page=0&limit=10";
	}

	@RequestMapping(value = "details/{customerId}", method = RequestMethod.GET)
	public String addForm(@PathVariable String customerId, @ModelAttribute("updatedcustomer") Customer updatedcustomer,
			Model model) {
		System.out.println(customerId);
		Customer customer = customerService.findCustomer(Long.valueOf(customerId));
		model.addAttribute("birthday", customer.getBirthday());
		model.addAttribute("customer", customer);
		model.addAttribute("updatedcustomer", updatedcustomer);
		return "customer-details";
	}

//	@RequestMapping(value = "details/update", method = RequestMethod.POST)
//	public String updateCustomer(@Valid @ModelAttribute("updatedcustomer") Customer updatedcustomer, Model model,
//			BindingResult result) {
//
//		if (result.hasErrors()) {
//			return "customer-details";
//		}
//
//		customerService.saveCustomer(updatedcustomer);
//		Customer newcustomer = customerService.findCustomer(updatedcustomer.getId());
//		model.addAttribute("birthday",
//				new SimpleDateFormat("yyyy/MM/dd").format(updatedcustomer.getBirthday()).toString());
//		model.addAttribute("customer", newcustomer);
//		return "customer-details";
//	}

	@RequestMapping(value = "{id}", method = RequestMethod.PUT)
	public @ResponseBody Response updateCustomer(@RequestBody Customer customer) {
		System.out.println(customer);
		customerService.saveCustomer(customer);

		return new Response("success", "Updated Successful");
	}

	@RequestMapping(value = { "details/delete" }, method = RequestMethod.GET)
	public String deleteCustomer(@RequestParam("id") Long Id) {
		customerService.deleteCustomer(Id);
		return "redirect:/customer?page=0&limit=10";
	}

	@RequestMapping(value = "search", method = RequestMethod.GET)
	public @ResponseBody Customer findCustomer(@RequestParam("passportId") String passportId) {
		System.out.println("find method");
		Customer customer = customerService.findCustomerbyPassportId(passportId);
		if (customer == null) {

		}
		return customer;
	}
  
	@RequestMapping(value = "{passportId}", method = RequestMethod.GET)
	public @ResponseBody Customer getCustomerById(@PathVariable String passportId) {
		Customer customer = customerService.findCustomerbyPassportId(passportId);
    
		return customer == null ? new Customer() : customer;
	}
}
