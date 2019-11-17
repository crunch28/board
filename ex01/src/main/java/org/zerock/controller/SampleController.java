package org.zerock.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;

import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.zerock.domain.SampleDTO;
import org.zerock.domain.SampleDTOList;
import org.zerock.domain.TodoDTO;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/sample/*")
@Log4j
public class SampleController {

	@RequestMapping("")
	public void basic() {
		log.info("basic------------");
	}

	@RequestMapping(value = "/basic", method = { RequestMethod.GET, RequestMethod.POST }) // 옛날 방식 이지만 get post put
																							// delete 늘어남
	public void basicGet() {
		log.info("basic get...............");
	}

	@GetMapping("/basicOnlyGet")
	public void basicGet2() {
		log.info("basic get only get..............");
	}

	@GetMapping("/ex01")
	public String ex01(SampleDTO dto) {
		log.info("" + dto);
		return "ex01";
	}

	@GetMapping("/ex02")
	public String ex02(@RequestParam("you") String name, @RequestParam("age") int age) { // url에서 보느낸 파라미터 이름은 you DTO에
																							// 저장되는 거는 name
		log.info("name :" + name);
		log.info("age :" + age);
		return "ex02";
	}

	@GetMapping("/ex02List") // 리스트 파라미터 수집
	public String ex02List(@RequestParam("ids") ArrayList<String> ids) {
		log.info("ids :" + ids);
		return "ex02List";
	}

	@GetMapping("/ex02Array") // 배열 파라미터 수집
	public String ex02Array(@RequestParam("ids") String[] ids) {
		log.info("array ids :" + Arrays.toString(ids));
		return "ex02Array";
	}

	@GetMapping("/ex02Bean") // 객체 파라미터 수집
	public String ex02Bean(SampleDTOList list) {
		log.info("list dtos :" + list);
		return "ex02Bean";
	}

	@InitBinder // 날짜타입 변환
	public void initBinder(WebDataBinder binder) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(java.util.Date.class, new CustomDateEditor(dateFormat, false));
	}

	@GetMapping("/ex03")
	public String ex03(TodoDTO todo) {
		log.info("todo :" + todo);
		return "ex03";
	}

	@GetMapping("/ex04") // @ModelAttribute 사용
	public String ex04(SampleDTO dto, @ModelAttribute("page") int page) {// url에 있는 page 변수를 전달
		log.info("dto : +dto");
		log.info("page :" + page);
		return "sample/ex04";
	}

	@GetMapping("/ex05") // 봔환 void
	public void ex05() {
		log.info("/ex05.........");
	}

	@GetMapping("/ex06") // 반환 json
	public @ResponseBody SampleDTO ex06() {
		log.info("/ex06.......");
		SampleDTO dto = new SampleDTO();
		dto.setAge(10);
		dto.setName("kkk");

		return dto;
	}

	@GetMapping("/ex07") //반환 http Header
	public ResponseEntity<String> ex07() {
		log.info("/ex07..........");

		String msg = "{\"name\":\"홍길동\"}";

		HttpHeaders header = new HttpHeaders();
		header.add("content-Type", "application/json;charset=UTF-8");
		return new ResponseEntity<>(msg, header, HttpStatus.OK);
	}

	@GetMapping("/exUpload")
	public void exUpload() {
		log.info("/exUpload........");
	}

	@PostMapping("/exUploadPost") // file Upload
	public void exUploadPost(ArrayList<MultipartFile> files) {
		files.forEach(file -> {
			log.info("--------------");
			log.info("name: " + file.getOriginalFilename());
			log.info("size :" + file.getSize());
		});
	}
}
