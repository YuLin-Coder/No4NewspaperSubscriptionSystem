package com.action;

import com.bean.ComBean;
import com.util.Constant;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

public class ComServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public ComServlet() {
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
		String date=new SimpleDateFormat("yyyy-MM-dd").format(Calendar.getInstance().getTime());
		String date2=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(Calendar.getInstance().getTime());
		String method = request.getParameter("method");
		
		
		if(method.equals("addfl")){  //���ӷ���   ***********����ע��  
			String mc = request.getParameter("mc");  
			String str=cBean.getString("select id from fl where mc='"+mc+"'");
			if(str==null){
				int flag = cBean.comUp("insert into fl(mc)  values('"+mc+"' )");
				if(flag == Constant.SUCCESS){ 
					request.setAttribute("message", "�����ɹ���");
					request.getRequestDispatcher("admin/fl/index.jsp").forward(request, response);
				}
				else{
					request.setAttribute("message", "����ʧ�ܣ�");
					request.getRequestDispatcher("admin/fl/index.jsp").forward(request, response);
				} 
			}
			else{
				request.setAttribute("message", "��Ϣ�ظ�");
				request.getRequestDispatcher("admin/fl/index.jsp").forward(request, response);
			} 
		} 
		else if(method.equals("upfl")){  //�޸ķ���   ***********����ע��  
			String id = request.getParameter("id"); 
			String mc = request.getParameter("mc");  
			String str=cBean.getString("select mc from fl where mc='"+mc+"' and id!='"+id+"'");
			if(str==null){
				int flag = cBean.comUp("update fl set mc='"+mc+"' where id='"+id+"'");
				if(flag == Constant.SUCCESS){ 
					request.setAttribute("message", "�����ɹ���");
					request.getRequestDispatcher("admin/fl/index.jsp").forward(request, response);
				}
				else{
					request.setAttribute("message", "����ʧ�ܣ�");
					request.getRequestDispatcher("admin/fl/index.jsp").forward(request, response);
				} 
			}
			else{
				request.setAttribute("message", "��Ϣ�ظ�");
				request.getRequestDispatcher("admin/fl/index.jsp").forward(request, response);
			} 
		} 
		else if(method.equals("delfl")){//ɾ������
			String id = request.getParameter("id"); 
			int flag = cBean.comUp("delete from fl where id='"+id+"'");
			if(flag == Constant.SUCCESS){ 
				request.setAttribute("message", "�����ɹ���");
				request.getRequestDispatcher("admin/fl/index.jsp").forward(request, response);
			}
			else{
				request.setAttribute("message", "����ʧ�ܣ�");
				request.getRequestDispatcher("admin/fl/index.jsp").forward(request, response);
			}
		}  
		else if(method.equals("delcp")){ //ɾ���ʻ�
			String id = request.getParameter("id"); 
			int flag = cBean.comUp("delete from cp where id='"+id+"'");
			if(flag == Constant.SUCCESS){ 
				request.setAttribute("message", "�����ɹ���");
				request.getRequestDispatcher("admin/cp/index.jsp").forward(request, response);
			}
			else{
				request.setAttribute("message", "����ʧ�ܣ�");
				request.getRequestDispatcher("admin/cp/index.jsp").forward(request, response);
			}
		}   
		else if(method.equals("addxw")){  // � 
			String bt = request.getParameter("bt"); 
			String fl = request.getParameter("fl"); 
			String nr = request.getParameter("content1"); 
			if(nr==null)nr="����";
			int flag = cBean.comUp("insert into xw(bt,fl,nr,sj)  values('"+bt+"','"+fl+"','"+nr+"','"+date+"')");
			if(flag == Constant.SUCCESS){ 
				request.setAttribute("message", "�����ɹ���");
				request.getRequestDispatcher("admin/xw/index.jsp").forward(request, response);
			}
			else{
				request.setAttribute("message", "����ʧ�ܣ�");
				request.getRequestDispatcher("admin/xw/index.jsp").forward(request, response);
			} 
		} 
		else if(method.equals("upxw")){ //�޸� � 
			String id=request.getParameter("id");
			String bt = request.getParameter("bt"); 
			String fl = request.getParameter("fl"); 
			String nr = request.getParameter("content1"); 
			if(nr==null)nr="����";
			int flag = cBean.comUp("update xw set bt='"+bt+"',fl='"+fl+"',nr='"+nr+"' where id='"+id+"'");
			if(flag == Constant.SUCCESS){ 
				request.setAttribute("message", "�����ɹ���");
				request.getRequestDispatcher("admin/xw/index.jsp").forward(request, response);
			}
			else{
				request.setAttribute("message", "����ʧ�ܣ�");
				request.getRequestDispatcher("admin/xw/index.jsp").forward(request, response);
			}  
		} 
		else if(method.equals("delxw")){//ɾ�� �
			String id = request.getParameter("id"); 
			int flag = cBean.comUp("delete from xw where id='"+id+"'");
			if(flag == Constant.SUCCESS){ 
				request.setAttribute("message", "�����ɹ���");
				request.getRequestDispatcher("admin/xw/index.jsp").forward(request, response);
			}
			else{
				request.setAttribute("message", "����ʧ�ܣ�");
				request.getRequestDispatcher("admin/xw/index.jsp").forward(request, response);
			}
		}  
		 
		else if(method.equals("addcs")){  // �ʻ���Ѷ 
			String bt = request.getParameter("bt"); 
			String fl = request.getParameter("fl"); 
			String nr = request.getParameter("content1"); 
			if(nr==null)nr="����";
			int flag = cBean.comUp("insert into cs(bt,fl,nr,sj)  values('"+bt+"','"+fl+"','"+nr+"','"+date+"')");
			if(flag == Constant.SUCCESS){ 
				request.setAttribute("message", "�����ɹ���");
				request.getRequestDispatcher("admin/cs/index.jsp").forward(request, response);
			}
			else{
				request.setAttribute("message", "����ʧ�ܣ�");
				request.getRequestDispatcher("admin/cs/index.jsp").forward(request, response);
			} 
		} 
		else if(method.equals("upcs")){ //�޸� �ʻ���Ѷ 
			String id=request.getParameter("id");
			String bt = request.getParameter("bt"); 
			String fl = request.getParameter("fl"); 
			String nr = request.getParameter("content1"); 
			if(nr==null)nr="����";
			int flag = cBean.comUp("update cs set bt='"+bt+"',fl='"+fl+"',nr='"+nr+"' where id='"+id+"'");
			if(flag == Constant.SUCCESS){ 
				request.setAttribute("message", "�����ɹ���");
				request.getRequestDispatcher("admin/cs/index.jsp").forward(request, response);
			}
			else{
				request.setAttribute("message", "����ʧ�ܣ�");
				request.getRequestDispatcher("admin/cs/index.jsp").forward(request, response);
			}  
		} 
		else if(method.equals("delcs")){//ɾ�� �ʻ���Ѷ
			String id = request.getParameter("id"); 
			int flag = cBean.comUp("delete from cs where id='"+id+"'");
			if(flag == Constant.SUCCESS){ 
				request.setAttribute("message", "�����ɹ���");
				request.getRequestDispatcher("admin/cs/index.jsp").forward(request, response);
			}
			else{
				request.setAttribute("message", "����ʧ�ܣ�");
				request.getRequestDispatcher("admin/cs/index.jsp").forward(request, response);
			}
		}  
		
		
		
		 
		
		else if(method.equals("dc")){  //�ӹ��ﳵ
			String member=(String)session.getAttribute("member");
			String id = request.getParameter("id");   
			String lx = request.getParameter("lx");   
			if(member==null){
				request.setAttribute("id", id);
				request.setAttribute("message", "���ȵ�¼��");
				request.getRequestDispatcher("cpinfo.jsp").forward(request, response);
			}
			else{
				String str=cBean.getString("select id from gwc where cpid='"+id+"' and member='"+member+"' and ddbh='����'");
				if(str==null){
					String cpmc=cBean.getString("select mc from cp where id='"+id+"'");
					String fl=cBean.getString("select fl from cp where id='"+id+"'");
					String jg=cBean.getString("select jg from cp where id='"+id+"'");
					int jgtemp=0;
					if(lx.equals("��")){
						jgtemp=Integer.parseInt(jg);
					}
					else if(lx.equals("ji")){
						jgtemp=Integer.parseInt(jg)*3;
					}
					else{
						jgtemp=Integer.parseInt(jg)*12;
					}
					float zj=0;
					int sl=1; 
					zj=sl*Float.parseFloat(jg); 
					int flag = cBean.comUp("insert into gwc(cpid,cpmc,sl,jg,zj,member,fl,sj) " +
							"values('"+id+"','"+cpmc+"','1','"+jgtemp+"','"+jgtemp+"','"+member+"','"+fl+"','"+date+"')");
					if(flag == Constant.SUCCESS){ 
						request.setAttribute("id", id);
						request.setAttribute("message", "�����ɹ���");
						request.getRequestDispatcher("cpinfo.jsp").forward(request, response);
					}
					else{
						request.setAttribute("id", id);
						request.setAttribute("message", "����ʧ�ܣ�");
						request.getRequestDispatcher("cpinfo.jsp").forward(request, response);
					} 
				}
				else{
					request.setAttribute("id", id);
					request.setAttribute("message", "�����ظ�ѡ���޸��������ڹ��ﳵ���޸ģ�");
					request.getRequestDispatcher("cpinfo.jsp").forward(request, response);
				} 
			} 
		} 
		else if(method.equals("delgwc")){ 
			String proId = request.getParameter("proId"); 
			int flag = cBean.comUp("delete from gwc where id='"+proId+"'");
			if(flag == Constant.SUCCESS){ 
				request.setAttribute("message", "�����ɹ���");
				request.getRequestDispatcher("gwc.jsp").forward(request, response);
			}
			else{
				request.setAttribute("message", "����ʧ�ܣ�");
				request.getRequestDispatcher("gwc.jsp").forward(request, response);
			}
		}
		else if(method.equals("upgwc")){ //�޸����� 
			String proId=request.getParameter("proId");
			String count = request.getParameter("count");  
			
			float zj=0;
			int sl=Integer.parseInt(count);
			
			String cpid=cBean.getString("select cpid from gwc where id='"+proId+"'");
			String jg=cBean.getString("select jg from gwc where id='"+proId+"'"); 
			zj=sl*Float.parseFloat(jg);  
		 
				int flag = cBean.comUp("update gwc set sl='"+count+"',jg='"+jg+"',zj='"+zj+"' where id='"+proId+"'");
				if(flag == Constant.SUCCESS){ 
					request.setAttribute("message", "�����ɹ���");
					request.getRequestDispatcher("gwc.jsp").forward(request, response);
				}
				else{
					request.setAttribute("message", "����ʧ�ܣ�");
					request.getRequestDispatcher("gwc.jsp").forward(request, response);
				}  
			
		} 
		else if(method.equals("tjdd")){ //�ύ���� 1500������95��   ��2000������9��
			String member=(String)session.getAttribute("member");
			String xm=request.getParameter("xm");
			String fkfs=request.getParameter("fkfs");
			String dz=request.getParameter("dz");
			String lxdh=request.getParameter("lxdh");
			long ddbh=System.currentTimeMillis();
			float zj=cBean.getFloat("select sum(zj) from gwc where member='"+member+"' and ddbh='����'"); 
			String str=""; 
			int flag = cBean.comUp("insert into dd(ddbh,zj,dj,xm,fkfs,dz,lxdh,member,sj) " +
					" values('"+ddbh+"','"+zj+"','0','"+xm+"','"+fkfs+"','"+dz+"','"+lxdh+"','"+member+"','"+date2+"')");
			if(flag == Constant.SUCCESS){  
				cBean.comUp("update gwc set ddbh='"+ddbh+"' where member='"+member+"' and ddbh='����'");
				request.setAttribute("message", "�����ɹ������ڻ�Ա���Ĳ鿴������"+str);
				request.getRequestDispatcher("ewm.jsp").forward(request, response);
			}
			else{ 
				request.setAttribute("message", "����ʧ�ܣ�");
				request.getRequestDispatcher("gwc.jsp").forward(request, response);
			}  
		}
		else if(method.equals("ewm")){
			request.setAttribute("message", "�����ɹ���");
			request.getRequestDispatcher("ewm.jsp").forward(request, response);
		}
		else if(method.equals("qxdd")){//ȡ�� ����
			String id = request.getParameter("id"); 
			//String ddbh=cBean.getString("select ddbh from dd where id='"+id+"'");
			
			String date1=cBean.getString("select sj from dd where id='"+id+"'");
			//String d2=date2;
			java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			long xs=0;
			try{
				Date d1=formatter.parse(date1);
				Date d2 = formatter.parse(date2); 
				long diff = d2.getTime() - d1.getTime();
				//long days = diff / (1000 * 60 * 60 * 24); 
				xs = diff / (1000 * 60 * 60 ); 
			}
			catch(Exception e){
				e.printStackTrace();
			}
			System.out.println(xs+"------");
			if(xs<2){
				int flag = cBean.comUp("update dd set qx='��ȡ��' where id='"+id+"'");
				if(flag == Constant.SUCCESS){ 
					//cBean.comUp("delete from gwc where ddbh='"+ddbh+"'");
					request.setAttribute("message", "�����ɹ���");
					request.getRequestDispatcher("member/dd/index.jsp").forward(request, response);
				}
				else{
					request.setAttribute("message", "����ʧ�ܣ�");
					request.getRequestDispatcher("member/dd/index.jsp").forward(request, response);
				}
			}
			else{
				request.setAttribute("message", "����2Сʱ����ȡ����");
				request.getRequestDispatcher("member/dd/index.jsp").forward(request, response);
			} 
		} 
		else if(method.equals("xfqr")){//����
			String id = request.getParameter("id");  
			String xfqr=cBean.getString("select xfqr from dd where id='"+id+"'");
			if(xfqr.equals("δ����")){
				int flag = cBean.comUp("update dd set xfqr='�ѷ���' where id='"+id+"'");
				if(flag == Constant.SUCCESS){  
					request.setAttribute("message", "�����ɹ���");
					request.getRequestDispatcher("admin/dd/index.jsp").forward(request, response);
				}
				else{
					request.setAttribute("message", "����ʧ�ܣ�");
					request.getRequestDispatcher("admin/dd/index.jsp").forward(request, response);
				}
			}
			else{
				request.setAttribute("message", "��Ҫ�ظ�������");
				request.getRequestDispatcher("admin/dd/index.jsp").forward(request, response);
			} 
		} 
		else if(method.equals("xfqr2")){//����
			String id = request.getParameter("id");  
			String xfqr=cBean.getString("select xfqr from dd where id='"+id+"'");
			if(xfqr.equals("δ����")){
				int flag = cBean.comUp("update dd set xfqr='�ѷ���' where id='"+id+"'");
				if(flag == Constant.SUCCESS){  
					request.setAttribute("message", "�����ɹ���");
					request.getRequestDispatcher("admin/main.jsp").forward(request, response);
				}
				else{
					request.setAttribute("message", "����ʧ�ܣ�");
					request.getRequestDispatcher("admin/main.jsp").forward(request, response);
				}
			}
			else{
				request.setAttribute("message", "��Ҫ�ظ�������");
				request.getRequestDispatcher("admin/main.jsp").forward(request, response);
			} 
		} 
		else if(method.equals("deldd")){//ɾ�� ����
			String id = request.getParameter("id"); 
			String ddbh=cBean.getString("select ddbh from dd where id='"+id+"'");
			int flag = cBean.comUp("delete from dd where id='"+id+"'");
			if(flag == Constant.SUCCESS){ 
				cBean.comUp("delete from gwc where ddbh='"+ddbh+"'");
				request.setAttribute("message", "�����ɹ���");
				request.getRequestDispatcher("member/dd/index.jsp").forward(request, response);
			}
			else{
				request.setAttribute("message", "����ʧ�ܣ�");
				request.getRequestDispatcher("member/dd/index.jsp").forward(request, response);
			}
		} 
		else if(method.equals("deldd2")){//ɾ�� ����
			String id = request.getParameter("id"); 
			String ddbh=cBean.getString("select ddbh from dd where id='"+id+"'");
			int flag = cBean.comUp("delete from dd where id='"+id+"'");
			if(flag == Constant.SUCCESS){ 
				cBean.comUp("delete from gwc where ddbh='"+ddbh+"'");
				request.setAttribute("message", "�����ɹ���");
				request.getRequestDispatcher("admin/dd/index.jsp").forward(request, response);
			}
			else{
				request.setAttribute("message", "����ʧ�ܣ�");
				request.getRequestDispatcher("admin/dd/index.jsp").forward(request, response);
			}
		} 
		else if(method.equals("deldd22")){//ɾ�� ����
			String id = request.getParameter("id"); 
			String ddbh=cBean.getString("select ddbh from dd where id='"+id+"'");
			int flag = cBean.comUp("delete from dd where id='"+id+"'");
			if(flag == Constant.SUCCESS){ 
				cBean.comUp("delete from gwc where ddbh='"+ddbh+"'");
				request.setAttribute("message", "�����ɹ���");
				request.getRequestDispatcher("admin/main.jsp").forward(request, response);
			}
			else{
				request.setAttribute("message", "����ʧ�ܣ�");
				request.getRequestDispatcher("admin/main.jsp").forward(request, response);
			}
		} 
		else if(method.equals("addpj")){  //����    
			String id = request.getParameter("id");  
			String member=(String)session.getAttribute("member");
			String pf = request.getParameter("pf");     
			String nr = request.getParameter("nr");     
			String str=cBean.getString("select id from pj where cpid='"+id+"' and member='"+member+"'");
			if(str==null){
				//---------------�˴�����ж� �Ƿ����
				List list = cBean.getCom("select * from gwc where cpid='"+id+"' and member='"+member+"' and ddbh!='����' order by id desc",5); 
				if(list.isEmpty()){
					request.setAttribute("id", id);
					request.setAttribute("message", "ֻ�й�������û��������ۣ�");
					request.getRequestDispatcher("cpinfo.jsp").forward(request, response);
				}
				else{
					int flag = cBean.comUp("insert into pj(cpid,pf,nr,member,sj)  values('"+id+"','"+pf+"','"+nr+"','"+member+"','"+date+"')");
					if(flag == Constant.SUCCESS){ 
						request.setAttribute("id", id);
						request.setAttribute("message", "�����ɹ���");
						request.getRequestDispatcher("cpinfo.jsp").forward(request, response);
					}
					else{
						request.setAttribute("id", id);
						request.setAttribute("message", "����ʧ�ܣ�");
						request.getRequestDispatcher("cpinfo.jsp").forward(request, response);
					}  
				} 
			}
			else{
				request.setAttribute("id", id);
				request.setAttribute("message", "�벻Ҫ�ظ����ۣ�");
				request.getRequestDispatcher("cpinfo.jsp").forward(request, response);
			} 
		} 
		else if(method.equals("delpj")){//ɾ������
			String id = request.getParameter("id"); 
			int flag = cBean.comUp("delete from pj where id='"+id+"'");
			if(flag == Constant.SUCCESS){ 
				request.setAttribute("message", "�����ɹ���");
				request.getRequestDispatcher("admin/pj/index.jsp").forward(request, response);
			}
			else{
				request.setAttribute("message", "����ʧ�ܣ�");
				request.getRequestDispatcher("admin/pj/index.jsp").forward(request, response);
			}
		}
		
		else if(method.equals("gy")){ //�������� 
			String mc=request.getParameter("mc");
			String nr = request.getParameter("content1");  
			int flag = cBean.comUp("update gy set nr='"+nr+"',mc='"+mc+"' ");
			if(flag == Constant.SUCCESS){ 
				request.setAttribute("message", "�����ɹ���");
				request.getRequestDispatcher("admin/xw/gy.jsp").forward(request, response);
			}
			else{
				request.setAttribute("message", "����ʧ�ܣ�");
				request.getRequestDispatcher("admin/xw/gy.jsp").forward(request, response);
			} 
		} 
		else if(method.equals("lxfs")){  
			String lxr=request.getParameter("lxr");
			String dh = request.getParameter("dh");  
			String dz = request.getParameter("dz");  
			int flag = cBean.comUp("update lx set lxr='"+lxr+"',dh='"+dh+"',dz='"+dz+"' ");
			if(flag == Constant.SUCCESS){ 
				request.setAttribute("message", "�����ɹ���");
				request.getRequestDispatcher("admin/lx/index.jsp").forward(request, response);
			}
			else{
				request.setAttribute("message", "����ʧ�ܣ�");
				request.getRequestDispatcher("admin/lx/index.jsp").forward(request, response);
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
