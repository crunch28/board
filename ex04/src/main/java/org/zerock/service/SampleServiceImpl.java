package org.zerock.service;

import org.springframework.stereotype.Service;

@Service
public class SampleServiceImpl implements SampleService {

	//log.info(); 함수가 없음 aop로 처리
	@Override
	public Integer doAdd(String str1, String str2) throws Exception {

		return Integer.parseInt(str1) + Integer.parseInt(str2);
	}

}
