package com.kh.payment.model.service;

import static com.kh.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.payment.model.dao.PaymentDao;
import com.kh.payment.model.vo.Payment;

public class PaymentService {

	public ArrayList<Payment> selectPayment(){
		
		Connection conn = getConnection();
		ArrayList<Payment> list = new PaymentDao().selectPayment(conn);
		
		close(conn);
		return list;
	}
}
