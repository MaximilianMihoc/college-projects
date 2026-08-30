package ie.dit.mihoc.maximilian;

import java.io.IOException;

import javax.servlet.http.*;

@SuppressWarnings("serial")
public class CloudLabtestServlet extends HttpServlet {
	public void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws IOException {
		resp.setContentType("text/plain");
		resp.getWriter().println("Hello, I am the labtest serverlet");
		
		String AString = req.getParameter("A");
		//System.out.println("A: " + AString);
		String BString = req.getParameter("B");
		//System.out.println("B: " + BString);
		String CString = req.getParameter("C");
		String DString = req.getParameter("D");
		
		if (AString == null && BString == null && CString == null && DString == null) 
		{
			//when no arguments will be supplied, the default values from web.xml file will be used  
			resp.getWriter().println("No Parameters are supplied");
			AString = getServletConfig().getInitParameter("A");
			BString = getServletConfig().getInitParameter("B");
			CString = getServletConfig().getInitParameter("C");
			DString = getServletConfig().getInitParameter("D");
		}
		else if (AString == null || BString == null || CString == null || DString == null)
		{
			//when one of the four parameters is not supplied, default values will be given 
			resp.getWriter().println("Insufficient Parameters supplied");
			if (AString == null)
				AString = getServletConfig().getInitParameter("A");
			
			if(BString == null)
				BString = getServletConfig().getInitParameter("B");
			
			if (CString == null)
				CString = getServletConfig().getInitParameter("C");
			
			if(DString == null)
				DString = getServletConfig().getInitParameter("D");
		}
		else if(!isStringFloat(AString) && !isStringFloat(BString) && !isStringFloat(CString) && !isStringFloat(DString))
		{
			//if the parameters supplied can not be casted as floats, default values given
			resp.getWriter().println("Neither parameter is a float");
			AString = getServletConfig().getInitParameter("A");
			BString = getServletConfig().getInitParameter("B");
			CString = getServletConfig().getInitParameter("C");
			DString = getServletConfig().getInitParameter("D");
		}
		else if(!isStringFloat(AString) || !isStringFloat(BString) && !isStringFloat(CString) || !isStringFloat(DString))
		{
			resp.getWriter().println("One of the supplied parameters is not a float");
			if (!(isStringFloat(AString)))
					AString = getServletConfig().getInitParameter("A");
			
			if(!(isStringFloat(BString)))
					BString = getServletConfig().getInitParameter("B");
			
			if (!(isStringFloat(CString)))
					CString = getServletConfig().getInitParameter("C");
		
			if(!(isStringFloat(DString)))
					DString = getServletConfig().getInitParameter("D");
		}
		
		float result = (Float.parseFloat(AString) - Float.parseFloat(BString)) * (Float.parseFloat(CString) - Float.parseFloat(DString));
		
		String r = "A: " + AString + ", B: " + BString + ", C: " + CString + ", D: " + DString + " (A - B) * (C - D): " + result;
		resp.getWriter().println(r);
	}
	
	public boolean isStringFloat(String s)
	{
	    try
	    {
	        Float.parseFloat(s);
	        if(s == "") return false;
	        if(s.getClass().getName() == "String") return false;
	        return true; 
	    } catch (NumberFormatException ex)
	    {
	        return false;
	    }
	}
}
