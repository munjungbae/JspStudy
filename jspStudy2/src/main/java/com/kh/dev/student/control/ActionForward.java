package com.kh.dev.student.control;

public class ActionForward {
	private String url;
	private boolean redirect;

	public ActionForward() {
	}

	public ActionForward(String url) {
		this.url = url;
	}

	public ActionForward(String url, boolean redirect) {
		this.url = url;
		this.redirect = redirect;
	}

	public boolean isRedirect() {
		return redirect;
	}

	public void setRedirect(boolean redirect) {
		this.redirect = redirect;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}
}
