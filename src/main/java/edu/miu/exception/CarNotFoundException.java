package edu.miu.exception;

public class CarNotFoundException extends RuntimeException {
    private static final long serialVersionUID = 9060751397339719682L;
    private Long carId;
    private String message = "Car Not Found for this ID ";

    public CarNotFoundException() {
    }

    public CarNotFoundException(Long carId, String message) {
        if (carId == null) {
            this.message = "Car Not Found";
        } else {
            this.message += carId;
        }
        this.carId = carId;
        if (message != null) this.message = message;
    }

    public String getMessage() {
        return message + carId;
    }

    public Long getCarId() {
        return carId;
    }
}
