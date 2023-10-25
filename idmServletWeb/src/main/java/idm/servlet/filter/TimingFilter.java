package idm.servlet.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;

@WebFilter("/*")
public class TimingFilter implements Filter {

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {

		HttpServletRequest req = (HttpServletRequest) request;

		String url = req.getRequestURI();

		long t1 = System.currentTimeMillis();
		chain.doFilter(request, response);
		long t2 = System.currentTimeMillis();

		System.out.println("url " + url + "-tempo impiegato " + (t2 - t1) + "[ms]");

	}

}
