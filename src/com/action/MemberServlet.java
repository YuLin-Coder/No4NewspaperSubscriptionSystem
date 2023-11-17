package com.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bean.ComBean;
import com.util.Constant;

public class MemberServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public MemberServlet() {
		super();
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

		response.setContentType(Constant.CONTENTTYPE);
		request.setCharacterEncoding(Constant.CHARACTERENCODING);
		HttpSession session = request.getSession();
		ComBean cBean = new ComBean();
		String date=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(Calendar.getInstance().getTime());
		String date2=new SimpleDateFormat("yyyy-MM-dd").format(Calendar.getInstance().getTime());
		String method = request.getParameter("method");
		if(method.equals("mreg")){ //�û�ע��
			String username = request.getParameter("username"); 
			String password = request.getParameter("password"); 
			String realname = request.getParameter("realname"); 
			String sex = request.getParameter("sex"); 
			String age = request.getParameter("age"); 
			String tel = request.getParameter("tel"); 
			String email = request.getParameter("email");
			
			if(username.equals("admin")){
				request.setAttribute("message", "�Ƿ����û�����");
				request.getRequestDispatcher("reg.jsp").forward(request, response); 
			}
			else{
				String str=cBean.getString("select id from member where username='"+username+"'");
				if(str==null){
					int flag=cBean.comUp("insert into member(username,password,realname,sex,age,tel,email,regtime) " +
							"values('"+username+"','"+password+"','"+realname+"','"+sex+"','"+age+"','"+tel+"','"+email+"','"+date2+"')");
					if(flag == Constant.SUCCESS){ 
						request.setAttribute("message", "ע��ɹ����¼��");
						request.getRequestDispatcher("login.jsp").forward(request, response); 
					}
					else { 
						request.setAttribute("message", "����ʧ�ܣ�");
						request.getRequestDispatcher("reg.jsp").forward(request, response); 
					}
				}
				else{
					request.setAttribute("message", "���û����Ѵ��ڣ�");
					request.getRequestDispatcher("reg.jsp").forward(request, response); 
				} 
			}
			
		}
		else if(method.equals("mupreg")){ //�û��޸�ע������
			String member=(String)session.getAttribute("member"); 
			String realname = request.getParameter("realname"); 
			String sex = request.getParameter("sex"); 
			String age = request.getParameter("age"); 
			String tel = request.getParameter("tel"); 
			String email = request.getParameter("email"); 
			int flag=cBean.comUp("update member set realname='"+realname+"',sex='"+sex+"',age='"+age+"'," +
					"tel='"+tel+"',email='"+email+"' where username='"+member+"'");
			if(flag == Constant.SUCCESS){ 
				request.setAttribute("message", "�����ɹ���");
				request.getRequestDispatcher("member/info/index.jsp").forward(request, response); 
			}
			else { 
				request.setAttribute("message", "����ʧ�ܣ�");
				request.getRequestDispatcher("member/info/index.jsp").forward(request, response); 
			}
		}
		else if(method.equals("mlogin")){//�û���¼ ���붼��ע�͵�Ŷ 
			String username = request.getParameter("username"); 
			String password = request.getParameter("password");   
				String str=cBean.getString("select id from member where username='"+username+"' and  password='"+password+"' and ifuse='����'");
				if(str==null){
					request.setAttribute("message", "��¼��Ϣ����");
					request.getRequestDispatcher("login.jsp").forward(request, response); 
				}
				else{
					session.setAttribute("member", username); 
					request.getRequestDispatcher("member/index.jsp").forward(request, response); 
				} 
		}
		else if(method.equals("lost")){ //��ʧ����
			String username = request.getParameter("username"); 
			String str=cBean.getString("select id from member where username='"+username+"' and ifuse='����'");
			if(str==null){
				request.setAttribute("message", "�޴��û����Ѿ�������Աͣ�ã�");
				request.getRequestDispatcher("login.jsp").forward(request, response); 
			}
			else{
				cBean.comUp("update member set password='111' where username='"+username+"'");
				request.setAttribute("message", "������Ϊ111�����¼���޸ģ�");
				request.getRequestDispatcher("index.jsp").forward(request, response);
			}  
		}
		else if(method.equals("memberexit")){ //�˳���¼
			session.removeAttribute("member");
			request.getRequestDispatcher("index.jsp").forward(request, response);
		}
		else if(method.equals("muppwd")){//�û��޸�����
			String member=(String)session.getAttribute("member"); 
			String oldpwd = request.getParameter("oldpwd"); 
			String newpwd = request.getParameter("newpwd"); 
			String str=cBean.getString("select id from member where username='"+member+"' and  password='"+oldpwd+"'");
			if(str==null){
				request.setAttribute("message", "ԭʼ������Ϣ����");
				request.getRequestDispatcher("member/info/editpwd.jsp").forward(request, response); 
			}
			else{
				int flag=cBean.comUp("update member set password='"+newpwd+"' where username='"+member+"'");
				if(flag == Constant.SUCCESS){ 
					request.setAttribute("message", "�����ɹ���");
					request.getRequestDispatcher("member/info/editpwd.jsp").forward(request, response); 
				}
				else { 
					request.setAttribute("message", "����ʧ�ܣ�");
					request.getRequestDispatcher("member/info/editpwd.jsp").forward(request, response); 
				}
			}
		}
		/////////////////////////////����Ա����
		else if(method.equals("delm")){//ɾ���û�
			String id = request.getParameter("id");  
			int flag=cBean.comUp("delete from member where id='"+id+"'");
			if(flag == Constant.SUCCESS){
				request.setAttribute("message", "�����ɹ���");
				request.getRequestDispatcher("admin/member/index.jsp").forward(request, response); 
			}
			else{
				request.setAttribute("message", "����ʧ�ܣ�");
				request.getRequestDispatcher("admin/member/index.jsp").forward(request, response); 
			}
		}
		else if(method.equals("ifusem")){//ͣ��/���� �û�
			String id = request.getParameter("id");  
			String sql="";
			String str=cBean.getString("select ifuse from member where id='"+id+"'");
			if(str.equals("����")){
				sql="update member set ifuse='ͣ��' where id='"+id+"'";
			}
			else{
				sql="update member set ifuse='����' where id='"+id+"'";
			}
			int flag=cBean.comUp(sql);
			if(flag == Constant.SUCCESS){
				request.setAttribute("message", "�����ɹ���");
				request.getRequestDispatcher("admin/member/index.jsp").forward(request, response); 
			}
			else{
				request.setAttribute("message", "����ʧ�ܣ�");
				request.getRequestDispatcher("admin/member/index.jsp").forward(request, response); 
			}
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
