package edu.miu.controller;

import edu.miu.exception.CarNotFoundException;
import edu.miu.exception.CustomerNotFoundException;
import edu.miu.utils.DomainError;
import edu.miu.utils.DomainErrors;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.support.MessageSourceAccessor;
import org.springframework.http.HttpStatus;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.ModelAndView;

@ControllerAdvice
public class ControllerExceptionHandler {

	@Autowired
	MessageSourceAccessor messageAccessor;

	@ExceptionHandler(MethodArgumentNotValidException.class)
	@ResponseStatus(HttpStatus.BAD_REQUEST)
	@ResponseBody
	public DomainErrors handleException(MethodArgumentNotValidException exception) {
		System.out.println("hello");
		List<FieldError> fieldErrors = exception.getBindingResult().getFieldErrors();

		DomainErrors errors = new DomainErrors();
		errors.setErrorType("ValidationError");
		for (FieldError fieldError : fieldErrors) {
			DomainError error = new DomainError(messageAccessor.getMessage(fieldError));
			errors.addError(error);
		}

		return errors;
	}

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
