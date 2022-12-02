package vn.edu.hcmuaf.fit;

import javax.servlet.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebFilter(filterName = "Utf8", urlPatterns = "/*")
public class Utf8 implements Filter {
    public void init(FilterConfig config) throws ServletException {
    }

    public void doFilter(ServletRequest request, ServletResponse response, FilterChain filterChain) throws IOException, ServletException {
request.setCharacterEncoding("utf8");
        response.setCharacterEncoding("utf8");
       // response.getWriter().println("UTF8 Filter");
        filterChain.doFilter(request,response);
    }

    public void destroy() {
    }



}
