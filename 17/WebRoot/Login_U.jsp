<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<jsp:useBean id="connDB" scope="page" class="beans.connDB"/>
<jsp:useBean id="chStr" scope="page" class="beans.chStr"/>
<%
String username=chStr.chStr(request.getParameter("username"));//�˴�������б���ת�����������������û���ʱ����������
try{
	ResultSet rs=connDB.executeQuery("select * from tb_Member where username='"+username+"' and freeze=0");
	if(rs.next()){
		String PWD=request.getParameter("PWD");
		if(PWD.equals(rs.getString("password"))){
			session.setAttribute("UserName",username);
			response.sendRedirect("index.jsp");
		}else{
			out.println("<script language='javascript'>alert('��������û�������������������Ա��ϵ!');window.location.href='index.jsp';</script>");
		}
	}else{
			out.println("<script language='javascript'>alert('��������û�����������󣬻������ʻ��Ѿ������ᣬ�������Ա��ϵ!');window.location.href='index.jsp';</script>");
	}
}catch(Exception e){
	out.println("<script language='javascript'>alert('���Ĳ�������!');window.location.href='index.jsp';</script>");
}
%>