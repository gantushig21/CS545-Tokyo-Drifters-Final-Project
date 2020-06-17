package edu.miu.service.impl;

import edu.miu.domain.Car;
import edu.miu.repository.CarRepository;
import edu.miu.service.CarService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

@Service
@Transactional
public class CarServiceImpl implements CarService {
    @Autowired
    private CarRepository carRepository;

    @Override
    public void create(Car car) {
        car.setCreatedDate(LocalDateTime.now());
        car.setUpdatedDate(LocalDateTime.now());

        carRepository.save(car);
    }

    @Override
    public void update(Car car) {
        Car prevCar = getCarById(car.getId());
        car.setCreatedDate(prevCar.getCreatedDate());
        car.setUpdatedDate(LocalDateTime.now());

        carRepository.save(car);
    }

	@Override
    public Page<Car> getCars(int page, int limit) {
    	Pageable pageable = PageRequest.of(page,limit);
        return  carRepository.findAll(pageable);
    }

    @Override
    public void deleteById(Long carId) {
        carRepository.deleteById(carId);
    }

    @Override
    public int count() {
        return (int) carRepository.count();
    }

    @Override
    public Car getCarById(Long carId) {
        Optional<Car> car = carRepository.findById(carId);
        return car.get();
    }

}
