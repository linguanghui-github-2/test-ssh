package com.lin.service;

import com.lin.pojo.Bill;

import java.util.List;

public interface BillService {
    /**
     * 分页查询账单列表
     * @param bill
     * @return
     * @throws Exception
     */
    public List<Bill> findBillList(Bill bill,int page,int rows)throws Exception;
}
