package com.lin.dao;

import com.lin.pojo.Bill;

import java.util.List;

public interface BillMapper {
    /**
     * 分页查询账单列表
     * @param bill
     * @return
     * @throws Exception
     */
    public List<Bill> findBillList(Bill bill)throws Exception;

}
