package filters;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Properties;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * Servlet Filter implementation class HttpsFilter
 */
@WebFilter("/HttpsFilter")
public class HttpsFilter implements Filter {
	ArrayList<String> pathsList = new ArrayList<String>();

    /**
     * Default constructor. 
     */
    public HttpsFilter() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		System.out.println("Inside HTTPSFILTER'S doFilter");
		
		HttpServletRequest in = (HttpServletRequest) request;
		HttpServletResponse out = (HttpServletResponse)response;

		
		/*String url = ((HttpServletRequest) request).getRequestURL().toString();
        String queryString = ((HttpServletRequest) request).getQueryString();
        String uri = ((HttpServletRequest) request).getRequestURI();
        String scheme = request.getScheme();
        String serverName = request.getServerName();
        int portNumber = request.getServerPort();
        String contextPath = ((HttpServletRequest) request).getContextPath();
        String servletPath = ((HttpServletRequest) request).getServletPath();
        String pathInfo = ((HttpServletRequest) request).getPathInfo();
        String query = ((HttpServletRequest) request).getQueryString();*/
        
        
        /*System.out.println("Url: " + url + "");
        System.out.println("Uri: " + uri + "");
        System.out.println("Scheme: " + scheme + "");
        System.out.println("Server Name: " + serverName + "");
        System.out.println("Port: " + portNumber + "");
        System.out.println("Context Path: " + contextPath + "");
        System.out.println("Servlet Path: " + servletPath + "");
        System.out.println("Path Info: " + pathInfo + "");
        System.out.println("Query: " + query);*/
		
        final String https = "https";
        final int securePort = 9443;
        String URL = https + "://" + in.getServerName() + ":" + securePort + in.getContextPath()+in.getServletPath();
     
         if (in.getScheme()!=https || in.getServerPort() != securePort){
        	for(int i = 0; i < pathsList.size(); i++){
        		if(pathsList.get(i).equals(in.getServletPath())){
        			out.sendRedirect(URL);
        			break;
        		}        			
        	}
        } else{
        		chain.doFilter(request, response);
        }
        
		
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		System.out.println("Inside HTTPSFILTER'S INIT");
		Properties p = new Properties();
		try {
			if(pathsList.size() == 0){
			p.load(Thread.currentThread().getContextClassLoader().getResourceAsStream("https.properties"));
			String[] parts = p.getProperty("path").split(",");
			for(String s : parts){
				pathsList.add(s);
			}
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}
