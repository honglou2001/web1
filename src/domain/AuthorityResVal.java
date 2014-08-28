package domain;

import java.util.Collection;

public class AuthorityResVal extends BaseEntity {

	private String fid;
	private String fsysid;
	private String id;
	private String text;
	private Collection<AuthorityResVal> authotree;
	
	public String getFid() {
		return fid;
		
		
	}
	public void setFid(String fid) {
		this.fid = fid;
	}
	
	public String getFsysid() {
		return fsysid;
	}
	public void setFsysid(String fsysid) {
		this.fsysid = fsysid;
	}
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	
	public Collection<AuthorityResVal> getAuthotree() {
		return authotree;
	}
	public void setAuthotree(Collection<AuthorityResVal> authotree) {
		this.authotree = authotree;
	}
}