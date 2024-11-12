package filter;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.util.*;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.io.IOException;

public class LogFilter implements Filter {

    public void init(FilterConfig config) throws ServletException {
        System.out.println("BookMarket 초기화...")
    }

    public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain) throws ServletException, IOException {
        System.out.println("접속한 클라이언트 IP: " + req.getRemoteAddr());

        long start = System.currentTimeMillis();
        System.out.println("접근한 URL: " + getURLPath(req));
        System.out.println("요청 처리 시작 시각: " + getCurrentTime());

        chain.doFilter(req, res);

        long end = System.currentTimeMillis();
        System.out.println("요청 처리 종료 시각: " + getCurrentTime());
        System.out.println("요청 처리 소요 시간: " + (end - start) + "ms");
        System.out.println("=====================================");
    }

    public void destroy() {
        System.out.println("BookMarket 종료...");
    }

    private String getURLPath(ServletRequest request) {
        HttpServletRequest req;
        String currentPath = "";
        String queryString = "";

        if (req instanceof HttpServletRequest) {
            req = (HttpServletRequest) request;
            currentPath = req.getRequestURI();
            queryString = req.getQueryString();
            queryString = (queryString == null) ? "" : "?" + queryString;
        }

        return currentPath + queryString;
    }

    private String getCurrentTime() {
        DateFormat formatter = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
        Calendar calendar = Calendar.getInstance();
        calendar.setTimeInMillis(System.currentTimeMillis());
        return formatter.format(calendar.getTime());
    }
}
