package edu.miu.controller;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import edu.miu.domain.Car;
import edu.miu.domain.CheckOut;
import edu.miu.domain.Customer;
import edu.miu.domain.Payment;
import edu.miu.service.CarService;
import edu.miu.service.CheckOutService;
import edu.miu.service.CustomerService;
import edu.miu.service.PaymentService;

@Controller
@RequestMapping("/check-out")
@SessionAttributes("check-out")
public class CheckOutController {
	@Autowired
	private PaymentService paymentService;

	@Autowired
	private CarService carService;
	
	@Autowired
	private CustomerService customerService;
	
	@Autowired
	private CheckOutService checkOutService;

	@RequestMapping(value = "", method = RequestMethod.GET)
	public String renderCheckOut(@RequestParam("carId") Long carId, Model model) {
		Car car = carService.getCarById(carId);
		CheckOut checkOut = new CheckOut();
		checkOut.setCar(car);
		model.addAttribute("check-out", checkOut);
		return "searchUser";
	}

	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public String renderCheckOutDetail(Model model) {
		CheckOut checkOut = (CheckOut) (((ModelMap) model).get("check-out"));
		model.addAttribute("car", checkOut.getCar());
		model.addAttribute("customer", checkOut.getCustomer());
		return "checkout-detail";
	}

	@RequestMapping(value = { "/payment" }, method = RequestMethod.GET)
	public String getAllPayemnt(Model model, @ModelAttribute("payment") Payment payment) {
		model.addAttribute("payments", paymentService.getAllPayment());
		return "payment";
	}
	
	@RequestMapping(value = { "/payment/{id}" }, method = RequestMethod.POST)
	public String addPayment(Model model, @PathVariable("id") Long id) {
		CheckOut checkOut = (CheckOut) (((ModelMap) model).get("check-out"));
		Payment payment = paymentService.findPayment(id);
		checkOut.setPaymentType(payment);
		model.addAttribute("check-out", checkOut);
		checkOutService.saveCheckOut(checkOut);
		return "redirect:/check-out/thank-you";
	}
	
	@RequestMapping(value = { "/thank-you" }, method = RequestMethod.GET)
	public String renderThankYou(SessionStatus status) {
		status.setComplete();
		return "thank-you";
	}
	
	@RequestMapping(value = "/find", method = RequestMethod.GET)
	@ResponseBody
	public Customer findCustomer(@RequestParam("passportId") String passportId,Model model ) {
		CheckOut checkOut = (CheckOut) (((ModelMap) model).get("check-out"));
		Customer customer = customerService.findCustomerbyPassportId(passportId);
		checkOut.setCustomer(customer);
		model.addAttribute("check-out", checkOut);
		if(customer==null) {
			return null;
		}
		return customer;
	}
	
	@RequestMapping(value = "/add-user", method = RequestMethod.POST)
	@ResponseBody
	public Customer addCustomerFromCheckOut(@Valid @RequestBody Customer newCustomer, Model model) {
		CheckOut checkOut = (CheckOut) (((ModelMap) model).get("check-out"));
		Customer customer = customerService.saveCustomer(newCustomer);
		checkOut.setCustomer(customer);
		model.addAttribute("check-out", checkOut);
		return customer;
	}

}
