package org.zerock.domain;

import java.util.Date;

import lombok.Data;

@Data
public class TodoDTO {

	private String title;
	private Date dueDate;
	
	/*InitBinder를 사용하지 않고 파라미터에 바로 적용할 때 사용
	@DateTimeFormat(pattern = "yyyy/MM/dd") <<<이 형식으로 url에 작성 할때 자동으로 변환
	private Date dueDate;*/
}
