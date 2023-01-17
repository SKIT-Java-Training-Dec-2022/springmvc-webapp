package com.skit.web.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.skit.web.dao.EmployeeDao;
import com.skit.web.model.Employee;

@Controller
public class EmployeeController {

	@Autowired
	EmployeeDao dao;

	@RequestMapping("/empform")
	public String showAddEmployeeform(Model m) {
		m.addAttribute("command", new Employee());
		return "empform";
	}

	// @RequestMapping(value="/save",method=RequestMethod.POST)
	@PostMapping("/save")
	public String save(@ModelAttribute("emp") Employee emp) {
		dao.save(emp);
		return "redirect:/viewemp";// will redirect to viewemp request mapping
	}

	@RequestMapping("/viewemp")
	public String viewemp(Model m) {
		List<Employee> list = dao.getEmployees();
		m.addAttribute("employees", list);
		return "viewemp";
	}

	@RequestMapping(value = "/editemp/{id}")
	public String edit(@PathVariable int id, Model m) {
		Employee emp = dao.getEmpById(id);
		m.addAttribute("command", emp);
		return "empeditform";
	}
}
