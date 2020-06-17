package edu.miu.exception;

public class CustomerNotFoundException extends RuntimeException {
    private static final long serialVersionUID = 9060751397339719682L;
    private Long customerId;
    private String message = "Customer Not Found for this ID ";

    public CustomerNotFoundException() {}

    public CustomerNotFoundException(Long customerId, String message) {
        if (customerId == null) {
            this.message = "Customer Not Found";
        } else {
            this.message += customerId;
        }
        this.customerId = customerId;
        if (message != null) this.message = message;
    }

    public String getMessage() {
        return message;
    }

    public Long getCustomerId() {
        return customerId;
    }
}
