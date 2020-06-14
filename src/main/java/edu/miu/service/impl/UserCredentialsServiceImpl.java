package edu.miu.service.impl;

import edu.miu.domain.UserCredentials;
import edu.miu.repository.UserCredentialsRepository;
import edu.miu.service.UserCredentialsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;

@Service
@Transactional
public class UserCredentialsServiceImpl implements UserCredentialsService {
    @Autowired
    private UserCredentialsRepository userCredentialsRepository;

    @Autowired
    BCryptPasswordEncoder passwordEncoder;

    @Override
    @PreAuthorize("hasRole('ROLE_ADMIN')")
    public void save(UserCredentials userCredentials) {
        String encodedPassword = passwordEncoder.encode(userCredentials.getPassword());
        userCredentials.setPassword(encodedPassword);

        userCredentialsRepository.save(userCredentials);
    }

    @Override
    public void update(UserCredentials userCredentials) {
        userCredentialsRepository.save(userCredentials);
    }

    @Override
    public List<UserCredentials> findAll() {
        return (List<UserCredentials>) userCredentialsRepository.findAll();
    }

    @Override
    public UserCredentials findOne(String id) {
        Optional<UserCredentials> userCredentials = userCredentialsRepository.findById(Long.parseLong(id));

        return userCredentials.get();
    }

    @Override
    public UserCredentials findByUsername(String userName) {
        return userCredentialsRepository.findByUsername(userName);
    }
}
