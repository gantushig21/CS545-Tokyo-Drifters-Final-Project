package edu.miu.repository;

import edu.miu.domain.Car;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.repository.query.Param;

public interface CarRepository extends PagingAndSortingRepository<Car, Long> {
	@Override
	Page<Car> findAll(Pageable pageable);

	@Modifying
	@Query("UPDATE Car c SET c.status = :status WHERE c.id = :id")
	public void changeCarStatusById(@Param("id") Long id, @Param("status") String status);
}
