package edu.miu.controller;

import edu.miu.exception.CarNotFoundException;
import edu.miu.exception.CustomerNotFoundException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;

@ControllerAdvice
public class ControllerExceptionHandler {
    @ExceptionHandler(CustomerNotFoundException.class)
    public ModelAndView customerHandleError(CustomerNotFoundException exception) {
        ModelAndView mav = new ModelAndView();
        mav.addObject("message", exception.getMessage());
        mav.setViewName("not-found");
        return mav;
    }

    @ExceptionHandler(CarNotFoundException.class)
    public ModelAndView carHandleError(CarNotFoundException exception) {
        ModelAndView mav = new ModelAndView();
        mav.addObject("message", exception.getMessage());
        mav.setViewName("not-found");
        return mav;
    }
}
