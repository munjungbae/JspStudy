package co.kh.dev.model;

import java.sql.Date;

public class UsersVO {
	private int no; // number(5,0) not null,
	private String id;// varchar2(20) not null,
	private String pass;// varchar2(20) not null,
	private String name;// varchar2(20) not null
	private String idValue;

	public UsersVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public UsersVO(int no, String id, String pass, String name) {
		super();
		this.no = no;
		this.id = id;
		this.pass = pass;
		this.name = name;
	}
	
	public UsersVO( String id, String pass, String name) {
		super();
		this.id = id;
		this.pass = pass;
		this.name = name;
	}
	
	public UsersVO( String id, String pass, String name, String idValue) {
		super();
		this.id = id;
		this.pass = pass;
		this.name = name;
		this.idValue = idValue;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPass() {
		return pass;
	}

	public void setPass(String pass) {
		this.pass = pass;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getIdValue() {
		return idValue;
	}

	public void setIdValue(String idValue) {
		this.idValue = idValue;
	}

	@Override
	public String toString() {
		return "UsersVO [no=" + no + ", id=" + id + ", pass=" + pass + ", name=" + name + "]";
	}

}
