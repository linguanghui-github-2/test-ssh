package com.lin.service;

import com.lin.pojo.Provider;

import java.util.List;

public interface ProviderService {
    public List<Provider> findProviderByProName(Provider providerint,int page,int rows)throws Exception;
}
