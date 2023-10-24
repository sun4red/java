package service;

public class ActionForward {

	private boolean redirect;
	private String path;
	/**
	 * @return the redirect
	 */
	public boolean isRedirect() {
		return redirect;
	}
	/**
	 * @return the path
	 */
	public String getPath() {
		return path;
	}
	/**
	 * @param redirect the redirect to set
	 */
	public void setRedirect(boolean redirect) {
		this.redirect = redirect;
	}
	/**
	 * @param path the path to set
	 */
	public void setPath(String path) {
		this.path = path;
	}
	
	
	
}
