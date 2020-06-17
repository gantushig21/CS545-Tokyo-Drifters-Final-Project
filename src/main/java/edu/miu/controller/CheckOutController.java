package edu.miu.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import edu.miu.domain.Car;
import edu.miu.domain.CheckOut;
import edu.miu.domain.Payment;
import edu.miu.service.CarService;
import edu.miu.service.PaymentService;

@Controller
@RequestMapping("/check-out")
@SessionAttributes("check-out")
public class CheckOutController {
	@Autowired
	private PaymentService paymentService;

	@Autowired
	private CarService carService;

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
		return "checkout-detail";
	}

	@RequestMapping(value = { "/payment" }, method = RequestMethod.GET)
	public String getAllPayemnt(Model model, @ModelAttribute("payment") Payment payment) {
		model.addAttribute("payments", paymentService.getAllPayment());
		return "payment";
	}

}
