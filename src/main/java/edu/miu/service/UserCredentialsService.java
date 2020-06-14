package edu.miu.service;

import edu.miu.domain.UserCredentials;

import java.util.List;

public interface UserCredentialsService {
    public void save(UserCredentials userCredentials);
    public void update(UserCredentials userCredentials);
    public List<UserCredentials> findAll();
    public UserCredentials findOne(String id);
    public UserCredentials findByUsername(String userName);
}
