package idm.servlet.web.controller;

import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class EsercizioController {

	@GetMapping("esercizio.html")
	public String esercizio(HttpServletRequest request, Model model) {
		System.out.println("- SEI DENTRO ESERCIZIO CONTROLLER -");

		Enumeration<String> headerNames = request.getHeaderNames();

		Map<String, String> headersMap = new HashMap<>();

		while (headerNames.hasMoreElements()) {
			String headerName = headerNames.nextElement();
			headersMap.put(headerName, request.getHeader(headerName));
		}

		model.addAttribute("headers", headersMap);

		return "esercizio";
	}
}