package edu.miu.controller;

import edu.miu.domain.Car;
import edu.miu.domain.Response;
import edu.miu.service.CarService;
import edu.miu.utils.options.SelectOptions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletContext;
import javax.validation.Valid;
import java.io.File;
import java.util.List;

@Controller
@RequestMapping("/cars")
public class CarController {
    @Autowired
    private CarService carService;

    @Autowired
    ServletContext servletContext;

    @RequestMapping(value = {"/add"}, method = RequestMethod.GET)
    public String addCar(@ModelAttribute("newCar") Car car, Model model) {
//        car.setFactory("Toyota");
//        car.setModel("WX11");
//        car.setNumber("3D3 11E");
//        car.setStatus("available");
//        car.setSeats(3);
//        car.setPricePerDay(28.0);
//        car.setOverduePerDay(33.0);

        addCarSelectOptions(model);

        return "add-car";
    }

    public void addCarSelectOptions(Model model) {
        model.addAttribute("status", SelectOptions.getCarStatus());
        model.addAttribute("types", SelectOptions.getCarTypes());
    }

    @RequestMapping(value = {"/add"}, method = RequestMethod.POST)
    public String addCarProcess(@Valid @ModelAttribute("newCar") Car car, BindingResult bindingResult, Model model) {
        System.out.println(car);
        if (bindingResult.hasErrors()) {
            System.out.println("Error: " + bindingResult.getAllErrors());
            addCarSelectOptions(model);

            return "add-car";
        }

        MultipartFile carImage = car.getImage();

        System.out.println(carImage.getOriginalFilename());

        System.out.println(carImage.getContentType());

        String rootDirectory = servletContext.getRealPath("/");

        if (carImage != null && !carImage.isEmpty()) {
            try {
                String path = System.currentTimeMillis() + ".png";
                carImage.transferTo(new File(rootDirectory + File.separator + "resources" + File.separator
                        + "images" + File.separator + path));
                car.setImagePath(path);
            } catch (Exception e) {
                throw new RuntimeException("Car Image saving failed", e);
            }
        }

        carService.create(car);

        return "redirect:/cars?page=1&limit=10";
    }

    @RequestMapping(value = {"/delete"}, method = RequestMethod.GET)
    public String deleteCar(@RequestParam("id") Long carId) {
        carService.deleteById(carId);

        return "redirect:/cars?page=1&limit=10";
    }

    @RequestMapping(value = {"/detail"}, method = RequestMethod.GET)
    public String getCarDetail(@RequestParam("id") Long carId, Model model) {
        Car car = carService.getCarById(carId);

        model.addAttribute("car", car);

        return "car-detail";
    }

    @RequestMapping(value = "{id}", method = RequestMethod.PUT)
    public @ResponseBody Response updateCar(@RequestBody Car car) {
        System.out.println(car);
        carService.update(car);

        return new Response("success", "Updated Successful");
    }

    @RequestMapping(value = "", method = RequestMethod.GET)
    public String cars(@RequestParam int page, @RequestParam int limit, Model model) {
        Page<Car> cars = carService.getCars(page, limit);

        int total = carService.count();

        model.addAttribute("cars", cars);
        model.addAttribute("page", page);
        model.addAttribute("limit", limit);
        model.addAttribute("pages", (int) Math.ceil((double) total / limit));
        System.out.println(carService.getCars(page, limit));
        return "cars-list";
    }

    @RequestMapping(value = {"/list"}, method = RequestMethod.GET)
    public @ResponseBody Page<Car> carsList(@RequestParam int page, @RequestParam int limit) {
        Page<Car> cars = carService.getCars(page, limit);

        return cars;
    }
}
