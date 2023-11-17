package com.util;

import javax.activation.DataSource;
import java.sql.*;

public class DBO {

	private Connection conn;
	private Statement stmt;
  	private DataSource ds;
	
	public DBO()
	{
	}

	/**
		�����ݿ�
	*/
	public void open() 
	{
		try 
		{
			Class.forName("com.mysql.jdbc.Driver"); 
			conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/no4_bkzd?useUnicode=true&characterEncoding=utf8","root","123456");
			stmt=conn.createStatement();
			System.out.println("�����ݿ�����");
		} 
		catch (Exception ex) 
		{
		System.err.println("�����ݿ�ʱ����: " + ex.getMessage());
		}
	}

	/**
		�ر����ݿ⣬�����ӷ��������ӳ�
	*/
	public void close() 
	{
		try 
		{
		
				
		//	connMgr.freeConnection("java", conn);
			conn.close();
			System.out.println ("�ͷ�����");
		} 
		catch (SQLException ex) 
		{
			System.err.println("�������ӳس���: " + ex.getMessage());
		}
	}

	/**
		ִ�в�ѯ
	*/
	public ResultSet executeQuery(String sql) throws SQLException
	{
		ResultSet rs = null;
		

		rs = stmt.executeQuery(sql);
		System.out.println ("ִ�в�ѯ");
		return rs;
	}

	/**
		ִ����ɾ��
	*/
	public int executeUpdate(String sql) throws SQLException
	{
		int ret = 0;
		
	
		ret = stmt.executeUpdate(sql);
	
		System.out.println ("ִ����ɾ��");
		return ret;
	}

	/**
		��SQL�����뵽������
	*/
	public void addBatch(String sql) throws SQLException 
	{
		stmt.addBatch(sql);
	}

	/**
		ִ��������
	*/
	public int [] executeBatch() throws SQLException 
	{
		boolean isAuto=conn.getAutoCommit();
		
		conn.setAutoCommit(false);
		int [] updateCounts = stmt.executeBatch();
		
//		conn.commit();
		
//		conn.setAutoCommit(isAuto);
		//conn.setAutoCommit(true);
		return updateCounts;
	}
	public boolean getAutoCommit() throws SQLException
	{
		return conn.getAutoCommit();
	}
	public void setAutoCommit(boolean auto)  throws SQLException 
	{
		conn.setAutoCommit(auto);
	}
	
	public void commit() throws SQLException 
	{
		conn.commit();
//		this.close();
	}
	public void rollBack() throws SQLException 
	{
		conn.rollback();
//		this.close();
	}
	
}
