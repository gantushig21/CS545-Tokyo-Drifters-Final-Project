package edu.miu.repository;

import edu.miu.domain.UserCredentials;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface UserCredentialsRepository extends CrudRepository<UserCredentials, Long> {
    public UserCredentials findByUsername(String username);
}
