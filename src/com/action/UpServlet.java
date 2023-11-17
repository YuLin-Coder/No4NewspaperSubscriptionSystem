package com.action;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bean.ComBean;
import com.util.Constant;
import com.util.SmartFile;
import com.util.SmartUpload;

public class UpServlet extends HttpServlet {

	private ServletConfig config;
	/**
	 * Constructor of the object.
	 */
	public UpServlet() {
		super();
	}

	final public void init(ServletConfig config) throws ServletException
    {
        this.config = config;  
    }

    final public ServletConfig getServletConfig()
    {
        return config;
    }
	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request,response);
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding(Constant.CHARACTERENCODING);
		response.setContentType(Constant.CONTENTTYPE);
		String date=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(Calendar.getInstance().getTime());
		String date2=new SimpleDateFormat("yyyy-MM-dd").format(Calendar.getInstance().getTime());
		String method = "";;
		ComBean cb = new ComBean(); 
		SmartUpload mySmartUpload = new SmartUpload();//init
		int count = 0;
		HttpSession session = request.getSession();
		try{
			mySmartUpload.initialize(config,request,response);
            mySmartUpload.upload(); 
            method = mySmartUpload.getRequest().getParameter("method").trim();
            if(method.equals("addcp")){// 上传  
            	String mc = mySmartUpload.getRequest().getParameter("mc");  
            	String fl = mySmartUpload.getRequest().getParameter("fl"); 
            	String zz = mySmartUpload.getRequest().getParameter("zz");  
            	String cbs = mySmartUpload.getRequest().getParameter("cbs");   
            	String jg = mySmartUpload.getRequest().getParameter("jg");  
            	String nr = mySmartUpload.getRequest().getParameter("content1"); 
            	if(nr==null||nr.equals(""))nr="暂无"; 
            	String fs = mySmartUpload.getRequest().getParameter("fs");   
            	String sl = mySmartUpload.getRequest().getParameter("sl");   
            	String tj = mySmartUpload.getRequest().getParameter("tj");   
            	SmartFile file = mySmartUpload.getFiles().getFile(0); 
            	String fileExt=file.getFileExt();	            
            	String path="pic";
            	count = mySmartUpload.save(path);   
            	String str=cb.getString("select fl from cp where mc='"+mc+"'");
            	if(str==null){
            		int flag=cb.comUp("insert into cp(mc,fl,yfl,efl,jg,url,nr,fs,sl,tj) " +
            				"values('"+mc+"','"+fl+"','"+zz+"','"+cbs+"','"+jg+"','"+path+"/"+file.getFileName()+"','"+nr+"','"+fs+"','"+sl+"','"+tj+"')");
    				if(flag == Constant.SUCCESS){ 
    					request.setAttribute("message", "操作成功！");
    					request.getRequestDispatcher("admin/cp/index.jsp").forward(request, response); 
    				}
    				else { 
    					request.setAttribute("message", "操作失败！");
    					request.getRequestDispatcher("admin/cp/index.jsp").forward(request, response); 
    				}  
            	}
            	else{
            		request.setAttribute("message", "信息重复！");
					request.getRequestDispatcher("admin/cp/index.jsp").forward(request, response); 
            	} 
            } 					
            else if(method.equals("upcp")){//修改 
            	String id = mySmartUpload.getRequest().getParameter("id");
            	String mc = mySmartUpload.getRequest().getParameter("mc");  
            	String fl = mySmartUpload.getRequest().getParameter("fl"); 
            	String zz = mySmartUpload.getRequest().getParameter("zz");  
            	String cbs = mySmartUpload.getRequest().getParameter("cbs");  
            	String jg = mySmartUpload.getRequest().getParameter("jg");   
            	String nr = mySmartUpload.getRequest().getParameter("content1"); 
            	if(nr==null||nr.equals(""))nr="暂无";
            	String fs = mySmartUpload.getRequest().getParameter("fs");   
            	String sl = mySmartUpload.getRequest().getParameter("sl");   
            	String tj = mySmartUpload.getRequest().getParameter("tj");  
            	SmartFile file = mySmartUpload.getFiles().getFile(0); 
            	String fileExt=file.getFileExt();	            
            	String path="pic";
            	count = mySmartUpload.save(path); 
            	if(count==0){
            		String str=cb.getString("select fl from cp where mc='"+mc+"' and id!='"+id+"'");
                	if(str==null){
                		int flag=cb.comUp("update cp set mc='"+mc+"',fl='"+fl+"',yfl='"+zz+"',efl='"+cbs+"',jg='"+jg+"',nr='"+nr+"',fs='"+fs+"',sl='"+sl+"',tj='"+tj+"' where id='"+id+"'");
        				if(flag == Constant.SUCCESS){ 
        					request.setAttribute("message", "操作成功！");
        					request.getRequestDispatcher("admin/cp/index.jsp").forward(request, response); 
        				}
        				else { 
        					request.setAttribute("message", "操作失败！");
        					request.getRequestDispatcher("admin/cp/index.jsp").forward(request, response); 
        				}
                	}
                	else{
                		request.setAttribute("message", "信息重复！");
    					request.getRequestDispatcher("admin/cp/index.jsp").forward(request, response); 
                	}  
            	}
            	else{ 
            		String str=cb.getString("select fl from cp where mc='"+mc+"' and id!='"+id+"'");
                	if(str==null){
                		int flag = cb.comUp("update cp set mc='"+mc+"',fl='"+fl+"',yfl='"+zz+"',efl='"+cbs+"',jg='"+jg+"',url='"+path+"/"+file.getFileName()+"',nr='"+nr+"',fs='"+fs+"',sl='"+sl+"',tj='"+tj+"' where id='"+id+"' ");
                		if(flag == Constant.SUCCESS){ 
        					request.setAttribute("message", "操作成功！");
        					request.getRequestDispatcher("admin/cp/index.jsp").forward(request, response); 
        				}
        				else { 
        					request.setAttribute("message", "操作失败！");
        					request.getRequestDispatcher("admin/cp/index.jsp").forward(request, response); 
        				}
                	}
                	else{
                		request.setAttribute("message", "信息重复！");
    					request.getRequestDispatcher("admin/cp/index.jsp").forward(request, response); 
                	}  
            	}                    
            } 
		}catch(Exception e){
			e.printStackTrace();
			request.getRequestDispatcher("error.jsp").forward(request, response);
		}
	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occure
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
