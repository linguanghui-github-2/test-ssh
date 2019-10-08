package com.lin.service.impl;

import com.lin.dao.ProviderMapper;
import com.lin.pojo.Provider;
import com.lin.service.ProviderService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
@Service
public class ProviderServiceImpl implements ProviderService {
    @Resource
    ProviderMapper providerMapper;
    @Override
    public List<Provider> findProviderByProName(Provider provider,int page,int rows) throws Exception {
        return providerMapper.findProviderByProName(provider);
    }
}
