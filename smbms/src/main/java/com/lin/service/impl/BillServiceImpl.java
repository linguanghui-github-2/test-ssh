package com.lin.service.impl;

import com.lin.dao.BillMapper;
import com.lin.pojo.Bill;
import com.lin.service.BillService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
@Service
public class BillServiceImpl implements BillService {
    @Resource
    private BillMapper billMapper;
    /**
     * 分页查询账单列表
     *
     * @param bill
     * @param page
     * @param rows
     * @return
     * @throws Exception
     */
    @Override
    public List<Bill> findBillList(Bill bill,int page,int rows) throws Exception {
        return billMapper.findBillList(bill);
    }
}
