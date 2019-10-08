package com.lin.dao;

import com.lin.pojo.Provider;


import java.util.List;

public interface ProviderMapper {
    public List<Provider> findProviderByProName(Provider provider)throws Exception;
}
